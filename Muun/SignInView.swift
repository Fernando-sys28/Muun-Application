//
//  ContentView.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 12/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        ZStack{
            BackGround()
            
            VStack{
                Image("LogoMuun")
                    .resizable()
                    .frame(width: 300, height: 160)
                    .padding(.bottom,-20)
                VStack(alignment: .leading, spacing: 25){
                    Text("¡Hola de nuevo!")
                        .font(
                            .title
                        )
                        .fontWeight(.semibold)
                        .padding(.top,30)
                        .padding(.horizontal,15)
                    
                    Text("Sign In para continuar")
                        .font(.callout)
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .padding(.horizontal,15)
                        .padding(.top,-10)
                    
                    TextField("Usuario", text: $username)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .overlay(
                            Divider()
                                .padding(.horizontal,10), alignment: .bottom
                        )
                        .padding(.horizontal, 10)
                        .padding(.bottom,10)
                    HStack {
                        if isPasswordVisible {
                            TextField("Contraseña", text: $password)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                        } else {
                            SecureField("Contraseña", text: $password)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                        }
                        
                        Button(action: {
                            self.isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                        }
                    }
                    .overlay(
                        Divider()
                            .padding(.horizontal,10), alignment: .bottom
                    )
                    .padding(.horizontal, 10)
                    .padding(.bottom,10)
                    
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
                        Button(action: {
                            // Acción del botón de inicio de sesión
                        }) {
                            Text("Log In")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: 250)
                                .background(Color("AzulBoton"))
                                .cornerRadius(60)
                                .shadow(radius: 1.5)
                        }
                        .padding(.horizontal)
                        
                        Button(action: {
                            // Acción para "Olvidó contraseña"
                        }) {
                            Text("¿Olvido contraseña?")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom,25)
                        
                        Text("O ingresa con")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        HStack(spacing: 30) {
                            Button(action: {
                                // Acción para Google
                            }) {
                                Image("GoogleLogo") // Asegúrate de tener este asset
                                    .resizable()
                                    .frame(width: 28, height: 28)
                            }
                            .frame(width: 60,height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("AzulBoton"), lineWidth: 0.5)
                            )
                            Button(action: {
                                // Acción para Facebook
                            }) {
                                Image("FacebookLogo") // Asegúrate de tener este asset
                                    .resizable()
                                    .frame(width: 35, height: 35)
                            }
                            .frame(width: 60,height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.orange, lineWidth: 0.5)
                            )
                            
                            Button(action: {
                                // Acción para Apple
                            }) {
                                Image("AppleLogo")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    
                            }
                            .frame(width: 60,height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.yellow, lineWidth: 0.5)
                            )
                        }
                        .padding(.bottom,20)
                        Button(action: {
                            // Acción para "¡Únete!"
                        }) {
                            Text("¿No tiene cuenta? ¡Únete!")
                                .font(.body)
                                .fontWeight(.light)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal,25)
                    
                    Spacer()
                }
                .padding()
                .frame(width: 350, height: 580)
                .background(Color(.white))
                .cornerRadius(40)
                .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 10)
                
            }
            .padding(.top,-80)
        }
    }
}


#Preview {
    ContentView()
}

struct Vector: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: -0.12769*width, y: 0.82655*height))
        path.addCurve(to: CGPoint(x: 0.41919*width, y: 0.82245*height), control1: CGPoint(x: -0.13366*width, y: 0.68469*height), control2: CGPoint(x: 0.11021*width, y: 0.51388*height))
        path.addCurve(to: CGPoint(x: 1.2525*width, y: 0.75703*height), control1: CGPoint(x: 0.72816*width, y: 1.13102*height), control2: CGPoint(x: 1.12094*width, y: 0.94749*height))
        path.addCurve(to: CGPoint(x: 1.33737*width, y: 0.31497*height), control1: CGPoint(x: 1.38407*width, y: 0.56657*height), control2: CGPoint(x: 1.39128*width, y: 0.55868*height))
        path.addLine(to: CGPoint(x: 1.18248*width, y: -0.10242*height))
        path.addLine(to: CGPoint(x: -0.39535*width, y: 0.10526*height))
        path.addLine(to: CGPoint(x: -0.12769*width, y: 0.82655*height))
        path.closeSubpath()
        return path
    }
}

struct BackGround: View {
    var body: some View {
        ZStack {
            // Fondo de color crema
            Color("ColorFondo2")
                .edgesIgnoringSafeArea(.all)
            Vector()
                .foregroundColor(Color("ColorFondo"))
                .frame(width: 400,height: 800)
                .offset(y:-200)
                .shadow(color: Color.gray.opacity(0.3),radius: 4)
            // Elementos del diseño
            VStack {
                HStack{
                    ZStack{
                        Circle()
                            .fill(Color("CiculoRosado"))
                            .frame(width: 150, height: 150)
                            .offset(y:-40)
                        Circle()
                            .fill(Color("CirculoRosadoBajo"))
                            .frame(width: 125, height: 125)
                            .offset(y:-40)
                        Circle()
                            .fill(Color("ColorVerde"))
                            .frame(width: 150, height: 150)
                            .offset(x:-110,y:-50)
                        Circle()
                            .fill(Color("ColorVerde"))
                            .frame(width: 150, height: 150)
                            .offset(x:-200,y:-10)
                        
                        Circle()
                            .fill(Color("nube"))
                            .frame(width: 150, height: 150)
                            .offset(x:120,y:-50)
                        Circle()
                            .fill(Color("nube"))
                            .frame(width: 150, height: 150)
                            .offset(x:200,y:10)
                    }
                }
                .ignoresSafeArea()
                Spacer()
                HStack{
                    ZStack{
                        
                        Circle()
                            .fill(Color("verdoso"))
                            .frame(width: 110, height: 110)
                            .offset(x:-170,y:-10)
                        Circle()
                            .fill(Color("AzulFuerte"))
                            .frame(width: 70, height: 60)
                            .offset(x:-115,y:-10)
                        Circle()
                            .fill(Color("AzulBajito"))
                            .frame(width: 60, height: 50)
                            .offset(x:-115,y:-10)
                        Circle()
                            .fill(Color("CirculoMorado"))
                            .frame(width: 180, height: 160)
                            .offset(x:-90,y:70)
                        Circle()
                            .fill(Color("MoradoBajo"))
                            .frame(width: 110, height: 110)
                            .offset(x:-90,y:70)
                        Circle()
                            .fill(Color("nube"))
                            .frame(width: 130, height: 130)
                            .offset(x:-190,y:70)
                        Circle()
                            .fill(Color("nube"))
                            .frame(width: 120, height: 120)
                            .offset(x:-5,y:90)
                        Circle()
                            .fill(Color("nube"))
                            .frame(width: 110, height: 110)
                            .offset(x:40,y:60)
                        Circle()
                            .fill(Color("nube"))
                            .frame(width: 120, height: 120)
                            .offset(x:90,y:90)
                            
                    }
                }
                .offset(y:20)
                .ignoresSafeArea()
            }
        }
    }
}
