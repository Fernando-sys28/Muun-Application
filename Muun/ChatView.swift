//
//  ChatView.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 27/10/23.
//

import SwiftUI

struct ChatMessage {
    var isFromUser: Bool
    var messageText: String
    var time: String
}


struct ChatView: View {
    // Datos ficticios para el ejemplo
    let messages = [
        ChatMessage(isFromUser: false, messageText: "¡Felicidades, has registrado una semana de tomas de medicina!", time: "8:30 AM"),
        ChatMessage(isFromUser: false, messageText: "🎉", time: "8:31 AM"),
        ChatMessage(isFromUser: true, messageText: "¡Gracias! 😊", time: "8:35 AM")
    ]

    var body: some View {
        ZStack{
            BackGroundMainPage()
            
            VStack {
                // Header del chat
                HStack {
                    ZStack{
                        Circle()
                            .frame(width: 60,height: 60)
                            .foregroundStyle(.white)
                            .padding(.top,-5)
                        Image("LunaTab") // Imagen de perfil de "Luna"
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    }
                    
                    VStack{
                        Text("Luna")
                            .font(.headline)
                            .padding(.leading,-10)
                        HStack{
                            
                            Circle()
                                .frame(width: 10,height: 10)
                                .foregroundStyle(.green)
                            Text("Online")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                  
                }
                .padding(.leading,40)
                VStack{
                    // Cuerpo del chat
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(messages, id: \.messageText) { message in
                                MessageView(message: message)
                            }
                        }
                    }
                    .padding()
                    .padding(.top,50)
                    
                    // Area para enviar un nuevo mensaje
                    HStack {
                        TextField("Escribe un mensaje...", text: .constant(""))
                            .padding(.leading)
                        Button("Enviar") {
                            // Aquí tu lógica para enviar el mensaje
                        }
                        .foregroundStyle(.azulFuerte)
                        .padding(.trailing)
                    }
                    .background(RoundedRectangle(cornerRadius: 40)
                        .frame(width: 380,height: 50)
                        .foregroundStyle(.white)
                        .shadow(color: Color.black.opacity(0.1),radius: 4, x: 0, y: 2))
                    .padding(.top,-80)
                    .padding()
                }
                .background(RoundedRectangle(cornerRadius: 40.0)
                    .foregroundStyle(.colorFondo2)
                    .shadow(color: Color.black.opacity(0.1),radius: 2,x:2,y:-2)
                )
                .ignoresSafeArea()
                
            }
            .padding(.top,25)
            .frame(width: 400)
        }
       
    }
}

struct MessageView: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isFromUser {
                Spacer()
            }
            if !message.isFromUser{
                Image("LunaTab") // Usa el nombre correcto de tu imagen aquí
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.trailing, 10)
                    .padding(.top,15)
            }
            Text(message.messageText)
                .padding(15)
                .background(message.isFromUser ? Color.azulFuerte : Color.white)
                .foregroundColor(message.isFromUser ? .white : .black)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1),radius: 4, x: 0, y: 2)
            
            
            if !message.isFromUser {
                Spacer()
            }
        }
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
