//
//  AddTaskView.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 20/10/23.
//

import SwiftUI

struct AddTaskView: View {
    private var section : Bool = false
    // Todos los tipos de tareas
    let allTaskTypes: [TaskType] = [
        .alimentacion(detail: Alimentacion(cantidad: 0, tipo: "")),
        .pañal(detail: Pañal(tipo: "")),
        .dormir(detail: Dormir(duracion: 0)),
        .lactancia(detail: Lactancia(duracion: 0, lado: "")),
        .rutina(detail: Rutina(actividad: "")),
        .milestones(detail: Milestones(hito: "")),
        .crecimiento(detail: Crecimiento(peso: 0, altura: 0)),
        .sintomas(detail: Sintomas(nombre: "", severidad: "")),
        .medicamentos(detail: Medicamentos(nombre: "", dosis: "")),
        .citasMedicas(detail: CitasMedicas(especialidad: "", motivo: "")),
        .vacunas(detail: Vacunas(nombre: "", fechaProgramada: Date()))
    ]
    
    var body: some View {
        List(chunked(allTaskTypes, by: 4), id: \.self) { chunk in
            HStack(spacing: -10) {
                ForEach(chunk, id: \.self) { taskType in
                    Button(action: {
                        
                    }) {
                        ZStack {
                            Circle()
                                .fill(taskType.color)
                                .frame(width: 60, height: 60)
                            
                            VStack {
                                taskType.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35, height: 35)
                                    .padding(.top, 35)
                                Text(taskTypeName(taskType: taskType))
                                    .frame(width: 100)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .padding(.top,10)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(maxWidth:.infinity)
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            
        }
        .background(Color.colorFondo2)
    }

    func chunked<T>(_ array: [T], by size: Int) -> [[T]] {
        stride(from: 0, to: array.count, by: size).map {
            Array(array[$0..<min($0 + size, array.count)])
        }
    }
    
    func taskTypeName(taskType: TaskType) -> String {
        switch taskType {
        case .alimentacion:
            return "Alimentación"
        case .pañal:
            return "Pañal"
        case .dormir:
            return "Dormir"
        case .lactancia:
            return "Lactancia"
        case .rutina:
            return "Rutina"
        case .milestones:
            return "Milestones"
        case .crecimiento:
            return "Crecimiento"
        case .sintomas:
            return "Síntomas"
        case .medicamentos:
            return "Medicamentos"
        case .citasMedicas:
            return "Citas Médicas"
        case .vacunas:
            return "Vacunas"
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}

