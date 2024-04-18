//
//  PañalTracker.swift
//  Muun
//
//  Created by Doris Elena  on 24/11/23.
//

import SwiftUI

struct Pan_alTracker: View {
    @State private var currentDate = Date()
    @State private var showingPicker = false
    @Environment(\.dismiss) var dismiss
    @State private var showingSheet = false
    
    @State private var isShowingContentView2 = false
    
    var body: some View {
        ZStack{
            Color(Color(red: 0.96, green: 0.96, blue: 0.97))
            
            ZStack (alignment: .top){
                wave2TrackerDormir()
                    .foregroundColor(Color(red: 0.95, green: 0.77, blue: 0.75))
                    .frame(width: 412, height: 143)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                wave1TrackerDormir()
                    .foregroundColor(Color(red: 0.96, green: 0.86, blue: 0.85))
                    .frame(width: 412, height: 117)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }.ignoresSafeArea()
            
            HStack{
                Text("Pañal")
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
                .padding(.leading, 10)
            
         
            VStack {
                Button(action: {
                    showingPicker.toggle()
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 47)
                            .background(Color.white)
                            .cornerRadius(10)

                        HStack {
                            Spacer()
                            Text("Hora")
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                .font(.system(size: 18))

                            Spacer()

                            Text(showingPicker ? "Seleccionar" : formattedDate(currentDate))
                                .font(.system(size: 18))
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 0.95, green: 0.77, blue: 0.75))

                            Spacer()
                        }
                    }
                }

                if showingPicker {
                    DatePicker("", selection: $currentDate, displayedComponents: [.date, .hourAndMinute])
                        .labelsHidden()
                        .onChange(of: currentDate) { _ in
                            showingPicker = false
                        }
                }
                
                
                Button(action: {
                    isShowingContentView2 = true
                        }) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 320, height: 120)
                                    .background(Color(red: 0.95, green: 0.77, blue: 0.75))
                                    .cornerRadius(30)
                                    

                                Text("Ver\nPañal")
                                    .font(.system(size: 36))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                        }
                        .sheet(isPresented: $isShowingContentView2) {
                            // Contenido de la hoja
                            PoopClasificador(classifier: ImageClassifier())
                        }.padding(.top,50)
                
                
            }
            
            
        }
    }
}


func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter.string(from: date)
}





#Preview {
    Pan_alTracker()
}
