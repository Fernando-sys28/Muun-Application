//
//  TrackerData.swift
//  Muun
//
//  Created by Doris Elena  on 23/11/23.
//

import Foundation
import Foundation

struct TrackerData {
    var name: String
    var baby: BabyData
    var profileImageName: String
    var CorreoUser: String
}


struct MedicamentoData {
    var id: Int
    var nombre: String
    var frecuencia: String
    var dosis: String
    var momento: String
    var horaSiguiente: String
}

extension MedicamentoData {
    static var medicamentos: [MedicamentoData] = [
        .init(id: 0, nombre: "Vitaminas", frecuencia: "24", dosis: "5", momento: "durante", horaSiguiente: "8:30 AM"),
        .init(id: 1, nombre: "Tamiflu", frecuencia: "8", dosis: "0.2", momento: "antes", horaSiguiente: "12:00 PM")
        // Agrega más medicamentos aquí si es necesario
    ]
}

