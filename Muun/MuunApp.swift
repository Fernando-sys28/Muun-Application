//
//  MuunApp.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 12/10/23.
//

import SwiftUI
import SwiftData

@main
struct MuunApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
