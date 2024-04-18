//
//  TrackerAlimentacion.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 27/10/23.
//

import SwiftUI
import Combine

struct TrackerAlimentacion: View {
    @Environment(\.dismiss) var dismiss
    @State var isDividersActivive: Bool = false
    private let categories = ["Solidos","Biberon"]
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color(.colorFondo2).ignoresSafeArea()
            
            ZStack{
                WaveAlfrenteAlimentacion()
                    .foregroundColor(Color(red: 0.71, green: 0.84, blue: 0.88))
                    .frame(width: 412, height: 143)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                WaveAtrasAlimentacion()
                    .foregroundColor(Color(red: 0.82, green: 0.89, blue: 0.92))
                    .frame(width: 412, height: 117)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }.ignoresSafeArea()
            
            VStack {
                HStack{
                    Text("Alimentación")
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                        .font(.system(size: 30))
                    Spacer()
                    
                    Button(action: {
                        dismiss()
                    }){
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 32))
                            .padding(.bottom, 10)
                    }

                    
                }
                
                HStack{
                    ForEach(0..<categories.count){i in CategoryView(isActive: i == selectedIndex, text: categories[i])
                        
                            .onTapGesture {
                                selectedIndex = i
                            }
                    }
                }.padding(.top, 25)
                
              
                // Aquí determinamos qué vista mostrar
                Group {
                    switch selectedIndex {
                    case 0:
                        SolidosView()
                    case 1:
                        BiberonView()
                    default:
                        EmptyView() // Si no hay coincidencia, mostramos una vista vacía
                    }
                }
                
                
                
            }.frame(maxWidth: 430, maxHeight: .infinity, alignment: .topTrailing)
                .padding(25)
                .padding(.trailing, 10)
                .padding(.leading, 10)
            
            
           
            
        }
        
    }
}

