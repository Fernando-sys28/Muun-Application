//
//  MedicamentosTracker_Card.swift
//  Muun
//
//  Created by Doris Elena  on 23/11/23.
//

import SwiftUI

struct MedicamentosTracker_Card: View {
    var medicamento: MedicamentoData
    var body: some View {
        
        VStack{
            ZStack{
                Rectangle()
                .foregroundColor(.white)
                .frame(width: 345, height: 133)
                .background(.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                
                HStack{
                    VStack(alignment: .center){
                            Image(systemName: "pills.fill")
                                .font(.system(size: 36))
                                
                        VStack(alignment: .center){
                            Text("Cada:")
                                .font(.system(size: 16))
                
                            Text(medicamento.frecuencia + "Hrs")
                                .font(.system(size: 16))
                        }
                    }.padding(.leading, 32)
                    VStack{
                        HStack(){
                            
                            VStack(alignment: .leading){
                                Text(medicamento.horaSiguiente)
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                Text(medicamento.nombre)
                            }.padding(.leading, 10)
                            Spacer()
                            
                            Menu {
                                        Button(role: .destructive ,action: {
                                            print("Eliminar Medicamento")
                                            
                                        }) {
                                            Label("eliminar", systemImage: "minus.circle")
                                        }
                                        
                                        Button(action: {
                                            print("Menu button 2")
                                        }) {
                                            Label("Editar", systemImage: "pencil")
                                        }
                                        
                                    } label: {
                                        Image(systemName: "ellipsis")
                                            .font(.system(size: 30))
                                            .rotationEffect(Angle(degrees: 90))
                                            .foregroundColor(.black)
                                    }
                            
                        }.padding(.top)
                        Divider()
                        
                            
                        
                        HStack{
                            Spacer()
                            Text(medicamento.dosis +  " mg")
                            Divider()
                            Text(medicamento.momento)
                            
                        }.padding(.bottom, 10)
                        
                        
                    }.padding(.leading, 12).padding(.trailing,16)
                    
                    
                   
                    
                   
                }.frame(width: 345, height: 133)
                
               
            }
            
            
            
            
        }
    }
}


class MedicamentoViewModel: ObservableObject {
    @Published var medicamentos: [MedicamentoData] = []

    func editarMedicamento(_ medicamento: MedicamentoData, con nuevosDatos: MedicamentoData) {
        // Encuentra el medicamento en la lista y actualízalo
        if let index = medicamentos.firstIndex(where: { $0.id == medicamento.id }) {
            medicamentos[index] = nuevosDatos
        }
    }

    func eliminarMedicamento(_ medicamento: MedicamentoData) {
        // Elimina el medicamento de la lista
        medicamentos.removeAll { $0.id == medicamento.id }
    }
}





#Preview {
    // En tu vista principal o en el Preview
    MedicamentosTracker_Card(medicamento: MedicamentoData.medicamentos[1])

}
