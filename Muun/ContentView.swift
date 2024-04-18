//
//  ContentView.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 27/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true

    var body: some View {
        Group {
            if showSplash {
                SplashScreen()
            } else {
                SignInView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    showSplash = false
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