struct WaveAlfrenteAlimentacion: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: -0.00812*width, y: 0.99149*height))
        path.addLine(to: CGPoint(x: 0.03381*width, y: 0.9186*height))
        path.addCurve(to: CGPoint(x: 0.24365*width, y: 0.69814*height), control1: CGPoint(x: 0.07574*width, y: 0.8457*height), control2: CGPoint(x: 0.1596*width, y: 0.69991*height))
        path.addCurve(to: CGPoint(x: 0.49597*width, y: 0.85486*height), control1: CGPoint(x: 0.32769*width, y: 0.69637*height), control2: CGPoint(x: 0.4119*width, y: 0.83862*height))
        path.addCurve(to: CGPoint(x: 0.74782*width, y: 0.63352*height), control1: CGPoint(x: 0.58003*width, y: 0.87109*height), control2: CGPoint(x: 0.66394*width, y: 0.76131*height))
        path.addCurve(to: CGPoint(x: 0.9575*width, y: 0.28705*height), control1: CGPoint(x: 0.83171*width, y: 0.50573*height), control2: CGPoint(x: 0.91557*width, y: 0.35994*height))
        path.addLine(to: CGPoint(x: 0.99943*width, y: 0.21415*height))
        path.addLine(to: CGPoint(x: 0.99917*width, y: -0.00188*height))
        path.addLine(to: CGPoint(x: 0.95714*width, y: -0.00099*height))
        path.addCurve(to: CGPoint(x: 0.74704*width, y: 0.00343*height), control1: CGPoint(x: 0.91512*width, y: -0.00011*height), control2: CGPoint(x: 0.83108*width, y: 0.00166*height))
        path.addCurve(to: CGPoint(x: 0.49492*width, y: 0.00874*height), control1: CGPoint(x: 0.663*width, y: 0.0052*height), control2: CGPoint(x: 0.57896*width, y: 0.00697*height))
        path.addCurve(to: CGPoint(x: 0.2428*width, y: 0.01405*height), control1: CGPoint(x: 0.41088*width, y: 0.01051*height), control2: CGPoint(x: 0.32684*width, y: 0.01228*height))
        path.addCurve(to: CGPoint(x: 0.0327*width, y: 0.01847*height), control1: CGPoint(x: 0.15876*width, y: 0.01582*height), control2: CGPoint(x: 0.07472*width, y: 0.01759*height))
        path.addLine(to: CGPoint(x: -0.00932*width, y: 0.01936*height))
        path.addLine(to: CGPoint(x: -0.00812*width, y: 0.99149*height))
        path.closeSubpath()
        return path
    }
}
struct WaveAtrasAlimentacion: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: -0.00345*width, y: 0.99051*height))
        path.addLine(to: CGPoint(x: 0.03838*width, y: 0.91783*height))
        path.addCurve(to: CGPoint(x: 0.24773*width, y: 0.69801*height), control1: CGPoint(x: 0.08021*width, y: 0.84515*height), control2: CGPoint(x: 0.16388*width, y: 0.69978*height))
        path.addCurve(to: CGPoint(x: 0.49946*width, y: 0.85425*height), control1: CGPoint(x: 0.33157*width, y: 0.69624*height), control2: CGPoint(x: 0.4156*width, y: 0.83807*height))
        path.addCurve(to: CGPoint(x: 0.75073*width, y: 0.63354*height), control1: CGPoint(x: 0.58333*width, y: 0.87043*height), control2: CGPoint(x: 0.66704*width, y: 0.76096*height))
        path.addCurve(to: CGPoint(x: 0.95992*width, y: 0.28808*height), control1: CGPoint(x: 0.83442*width, y: 0.50613*height), control2: CGPoint(x: 0.91809*width, y: 0.36076*height))
        path.addLine(to: CGPoint(x: 1.00176*width, y: 0.2154*height))
        path.addLine(to: CGPoint(x: 1.00149*width, y: 0))
        path.addLine(to: CGPoint(x: 0.95957*width, y: 0.00088*height))
        path.addCurve(to: CGPoint(x: 0.74996*width, y: 0.00531*height), control1: CGPoint(x: 0.91765*width, y: 0.00177*height), control2: CGPoint(x: 0.8338*width, y: 0.00354*height))
        path.addCurve(to: CGPoint(x: 0.49842*width, y: 0.01062*height), control1: CGPoint(x: 0.66611*width, y: 0.00708*height), control2: CGPoint(x: 0.58227*width, y: 0.00885*height))
        path.addCurve(to: CGPoint(x: 0.24688*width, y: 0.01593*height), control1: CGPoint(x: 0.41457*width, y: 0.01239*height), control2: CGPoint(x: 0.33073*width, y: 0.01416*height))
        path.addCurve(to: CGPoint(x: 0.03727*width, y: 0.02035*height), control1: CGPoint(x: 0.16304*width, y: 0.01769*height), control2: CGPoint(x: 0.07919*width, y: 0.01946*height))
        path.addLine(to: CGPoint(x: -0.00465*width, y: 0.02123*height))
        path.addLine(to: CGPoint(x: -0.00345*width, y: 0.99051*height))
        path.closeSubpath()
        return path
    }
}

    


struct CategoryView: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            Text(text)
                .font(.system(size: 20))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color.black.opacity(0.6): Color(red: 0.62, green: 0.62, blue: 0.62))
                
            
            if(isActive){
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .clipShape(Capsule())
            }
            
            
            
        }.padding(.trailing)
    }
}

struct SolidosView: View {
    
    let thirty = Calendar.current.date(byAdding: .day, value: 30, to: Date())!
    @State private var HoraComida = Date()
    @State private var isVerduraSelected: Bool = false
    @State private var isFrutaSelected: Bool = false
    @State private var isPureSelected: Bool = false
    @State private var isGranoSelected: Bool = false
    @State private var isProteinaSelected: Bool = false
    
    @State private var isLovedItSelected: Bool = false
    @State private var isLikedItSelected: Bool = false
    @State private var isDislikeItSelected: Bool = false
    @State private var isAllergicReactionSelected: Bool = false
    @State private var isHatedItSelected: Bool = false
    
