//
//  ScreenView.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 13/10/23.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var shouldFloat2 = false
    @State private var shouldFloat1 = false
    
    var body: some View {
        ZStack{
            
            Color(.azulBajito)
            MyIcon2()
                .frame(width: 600, height: 600)
                .rotationEffect(.degrees(-20))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .foregroundColor(Color(.azul2))
                .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 10)
            
            MyIcon()
                .frame(width: 439, height: 294)
                .foregroundColor(Color(.azulBajito))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
                .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 10)
                
            Image("LogoMuun")
                .resizable()
                .frame(width: 304,height: 167)
                .padding(.bottom, 200)
                
            
            ZStack(){
                Circle()
                    .frame(width:228, height: 228).foregroundColor(Color(.azul2))
                    .padding(.leading,50)
                
                Image("Luna")
                    .resizable()
                    .frame(width: 300,height:300)
                    .padding(.leading, 200)
                    .padding(.bottom, 300)
                
                Circle()
                    .frame(width:66, height: 66).foregroundColor(Color(.azul3))
                    .padding(.leading,480)
                    .padding(.bottom, 95 )
                    .offset(y: shouldFloat1 ? -5 : 5)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                    .onAppear {
                        self.shouldFloat1.toggle()
                    }
                
                
                Circle()
                    .frame(width:179, height: 179).foregroundColor(.white)
                    .padding(.leading,200)
                    .padding(.top, 100)
                    
            }.position(x: 110, y: 760)
            
            ZStack(){
                
                Circle()
                    .frame(width:200, height: 200).foregroundColor(.white)
                    .padding(.leading,150)
                Circle()
                    .frame(width:100, height:100).foregroundColor(Color(.ciculoRosado))
                    .padding(.leading,2)
                    .padding(.top, 150)
                    
                Circle()
                    .frame(width:44, height: 44).foregroundColor(Color(.azul3))
                    .padding(.leading,65)
                    .padding(.bottom,360)
                    .offset(y: shouldFloat2 ? -5 : 5)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                    .onAppear {
                        self.shouldFloat2.toggle()
                    }
            }.position(x: 400, y: 760) 
        }.ignoresSafeArea()
        
    }
}


struct MyIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: -0.00349*width, y: 0.97351*height))
        path.addCurve(to: CGPoint(x: 0.52326*width, y: 0.47351*height), control1: CGPoint(x: -0.00349*width, y: 0.97351*height), control2: CGPoint(x: 0.0968*width, y: 0.41587*height))
        path.addCurve(to: CGPoint(x: 0.99884*width, y: 0), control1: CGPoint(x: 0.94971*width, y: 0.53115*height), control2: CGPoint(x: 1.07191*width, y: 0.01074*height))
        path.addLine(to: CGPoint(x: -0.00349*width, y: 0))
        path.addLine(to: CGPoint(x: -0.00349*width, y: 0.97351*height))
        path.closeSubpath()
        return path
    }
}

struct MyIcon2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: -0.07066*width, y: 0.90059*height))
        path.addCurve(to: CGPoint(x: 0.52685*width, y: 0.8608*height), control1: CGPoint(x: -0.05613*width, y: 0.77429*height), control2: CGPoint(x: 0.23539*width, y: 0.60562*height))
        path.addCurve(to: CGPoint(x: 1.44611*width, y: 0.74732*height), control1: CGPoint(x: 0.81832*width, y: 1.11598*height), control2: CGPoint(x: 1.27425*width, y: 0.92612*height))
        path.addCurve(to: CGPoint(x: 1.60431*width, y: 0.3469*height), control1: CGPoint(x: 1.61796*width, y: 0.56852*height), control2: CGPoint(x: 1.627*width, y: 0.56099*height))
        path.addLine(to: CGPoint(x: 1.49717*width, y: -0.01565*height))
        path.addLine(to: CGPoint(x: -0.25581*width, y: 0.27407*height))
        path.addLine(to: CGPoint(x: -0.07066*width, y: 0.90059*height))
        path.closeSubpath()
        return path
    }
}


#Preview {
    SplashScreen()
}
