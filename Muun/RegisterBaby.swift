//
//  RegisterBaby.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 12/10/23.
//

import SwiftUI

struct RegisterBaby: View {
    @Environment(ViewModel.self) var viewModel
    @State private var lastnameBaby: String = ""
    @State private var nameBaby: String = ""
    @State private var genderBaby: String = ""
    @State private var birthdate = Date()
    @State private var isPasswordVisible: Bool = false
    @State private var alturaBaby: Float = 0.0
    @State private var pesoBaby: Float = 0.0
    @State private var alturaString: String = ""
    @State private var pesoString: String = ""
    @State private var NavigateToperfilmom = false
    @State private var showAlert = false
    @State private var alertMessage: String = ""
    @Binding var momId: UUID?
    @State private var mom: MomData?
    
    var body: some View {
        NavigationView(){
            ZStack{
                BackGroundBaby()
                VStack{
                    ZStack{
                        Circle()
                            .frame(width: 160,height: 160)
                            .foregroundColor(.white)
                            .offset(y:8)
                        Image("ImageBaby")
                            .resizable()
                            .frame(width: 150,height: 150)
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fill)
                            .padding(.top)
                    }
                    .padding(.bottom,20)
                    VStack(alignment: .leading, spacing: 15){
                        Text("Información del bebé")
                            .font(
                                .title
                            )
                            .fontWeight(.semibold)
                            .padding(.top,10)
                            .padding(.horizontal,15)
                        
                        Text("Crea una cuenta nueva")
                            .font(.callout)
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .padding(.horizontal,15)
                            .padding(.top,-5)
                        
                        TextField("Nombre", text: $nameBaby)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .overlay(
                                Divider()
                                    .padding(.horizontal,10), alignment: .bottom
                            )
                            .padding(.horizontal, 10)
                            
                        TextField("Apellido", text: $lastnameBaby)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .overlay(
                                Divider()
                                    .padding(.horizontal,10), alignment: .bottom
                            )
                            .padding(.horizontal, 10)
                            
                        TextField("Genero", text: $genderBaby)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .overlay(
                                Divider()
                                    .padding(.horizontal,10), alignment: .bottom
                            )
                            .padding(.horizontal, 10)
                        DatePicker("Nacimiento", selection: $birthdate, displayedComponents: .date)
                            
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .overlay(
                                Divider()
                                    .padding(.horizontal,10), alignment: .bottom
                            )
                            .padding(.horizontal, 10)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/.opacity(0.6))
                        HStack{
                            TextField("Peso", text: $pesoString)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .overlay(
                                    Rectangle()
                                        .frame(height: 0.5)
                                        .padding(.horizontal,10)
                                        .foregroundColor(.gray.opacity(0.5)),
                                    alignment: .bottom
                                )
                                .padding(.horizontal, 10)
                            Text("kg")
                                .font(.callout)
                                .fontWeight(.light)
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal,-5)
                            TextField("Altura", text: $alturaString)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .overlay(
                                    Rectangle()
                                        .frame(height: 0.5)
                                        .padding(.horizontal,10)
                                        .foregroundColor(.gray.opacity(0.5)),
                                    alignment: .bottom
                                )
                                .padding(.horizontal, 10)
                            Text("cm")
                                .font(.callout)
                                .fontWeight(.light)
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.leading)
                                
                            
                        }
                        .padding(.bottom,60)
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
                            Button(action: {
                                alturaBaby = Float(alturaString) ?? 0.0
                                pesoBaby = Float(pesoString) ?? 0.0

                                if let momId = momId {
                                    let newBaby = BabyData(name: nameBaby, lastname: lastnameBaby, gender: genderBaby, profileImageBaby: "ImageBaby", birthday: birthdate, peso: pesoBaby, altura: alturaBaby)
                                    let result = viewModel.addBabyToMom(momId: momId, baby: newBaby)
                                    switch result {
                                    case .success(let newMomId):
                                        self.NavigateToperfilmom = true
                                        print(NavigateToperfilmom)
                                        self.momId = newMomId
                                        let mom = viewModel.getMomById(momId:momId)
                                        self.mom = mom
                                    case .failure(let error):
                                        // Handle the error
                                        alertMessage = error.localizedDescription
                                        showAlert = true
                                    }
                                } else {
                                    print("no encontrado mama")
                                }
                                
                            }) {
                                Text("Continuar")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .frame(width: 250)
                                    .background(Color("verdoso"))
                                    .cornerRadius(60)
                                    .shadow(color:Color("verdoso"),radius: 1.5)
                            }
                            .padding(.horizontal)
                            .alert(isPresented: $showAlert, content: {
                                Alert(title: Text("Error"), message: Text(alertMessage))
                            })
                            NavigationLink(destination: ToolbarView(mom: $mom), isActive: $NavigateToperfilmom) {
                                EmptyView()
                            }
                        }
                        .padding(.horizontal,25)
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 350, height: 540)
                    .background(Color(.white))
                    .cornerRadius(40)
                    .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 10)
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
}
/*struct RegisterBaby_Previews: PreviewProvider {
    static var previews: some View {
        RegisterBaby()
    }
}*/
struct VectorBaby: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: -0.25581*width, y: 0.96517*height))
        path.addCurve(to: CGPoint(x: 0.59336*width, y: 0.6215*height), control1: CGPoint(x: -0.25581*width, y: 0.96517*height), control2: CGPoint(x: 0.09232*width, y: 0.12849*height))
        path.addCurve(to: CGPoint(x: 1.36894*width, y: 0.27439*height), control1: CGPoint(x: 1.09439*width, y: 1.11451*height), control2: CGPoint(x: 1.45445*width, y: 0.36031*height))
        path.addLine(to: CGPoint(x: 0.1367*width, y: -0.65844*height))
        path.addLine(to: CGPoint(x: -0.25581*width, y: 0.96517*height))
        path.closeSubpath()
        return path
    }
}

struct BackGroundBaby: View {
    var body: some View {
        ZStack {
            // Fondo de color crema
            Color("ColorFondo2")
                .edgesIgnoringSafeArea(.all)
            Vector()
                .foregroundColor(Color("ColorFondo"))
                .frame(width: 400,height: 800)
                .offset(y:-200)
                .shadow(color: Color.gray.opacity(0.3),radius: 4)
            // Elementos del diseño
            VStack {
                VectorBaby()
                    .foregroundColor(Color("FondoBaby"))
                    .frame(width: 400,height: 260)
                    .offset(y:-50)
                    .shadow(color: Color.gray.opacity(0.3),radius: 4)
                Spacer()
                HStack{
                    ZStack{
                        
                        Circle()
                            .fill(Color("verdoso"))
                            .frame(width: 150, height: 150)
                            .offset(x:50,y:80)
                        Circle()
                            .fill(Color("AzulFuerte"))
                            .frame(width: 80, height: 80)
                            .offset(x:190,y:-40)
                        Circle()
                            .fill(Color("AzulBajito"))
                            .frame(width: 65, height: 65)
                            .offset(x:190,y:-40)
                        Circle()
                            .fill(Color("CirculoMorado"))
                            .frame(width: 180, height: 180)
                            .offset(x:170,y:60)
                        Circle()
                            .fill(Color("MoradoBajo"))
                            .frame(width: 120, height: 120)
                            .offset(x:170,y:60)
                            
                    }
                }.ignoresSafeArea()
            }
        }
    }
}