    func guardarSelecciones() {
        var seleccionados: [String] = []

        if isVerduraSelected { seleccionados.append("Verduras") }
        if isFrutaSelected { seleccionados.append("Frutas") }
        if isPureSelected { seleccionados.append("Pure") }
        if isGranoSelected { seleccionados.append("Granos") }
        if isProteinaSelected { seleccionados.append("Proteina") }

        var reacciones: [String] = []

        if isLovedItSelected { reacciones.append("Lo Amó") }
        if isLikedItSelected { reacciones.append("Le Gustó") }
        if isDislikeItSelected { reacciones.append("No le gustó") }
        if isAllergicReactionSelected { reacciones.append("Reacción Alergica") }
        if isHatedItSelected { reacciones.append("Lo odió") }

        print("Alimentos seleccionados: \(seleccionados.joined(separator: ", "))")
        print("Reacciones: \(reacciones.joined(separator: ", "))")
    }


    
    var body: some View {
        
        ScrollView (showsIndicators: false){
            VStack{
                
                
                VStack {
                    Text("Seleccionar Tiempo:")
                        .padding(.bottom,10)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    
                    DatePicker("", selection: $HoraComida, in: ...thirty, displayedComponents: [.date, .hourAndMinute])
                            .labelsHidden()
                            .padding(.bottom,40)
                        }
                
                Text("Alimento")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                
                HStack{

                    
                    Button(action: {
                                // Cambiar el estado de selección cuando se presiona el botón
                        isPureSelected.toggle()
                            }) {
                                VStack {
                                    Text("🥣")
                                        .font(.system(size: 45))
                                        .padding()
                                        .frame(width: 80.52631, height: 85.2459)
                                        .background(isPureSelected ? Color(red: 0.71, green: 0.84, blue: 0.88) : Color.white) // Cambiar el color de fondo según el estado de selección
                                        .cornerRadius(20)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Text("Pure")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))

                                }
                            }.padding(.trailing,10)
                    
                    Button(action: {
                                // Cambiar el estado de selección cuando se presiona el botón
                        isVerduraSelected.toggle()
                            }) {
                                VStack {
                                    Text("🥦")
                                        .font(.system(size: 45))
                                        .padding()
                                        .frame(width: 80.52631, height: 85.2459)
                                        .background(isVerduraSelected ? Color(red: 0.71, green: 0.84, blue: 0.88) : Color.white) // Cambiar el color de fondo según el estado de selección
                                        .cornerRadius(20)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Text("Verduras")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                }
                            }.padding(.trailing,10)
                    Button(action: {
                                // Cambiar el estado de selección cuando se presiona el botón
                        isFrutaSelected.toggle()
                            }) {
                                VStack {
                                    Text("🍎")
                                        .font(.system(size: 45))
                                        .padding()
                                        .frame(width: 80.52631, height: 85.2459)
                                        .background(isFrutaSelected ? Color(red: 0.71, green: 0.84, blue: 0.88) : Color.white)  // Cambiar el color de fondo según el estado de selección
                                        .cornerRadius(20)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Text("Frutas")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                }
                            }
                    
                }
                HStack{
                    
                    Button(action: {
                                // Cambiar el estado de selección cuando se presiona el botón
                        isGranoSelected.toggle()
                            }) {
                                VStack {
                                    Text("🫘")
                                        .font(.system(size: 45))
                                        .padding()
                                        .frame(width: 80.52631, height: 85.2459)
                                        .background(isGranoSelected ? Color(red: 0.71, green: 0.84, blue: 0.88) : Color.white)  // Cambiar el color de fondo según el estado de selección
                                        .cornerRadius(20)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Text("Granos")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                }
                            }.padding(.trailing,10)
                    
                    Button(action: {
                                // Cambiar el estado de selección cuando se presiona el botón
                        isProteinaSelected.toggle()
                            }) {
                                VStack {
                                    Text("🥚")
                                        .font(.system(size: 45))
                                        .padding()
                                        .frame(width: 80.52631, height: 85.2459)
                                        .background(isProteinaSelected ? Color(red: 0.71, green: 0.84, blue: 0.88) : Color.white)  // Cambiar el color de fondo según el estado de selección
                                        .cornerRadius(20)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Text("Proteina")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                }
                            }


                }
                
                Text("Reacción")
                    .padding(.top,20)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                
                HStack{
                    Button(action: {
                                // Cambiar el estado de selección cuando se presiona el botón
                        isLovedItSelected.toggle()
                            }) {
                                VStack {
                                    Text("😍")
                                        .font(.system(size: 40))
                                        .padding()
                                        .frame(width: 70, height: 70)
                                        .background(isLovedItSelected ? Color(red: 0.71, green: 0.84, blue: 0.88) : Color.white)  // Cambiar el color de fondo según el estado de selección
                                        .cornerRadius(100)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Text("Lo Amó")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                }
                            }.padding(.trailing,20)
                    Button(action: {
                                // Cambiar el estado de selección cuando se presiona el botón
                        isLikedItSelected.toggle()
                            }) {
                                VStack {
                                    Text("😃")
                                        .font(.system(size: 40))
                                        .padding()
                                        .frame(width: 70, height: 70)
                                        .background(isLikedItSelected ? Color(red: 0.71, green: 0.84, blue: 0.88) : Color.white)  // Cambiar el color de fondo según el estado de selección
                                        .cornerRadius(100)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Text("Le Gustó")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                }
                            }.padding(.trailing,20)

                    Button(action: {
                                // Cambiar el estado de selección cuando se presiona el botón
                        isDislikeItSelected.toggle()
                            }) {
                                VStack {
                                    Text("😕")
                                        .font(.system(size: 40))
                                        .padding()
                                        .frame(width: 70, height: 70)
                                        .background(isDislikeItSelected ? Color(red: 0.71, green: 0.84, blue: 0.88) : Color.white)  // Cambiar el color de fondo según el estado de selección
                                        .cornerRadius(100)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Text("No le gustó")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                }
                            }
                }
                
                HStack{
                    Button(action: {
                                // Cambiar el estado de selección cuando se presiona el botón
                        isAllergicReactionSelected.toggle()
                            }) {
                                VStack {
                                    Text("🤒")
                                        .font(.system(size: 40))
                                        .padding()
                                        .frame(width: 70, height: 70)
                                        .background(isAllergicReactionSelected ? Color(red: 0.71, green: 0.84, blue: 0.88) : Color.white)  // Cambiar el color de fondo según el estado de selección
                                        .cornerRadius(100)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Text("Reacción Alergica")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                }
                            }.padding(.trailing,10)
                    Button(action: {
                                // Cambiar el estado de selección cuando se presiona el botón
                        isHatedItSelected.toggle()
                            }) {
                                VStack {
                                    Text("😡")
                                        .font(.system(size: 40))
                                        .padding()
                                        .frame(width: 70, height: 70)
                                        .background(isHatedItSelected ? Color(red: 0.71, green: 0.84, blue: 0.88) : Color.white)  // Cambiar el color de fondo según el estado de selección
                                        .cornerRadius(100)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Text("Lo odió")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                }
                            }
                }
            }
        }.padding(.top,30)
        
        Button(action: {
            print("Hora de Registro:", HoraComida)        // Cambiar el estado de selección cuando se presiona el botón
            guardarSelecciones()
                }) {
                    Text("Guardar")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .fontWeight(.medium)
                        .frame(width: 300, height: 55)
                        .background(Color(red: 0.71, green: 0.84, blue: 0.88))
                        .cornerRadius(60)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                }
    }
}






