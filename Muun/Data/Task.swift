//
//  Task.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 20/10/23.
//

import Foundation
import SwiftUI

enum TaskType: Hashable  {
    case alimentacion(detail: Alimentacion)
    case pañal(detail: Pañal)
    case dormir(detail: Dormir)
    case lactancia(detail: Lactancia)
    case rutina(detail: Rutina)
    case milestones(detail: Milestones)
    case crecimiento(detail: Crecimiento)
    case sintomas(detail: Sintomas)
    case medicamentos(detail: Medicamentos)
    case citasMedicas(detail: CitasMedicas)
    case vacunas(detail: Vacunas)
    
    var image: Image {
           switch self {
           case .alimentacion(let detail):
               return detail.image
           case .pañal(let detail):
               return detail.image
           case .dormir(let detail):
               return detail.image
           case .lactancia(let detail):
               return detail.image
           case .rutina(let detail):
               return detail.image
           case .milestones(let detail):
               return detail.image
           case .crecimiento(let detail):
               return detail.image
           case .sintomas(let detail):
               return detail.image
           case .medicamentos(let detail):
               return detail.image
           case .citasMedicas(let detail):
               return detail.image
           case .vacunas(let detail):
               return detail.image
           }
       }
       var color: Color {
           switch self {
           case .alimentacion(let detail):
               return detail.color
           case .pañal(let detail):
               return detail.color
           case .dormir(let detail):
               return detail.color
           case .lactancia(let detail):
               return detail.color
           case .rutina(let detail):
               return detail.color
           case .milestones(let detail):
               return detail.color
           case .crecimiento(let detail):
               return detail.color
           case .sintomas(let detail):
               return detail.color
           case .medicamentos(let detail):
               return detail.color
           case .citasMedicas(let detail):
               return detail.color
           case .vacunas(let detail):
               return detail.color
           }
       }
}

struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var doneFlag: Bool
    var date: Date
    var type: TaskType
}

protocol TaskDetail {
    var image: Image { get }
    var color: Color { get }
}


// ... Haz lo mismo para los demás detalles

// Detalle de cada tipo
struct Alimentacion: Hashable  {
    var cantidad: Double  // ej. 250 ml
    var tipo: String  // ej. "Leche materna", "Fórmula", "Puré de manzana"
}

extension Alimentacion: TaskDetail {
    var image: Image { return Image("manzana_naranja") }
    var color: Color { return Color.azulFuerte }
}
struct Pañal : Hashable {
    var tipo: String  // ej. "Mojado", "Sucio"
}

extension Pañal: TaskDetail {
    var image: Image { return Image("pañal") }
    var color: Color { return Color.ciculoRosado }
}


struct Dormir : Hashable {
    var duracion: TimeInterval  // Duración en segundos, ej. 2 horas = 7200
}

extension Dormir: TaskDetail {
    var image: Image { return Image("dormir") }
    var color: Color { return Color.verdoso}
}

struct Lactancia: Hashable  {
    var duracion: TimeInterval
    var lado: String  // ej. "Izquierdo", "Derecho"
}

extension Lactancia: TaskDetail {
    var image: Image { return Image("lactancia") }
    var color: Color { return Color.colorVerde }
}

struct Rutina: Hashable  {
    var actividad: String  // ej. "Baño", "Cambio de ropa"
}

extension Rutina: TaskDetail {
    var image: Image { return Image("rutina") }
    var color: Color { return Color.naranja}
}
struct Milestones: Hashable  {
    var hito: String  // ej. "Primeros pasos", "Primera palabra"
}

extension Milestones: TaskDetail {
    var image: Image { return Image("milestones") }
    var color: Color { return Color.circuloMorado }
}

struct Crecimiento: Hashable  {
    var peso: Double  // ej. 5.5 kg
    var altura: Double  // ej. 60 cm
}

extension Crecimiento: TaskDetail {
    var image: Image { return Image("crecimiento") }
    var color: Color { return Color.azulBajito }
}

struct Sintomas: Hashable  {
    var nombre: String  // ej. "Fiebre", "Tos"
    var severidad: String  // ej. "Leve", "Moderado", "Severo"
}

extension Sintomas: TaskDetail {
    var image: Image { return Image("Sintomas") }
    var color: Color { return Color.ciculoRosado }
}

struct Medicamentos: Hashable  {
    var nombre: String
    var dosis: String  // ej. "5ml cada 8 horas"
}

extension Medicamentos: TaskDetail {
    var image: Image { return Image("pastilla_morada") }
    var color: Color { return Color.colorVerde }
}

struct CitasMedicas: Hashable  {
    var especialidad: String  // ej. "Pediatría"
    var motivo: String  // ej. "Vacuna", "Revisión"
}

extension CitasMedicas: TaskDetail {
    var image: Image { return Image("pediatra_azul") }
    var color: Color { return Color.verdoso }
}
struct Vacunas: Hashable  {
    var nombre: String
    var fechaProgramada: Date
}
extension Vacunas: TaskDetail {
    var image: Image { return Image("vacunas") }
    var color: Color { return Color.naranja }
}
