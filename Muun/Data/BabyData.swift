//
//  Baby.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 19/10/23.
//

import Foundation
import SwiftData

@Model
class BabyData{
    var name: String
    var lastname: String
    var gender:String
    var profileImageBaby: String
    var birthday: Date
    var peso: Float
    var altura: Float
    
    init(name: String, lastname: String, gender: String, profileImageBaby: String, birthday: Date, peso: Float, altura: Float) {
        self.name = name
        self.lastname = lastname
        self.gender = gender
        self.profileImageBaby = profileImageBaby
        self.birthday = birthday
        self.peso = peso
        self.altura = altura
    }
}