struct BiberonView: View {
    @State private var milkLevel: Double = 150 // Default to half-full, can range from 0 to 300
    let maxLevel: Double = 300
    @State private var feedingTime = Date()
    @Environment(\.dismiss) var dismiss
    
    func saveSelections() {
        // Aquí guardas la cantidad de leche y la hora de la alimentación en UserDefaults
        UserDefaults.standard.set(milkLevel, forKey: "milkLevel")
        UserDefaults.standard.set(feedingTime, forKey: "feedingTime")
        
        // Imprimir los valores en la consola para verificar
        print("Cantidad de leche: \(milkLevel) ml")
        print("Hora de Registro:", feedingTime)
    }
    
    var datePickerRange: ClosedRange<Date> {
        let today = Date()
        guard let thirtyDaysFromNow = Calendar.current.date(byAdding: .day, value: 30, to: today) else {
            fatalError("Could not calculate the date 30 days from now.")
        }
        return today...thirtyDaysFromNow
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Seleccionar Tiempo:")
                    .padding(.bottom, 10)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                
                DatePicker("", selection: $feedingTime, in: datePickerRange, displayedComponents: [.date, .hourAndMinute])
                    .labelsHidden()
                    .padding(.bottom, 40)
                
                ZStack(alignment: .bottom) {
                    
                    VStack{
                        
                        topBiberon() // Your custom figure
                            .frame(width: 110, height: 110) // Adjust size to maintain proportion
                            .foregroundColor(Color(red: 0.71, green: 0.84, blue: 0.88))
                        
                        BottleSlider(milkLevel: $milkLevel, maxLevel: maxLevel)
                            .frame(width: 120, height: 360) // Adjust size to fit within screen
                    }
                }
                Text("\(Int(milkLevel)) ml")
                    .font(.headline)
                Button(action: {
                   // self.saveSelections()
                    dismiss()
                }) {
                    Text("Guardar")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .fontWeight(.medium)
                        .frame(width: 300, height: 55)
                        .background(Color(red: 0.71, green: 0.84, blue: 0.88))
                        .cornerRadius(60)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct BottleSlider: View {
    @Binding var milkLevel: Double // This is the level of milk in ml
    var maxLevel: Double // Maximum milk level in ml

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(.gray.opacity(0.2))
                    .cornerRadius(20)
                
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height * CGFloat(milkLevel / maxLevel))
                    .foregroundColor(Color(red: 0.71, green: 0.84, blue: 0.88)) // Changed the color of the milk
                    .cornerRadius(20)
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        // Convert the drag gesture value to milk level
                        let sliderHeight = geometry.size.height
                        let newLevel = max(0, min(maxLevel, ( value.location.y / sliderHeight) * maxLevel))
                        milkLevel = newLevel
                    })
            )
        }
    }
}



