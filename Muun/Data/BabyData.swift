//
//  Baby.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 19/10/23.
//

import Foundation


struct BabyData{
    var name: String
    var momName: String
    var profileImageName: String
    var birthday: Date
}


extension BabyData {
    static var Babies: [BabyData] = [
        .init(name: "Sofia", momName: "Karen", profileImageName: "ImageBaby",  birthday: DateComponents(calendar: .current, year: 2022, month: 10, day: 21).date!)
    ]
}
