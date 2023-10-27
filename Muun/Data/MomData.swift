//
//  MomData.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 13/10/23.
//

import Foundation

struct MomData {
    var name: String
    var baby: BabyData
    var profileImageName: String
    var CorreoUser: String
}


extension MomData {
    static var moms: [MomData] = [
        .init(name: "karen", baby: BabyData(name: "Sofia", momName: "Karen", profileImageName: "ImageBaby",  birthday: DateComponents(calendar: .current, year: 2022, month: 10, day: 21).date!), profileImageName: "ImageBaby", CorreoUser: "mom@gmail.com")
    ]
}