struct topBiberon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99663*width, y: 0.73137*height))
        path.addLine(to: CGPoint(x: 0.67682*width, y: 0.49317*height))
        path.addLine(to: CGPoint(x: 0.67682*width, y: 0.17039*height))
        path.addCurve(to: CGPoint(x: 0.49052*width, y: 0), control1: CGPoint(x: 0.67682*width, y: 0.07619*height), control2: CGPoint(x: 0.59335*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.30472*width, y: 0.17039*height), control1: CGPoint(x: 0.38794*width, y: 0), control2: CGPoint(x: 0.30472*width, y: 0.07644*height))
        path.addLine(to: CGPoint(x: 0.30472*width, y: 0.48701*height))
        path.addLine(to: CGPoint(x: 0.00779*width, y: 0.73113*height))
        path.addLine(to: CGPoint(x: 0, y: 0.73014*height))
        path.addLine(to: CGPoint(x: 0, y: 0.98831*height))
        path.addLine(to: CGPoint(x: 0.99688*width, y: 0.98831*height))
        path.addLine(to: CGPoint(x: 0.99688*width, y: 0.73038*height))
        path.addLine(to: CGPoint(x: 0.99663*width, y: 0.73137*height))
        path.closeSubpath()
        return path
    }
}



struct LactanciaView: View {
    var body: some View {
      Text("hola lactancia")
    }
}


#Preview {
    TrackerAlimentacion()
}
