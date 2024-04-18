import SwiftUI

struct PoopClasificador: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @ObservedObject var classifier: ImageClassifier
    
    
    var body: some View {
        ZStack {
            Color(Color(red: 0.96, green: 0.96, blue: 0.97))
            
            ZStack (alignment: .top){
                wave2TrackerDormir()
                    .foregroundColor(Color(red: 0.95, green: 0.77, blue: 0.75))
                    .frame(width: 412, height: 120)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                wave1TrackerDormir()
                    .foregroundColor(Color(red: 0.96, green: 0.86, blue: 0.85))
                    .frame(width: 412, height: 100)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }.ignoresSafeArea()
            
            
            VStack{
                HStack{
                    Spacer()
                    Image(systemName: "photo")
                        .foregroundColor(Color(red: 0.95, green: 0.77, blue: 0.75))
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .photoLibrary
                        }
                    Spacer()
                    Image(systemName: "camera")
                        .foregroundColor(Color(red: 0.95, green: 0.77, blue: 0.75))
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .camera
                        }
                    Spacer()
                }
                .font(.title)
                .foregroundColor(.blue)
                
                Rectangle()
                    .strokeBorder(lineWidth: 5)
                    .foregroundColor(Color(red: 0.95, green: 0.77, blue: 0.75))
                    .frame(width: 300, height: 400)
                    .overlay(
                        Group {
                            if uiImage != nil {
                                Image(uiImage: uiImage!)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    )
                
                
                VStack{
                    Button(action: {
                        if uiImage != nil {
                            classifier.detect(uiImage: uiImage!)
                        }
                    }) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.orange)
                            .font(.title)
                    }
                    
                    
                    Group {
                        if let imageClass = classifier.imageClass {
                            
                            VStack {
                                HStack{
                                    Text("El pañal del bebé muestra: \n")
                                        .font(.system(size: 14))
                                        .multilineTextAlignment(.center)
                                    Text(imageClass)
                                        .bold()
                                        .font(.system(size: 18))
                                }
                                ZStack{
                                    Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(maxWidth:.infinity)
                                    .background(.white)

                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    
                                    Text(customText(for: imageClass))
                                            .font(.body)
                                            .foregroundColor(.black)
                                            .font(.system(size: 18))
                                }
                                
                                
                            }
                        } else {
                            HStack{
                                Text("El pañal del bebé muestra:\n NA")
                                    .font(.system(size: 14))
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .font(.subheadline)
                    .padding()
                    
                }
            }
            
            .sheet(isPresented: $isPresenting){
                ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                    .onDisappear{
                        if uiImage != nil {
                            classifier.detect(uiImage: uiImage!)
                        }
                    }
                
            }
            
            
            
            
            
            
        .padding()
        }
    }
}


func customText(for classification: String) -> String {
    switch classification {
        case "Saludable":
            return "El pañal muestra una popó saludable.Aun asi sigue monitoriando la dieta de tu bebé."
        case "Enfermo":
            return "Consulte a tu medico."
        case "Meconio":
            return "Las primeras popós de un bebé, conocido como meconio, es normal."
        case "Orina":
            return "Solo un pañal con orina, ¡no hay de que preocuparse! :)"
        default:
            return ""
    }
}



struct PoopClasificador_Previews: PreviewProvider {
    static var previews: some View {
        PoopClasificador(classifier: ImageClassifier())
    }
}



