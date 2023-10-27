//
//  RegisterView.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 12/10/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                BackGroundRegister()
                VStack{
                    Image("LogoMuun")
                        .resizable()
                        .frame(width: 300, height: 160)
                        .padding(.bottom,-20)
                    VStack(alignment: .leading, spacing: 15){
                        Text("¡Bienvenide!")
                            .font(
                                .title
                            )
                            .fontWeight(.semibold)
                            .padding(.top,10)
                            .padding(.horizontal,15)
                        
                        Text("Crea una cuenta nueva")
                            .font(.callout)
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .padding(.horizontal,15)
                            .padding(.top,-5)
                            .padding(.bottom,10)
                        
                        TextField("Nombre", text: $name)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .overlay(
                                Divider()
                                    
                                    .padding(.horizontal,10), alignment: .bottom
                            )
                            .padding(.horizontal, 10)
                        TextField("Usuario", text: $username)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .overlay(
                                Divider()
                                    
                                    .padding(.horizontal,10), alignment: .bottom
                                
                            )
                            .padding(.horizontal, 10)
                        TextField("Correo", text: $email)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .overlay(
                                Divider()
                                    .padding(.horizontal,10), alignment: .bottom
                            )
                            .padding(.horizontal, 10)
                        
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
                        
                        VStack(alignment: .center, spacing: 20){
                            Button(action: {
                                // Acción del botón de inicio de sesión
                            }) {
                                Text("Sign Up")
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
                            
                            
                            Text("O registrate con")
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
                            
                            NavigationLink(destination: SignInView()){
                                Text("¿Ya tienes una cuenta? Log in")
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
                .padding(.top,-70)
            }
        }
        .navigationBarHidden(true)
        
    }
}

#Preview {
    RegisterView()
}

struct BackGroundRegister: View {
    var body: some View {
        ZStack {
            Color("ColorFondo2")
                .edgesIgnoringSafeArea(.all)
            Vector()
                .foregroundColor(Color("ColorFondo"))
                .frame(width: 400,height: 800)
                .offset(y:-200)
                .shadow(color: Color.gray.opacity(0.3),radius: 4)
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
                            .fill(Color("nube"))
                            .frame(width: 150, height: 150)
                            .offset(x:-110,y:-50)
                        Circle()
                            .fill(Color("nube"))
                            .frame(width: 150, height: 150)
                            .offset(x:-200,y:-10)
                        
                        Circle()
                            .fill(Color("ColorVerde"))
                            .frame(width: 150, height: 150)
                            .offset(x:120,y:-40)
                        Circle()
                            .fill(Color("ColorVerde"))
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
                            .frame(width: 200, height: 200)
                            .offset(x:-170,y:70)
                        Circle()
                            .fill(Color("AzulFuerte"))
                            .frame(width: 70, height: 60)
                            .offset(x:-80,y:35)
                        Circle()
                            .fill(Color("AzulBajito"))
                            .frame(width: 60, height: 50)
                            .offset(x:-80,y:35)
                        Circle()
                            .fill(Color("CirculoMorado"))
                            .frame(width: 200, height: 200)
                            .offset(y:120)
                        Circle()
                            .fill(Color("MoradoBajo"))
                            .frame(width: 140, height: 140)
                            .offset(y:120)

                        Circle()
                            .fill(Color("nube"))
                            .frame(width: 120, height: 120)
                            .offset(x:100,y:120)
                        Circle()
                            .fill(Color("nube"))
                            .frame(width: 110, height: 110)
                            .offset(x:150,y:80)
                    }
                }
                .offset(y:20)
                .ignoresSafeArea()
            }
        }
    }
}

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left")
                    .bold()
                    .padding(.leading,10)
                    .foregroundColor(Color("ColorArrow"))
                    .font(.system(size: 20))
            }
        }
    }
}
