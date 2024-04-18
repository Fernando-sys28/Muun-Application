//
//  MomData.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 13/10/23.
//

import Foundation
import SwiftData



@Model
class MomData {
    @Attribute(.unique) var id: UUID
    var name: String
    var username: String
    @Relationship var baby: BabyData?
    var profileImageName: String?
    var CorreoUser: String
    var password: String
    
    init(id: UUID, name: String, username: String, baby: BabyData?, profileImageName: String, CorreoUser: String, password: String) {
        self.id = id
        self.name = name
        self.username = username
        self.baby = baby
        self.profileImageName = profileImageName
        self.CorreoUser = CorreoUser
        self.password = password
    }
}


/*extension MomData {
    static var moms: [MomData] = [
        .init(name: "karen",username: "karen1", baby: BabyData(name: "Sofia", momName: "Karen", profileImageName: "ImageBaby",  birthday: DateComponents(calendar: .current, year: 2022, month: 10, day: 21).date!), profileImageName: "ImageBaby", CorreoUser: "mom@gmail.com", password: "11231")
    ]
}*/

