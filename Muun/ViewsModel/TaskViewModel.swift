//
//  TaskViewModel.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 20/10/23.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    
    @Published var storedTasks: [Task] = [
        Task(title: "Vitamina A", description: "Tomar 1 al dia", doneFlag: true, date: Date(timeInterval: 60, since: Date()), type: .medicamentos(detail: Medicamentos(nombre: "Vitamina A", dosis: "1 tableta"))),
        Task(title: "Desayuno", description: "", doneFlag: false, date: Date(timeInterval: 60*5, since: Date()), type: .alimentacion(detail: Alimentacion(cantidad: 250, tipo: "Leche materna"))),
        Task(title: "Pediatra", description: "", doneFlag: true, date: Date(timeInterval: 60*10, since: Date()), type: .citasMedicas(detail: CitasMedicas(especialidad: "Pediatría", motivo: "Revisión"))),
        Task(title: "Dimeticona", description: "", doneFlag: false, date: Date(timeInterval: 60*15, since: Date()), type: .medicamentos(detail: Medicamentos(nombre: "Dimeticona", dosis: "5ml cada 8 horas"))),
        Task(title: "Comida", description: "", doneFlag: false, date: Date(timeInterval: 60*20, since: Date()), type: .alimentacion(detail: Alimentacion(cantidad: 300, tipo: "Puré de manzana")))
    ]
    
    // MARK: - Current Day
    @Published var currentDay: Date = Date()
    
    // MARK: - Filtering Today Tasks
    @Published var filteredTasks: [Task]?
    
    @Published var selectedTaskType: TaskType? = nil
    // MARK: - Initializing
    init() {
        filterTodayTasks()
    }
    
    // MARK: - Filter Today Tasks
    func filterTodayTasks() {
            DispatchQueue.global(qos: .userInteractive).async {
                let calendar = Calendar.current
                let filtered: [Task]
                
                if let taskType = self.selectedTaskType {
                    filtered = self.filterByType(taskType)
                } else {
                    filtered = self.storedTasks
                }

                let todayTasks = filtered.filter {
                    return calendar.isDate($0.date, inSameDayAs: self.currentDay)
                }
                .sorted { task1, task2 in
                    return task2.date > task1.date
                }

                DispatchQueue.main.async {
                    withAnimation {
                        self.filteredTasks = todayTasks
                    }
                }
            }
        }
    
    // MARK: - Checking if the currentHour is task Hour
    func isCurrentHour(date: Date) -> Bool {
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let currentHour = calendar.component(.hour, from: Date())
        
        return hour == currentHour
    }
    
    // MARK: - Filter tasks by type
    func filterByType(_ taskType: TaskType) -> [Task] {
        return storedTasks.filter { task in
            switch task.type {
            case .alimentacion:
                if case .alimentacion = taskType { return true }
            case .pañal:
                if case .pañal = taskType { return true }
            case .dormir:
                if case .dormir = taskType { return true }
            case .lactancia:
                if case .lactancia = taskType { return true }
            case .rutina:
                if case .rutina = taskType { return true }
            case .milestones:
                if case .milestones = taskType { return true }
            case .crecimiento:
                if case .crecimiento = taskType { return true }
            case .sintomas:
                if case .sintomas = taskType { return true }
            case .medicamentos:
                if case .medicamentos = taskType { return true }
            case .citasMedicas:
                if case .citasMedicas = taskType { return true }
            case .vacunas:
                if case .vacunas = taskType { return true }
            }
            return false
        }
    }
}
