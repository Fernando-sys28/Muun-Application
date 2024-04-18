//
//  RegistrarMed.swift
//  Muun
//
//  Created by Doris Elena  on 23/11/23.
//

import SwiftUI

struct RegistrarMed: View {
    @State private var nombreMedicamento = ""
    @Environment(\.dismiss) var dismiss
    @State private var selection = "Diario"
    let colors = ["Diario", "5 veces por semana", "5 veces por semana", "4 veces por semana", "3 veces por semana","2 veces por semana","1 vez por semana"]
    @State private var selectedDate = Date()
    @State private var selectedNumber = 1
    let numbers = Array(1...365) // Define el rango de números
    @State private var selectedNumber1 = 1
    @State private var selectedImage = 1 // Puedes usar una enumeración para mayor claridad
        let images = ["ANTES_DE_COMIDA", "DESPUES_COMIDA", "DURANTE_COMIDA"] // Nombres de las imágenes
    
    var body: some View {
        
        ZStack{
            Color(Color(red: 0.96, green: 0.96, blue: 0.97)).ignoresSafeArea()
            
            ZStack(alignment: .top){
                wave2_medicamentos()
                    .frame(width: 432.64734, height: 100.80618)
                    .foregroundColor(Color(red: 0.8, green: 0.84, blue: 0.56))
                    .padding(.top, 19)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                wave1_medicamentos()
                    .frame(width: 432.64734, height: 100.80618)
                    .foregroundColor(Color(red: 0.9, green: 0.93, blue: 0.71))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
            }.ignoresSafeArea()
            
            
            HStack{
                Spacer()
                
                Button(action: {
                    dismiss()
                }){
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 32))
                        .padding(.bottom, 10)
                        .padding(.trailing,18)
                }
               
                
                
                
            }.frame(maxWidth: 430, maxHeight: .infinity, alignment: .topTrailing)
                .padding(25)
                .padding(.trailing, 10)
                .padding(.leading, 10)
            
            
            VStack {
                Spacer()
                
                VStack{
                    TextField("Nombre del Medicamento", text: $nombreMedicamento)
                        .background(Rectangle().frame(height: 2).foregroundColor(.gray), alignment: .bottom)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                    
                        
                }.frame(width: 340)
                Spacer()
                
                ZStack{
                    Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 345, height: 300)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    
                    VStack{
                        ZStack{
                            Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 286, height: 32)
                            .background(.white)

                            .cornerRadius(20)
                            .overlay(
                            RoundedRectangle(cornerRadius: 20)
                            .inset(by: 0.25)
                            .stroke(.black, lineWidth: 0.5)
                            )
                            
                            Picker("", selection: $selection) {
                                           ForEach(colors, id: \.self) { color in
                                               Text(color)
                                           }
                                       }.pickerStyle(.menu).accentColor(.black)
                        }
                        
                        HStack {
                            
                            VStack(alignment: .leading){
                                Text("Desde")
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 16))
                                    
                                
                                VStack {
                                            DatePicker("Fecha", selection: $selectedDate, displayedComponents: .date)
                                                .datePickerStyle(CompactDatePickerStyle()) // Estilo compacto
                                                .frame(width: 69, height: 69) // Tamaño del cuadrado
                                                .background(Color.gray.opacity(0.2)) // Fondo del cuadrado
                                                .cornerRadius(10) // Bordes redondeados del cuadrado
                                                
                                }.padding(.top,50)
                                
                                
                                
                                
                            }.padding().padding(.bottom)
                            Spacer()
                            
                            Rectangle()
                                .rotationEffect(Angle(degrees: 90))
                                .frame( width:1,height: 100) // Altura del divisor
                                .foregroundColor(.gray) // Color del divisor
                                .rotationEffect(Angle(degrees: 90))
                            Spacer()
                            VStack(alignment: .leading){
                                Text("Período")
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 16))
                                
                                
                                HStack{
                                    VStack {
                                        Picker("Select a number", selection: $selectedNumber) {
                                            ForEach(numbers, id: \.self) { number in
                                                Text("\(number)")
                                            }
                                        }
                                        .pickerStyle(WheelPickerStyle())
                                        .frame(height: 60) // Ajusta la altura según sea necesario
                                        .clipped()
                                        
                                      }
                                    
                                    
                                    Text("días")
                                }
                                
                                HStack{
                                    
                                    VStack {
                                        Picker("Select a number", selection: $selectedNumber1) {
                                            ForEach(numbers, id: \.self) { number in
                                                Text("\(number)")
                                            }
                                        }
                                        .pickerStyle(WheelPickerStyle())
                                        .frame(height: 60) // Ajusta la altura según sea necesario
                                        .clipped()
                                        
                                      }
                                    
                                    Text("horas")
                                }
                                
                            }.padding()
                            
                        }.padding().frame(width:320)
                        
                        
                        
                        
                        
                    }
                    
                    
                }.padding(.bottom,30)
              
                ZStack{
                    Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 345, height: 110)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    VStack{
                        Text("En que momento: ")
                            .fontWeight(.semibold)
                            .font(.system(size: 16))
                        
                        HStack{
                            Spacer()
                            ForEach(1...3, id: \.self) { index in
                                Image(images[index - 1])
                                    .resizable()
                                    .frame(width: 55, height: 50)
                                
                                    .overlay(
                                        selectedImage == index ?
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                            .offset(x: 30, y: -20) : nil
                                    )
                                    .onTapGesture {
                                        selectedImage = index
                                    }
                            Spacer()
                            }
                            
                        }
                    }
                    
                }
                Spacer()
                Button(action: {
                    print("Agregó Medicamento")
                    dismiss()
                }){
                    Text("Guardar")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .fontWeight(.medium)
                        .frame(width: 300, height: 55)
                        .background(Color(red: 0.8, green: 0.84, blue: 0.56))
                        .cornerRadius(60)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                }
                
               
                
                
                
            }
            
                
            
            
            
        }//final stack
        
        
    }
    
    
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }
}





#Preview {
    RegistrarMed()
}
