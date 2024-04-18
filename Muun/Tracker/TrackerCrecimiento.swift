//
//  TrackerCrecimiento.swift
//  Muun
//
//  Created by Pimienta on 25/11/23.
//

import SwiftUI
import Combine

struct TrackerCrecimiento: View {
    @Environment(\.dismiss) var dismiss
    @State private var seleccionarPeso: Double = 0.0
    @State private var seleccionarTalla: Double = 0.0
    @State private var seleccionarFechaP = Date()
    @State private var seleccionarFechaT = Date()
    var body: some View {
        ZStack{
            Color(.colorFondo2).ignoresSafeArea()
            
            ZStack (alignment: .top){
                        wave2TrackerCrecimiento()
                            .foregroundColor(Color(red: 0.67, green: 0.78, blue: 0.82))
                            .frame(width: 412, height: 143)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
                        
                        wave1TrackerCrecimiento()
                            .foregroundColor(Color(red: 0.71, green: 0.84, blue: 0.88))
                            .frame(width: 412, height: 117)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
                    }.ignoresSafeArea() //zstack
            
            VStack(spacing: 50){
                HStack{
                        Text("Crecimiento")
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
                    }.frame(maxWidth: 430, maxHeight: .infinity, alignment: .topTrailing)
                        .padding(25)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)//hstack encabezado
                          
                VStack{
                    Text("Peso (kg)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    HStack{
                        Text("Selecciona peso")
                            .font(.title3)
                            .fontWeight(.medium)
                        Picker("Peso", selection: $seleccionarPeso) {
                            ForEach(0..<20, id: \.self) { weight in
                                Text("\(weight) kg")
                                    .tag(Double(weight))
                            }
                        }
                        .padding()
                       
                    }
                    HStack{
                        DatePicker("", selection: $seleccionarFechaP, displayedComponents: .date)
                                .labelsHidden()
                                .padding(.bottom,40)
                    }
                }   .padding()
                    .frame(width: 340, height: 228)
                    .background(Color(.white))
                    .cornerRadius(40)
                    .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 10)
                   
                VStack{
                    Text("Talla (cm)")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack{
                        Text("Selecciona Talla")
                            .font(.title3)
                            .fontWeight(.medium)
                        Picker("Talla", selection: $seleccionarTalla){
                            ForEach(20..<150, id: \.self){
                                height in
                                Text("\(height)cm")
                                    .tag(Double(height))
                            }
                        }.padding()
                    }

                    DatePicker("", selection: $seleccionarFechaT, displayedComponents: .date)
                            .labelsHidden()
                            .padding(.bottom, 40)
                }   .padding()
                    .frame(width: 340, height: 228)
                    .background(Color(.white))
                    .cornerRadius(40)
                    .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 10)
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Guardar")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 340, height: 55.012)
                        .background(Color(red: 0.71, green: 0.84, blue: 0.88))
                        .cornerRadius(60)
                        .shadow(radius: 1.5)
                }
                .padding(.horizontal)
                
            }//VStack
        }//ZSTACK
    }
}


struct wave2TrackerCrecimiento: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 1.05116*width, y: 0.77778*height))
        path.addLine(to: CGPoint(x: 0.99195*width, y: 0.81481*height))
        path.addCurve(to: CGPoint(x: 0.69767*width, y: 0.85185*height), control1: CGPoint(x: 0.93363*width, y: 0.85185*height), control2: CGPoint(x: 0.81521*width, y: 0.92593*height))
        path.addCurve(to: CGPoint(x: 0.34419*width, y: 0.55556*height), control1: CGPoint(x: 0.58014*width, y: 0.77778*height), control2: CGPoint(x: 0.46172*width, y: 0.55556*height))
        path.addCurve(to: CGPoint(x: 0.04991*width, y: 0.88889*height), control1: CGPoint(x: 0.22665*width, y: 0.55556*height), control2: CGPoint(x: 0.10823*width, y: 0.77778*height))
        path.addLine(to: CGPoint(x: -0.0093*width, y: height))
        path.addLine(to: CGPoint(x: -0.0093*width, y: 0))
        path.addLine(to: CGPoint(x: 0.04991*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.34419*width, y: 0), control1: CGPoint(x: 0.10823*width, y: 0), control2: CGPoint(x: 0.22665*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.69767*width, y: 0), control1: CGPoint(x: 0.46172*width, y: 0), control2: CGPoint(x: 0.58014*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.99195*width, y: 0), control1: CGPoint(x: 0.81521*width, y: 0), control2: CGPoint(x: 0.93363*width, y: 0))
        path.addLine(to: CGPoint(x: 1.05116*width, y: 0))
        path.addLine(to: CGPoint(x: 1.05116*width, y: 0.77778*height))
        path.closeSubpath()
        return path
    }
}

struct wave1TrackerCrecimiento: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 1.00465*width, y: 0.77778*height))
        path.addLine(to: CGPoint(x: 0.9483*width, y: 0.81481*height))
        path.addCurve(to: CGPoint(x: 0.66822*width, y: 0.85185*height), control1: CGPoint(x: 0.89279*width, y: 0.85185*height), control2: CGPoint(x: 0.78008*width, y: 0.92592*height))
        path.addCurve(to: CGPoint(x: 0.33178*width, y: 0.55556*height), control1: CGPoint(x: 0.55635*width, y: 0.77778*height), control2: CGPoint(x: 0.44365*width, y: 0.55556*height))
        path.addCurve(to: CGPoint(x: 0.0517*width, y: 0.88889*height), control1: CGPoint(x: 0.21992*width, y: 0.55556*height), control2: CGPoint(x: 0.10721*width, y: 0.77778*height))
        path.addLine(to: CGPoint(x: -0.00465*width, y: height))
        path.addLine(to: CGPoint(x: -0.00465*width, y: 0))
        path.addLine(to: CGPoint(x: 0.0517*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.33178*width, y: 0), control1: CGPoint(x: 0.10721*width, y: 0), control2: CGPoint(x: 0.21992*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.66822*width, y: 0), control1: CGPoint(x: 0.44365*width, y: 0), control2: CGPoint(x: 0.55635*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.9483*width, y: 0), control1: CGPoint(x: 0.78008*width, y: 0), control2: CGPoint(x: 0.89279*width, y: 0))
        path.addLine(to: CGPoint(x: 1.00465*width, y: 0))
        path.addLine(to: CGPoint(x: 1.00465*width, y: 0.77778*height))
        path.closeSubpath()
        return path
    }
}



#Preview {
    TrackerCrecimiento()
}
