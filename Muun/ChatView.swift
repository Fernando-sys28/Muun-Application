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
    @State var messages = [
        ChatMessage(isFromUser: false, messageText: "He visto que tu bebe no ha estado durmiendo bien, quisieras una recomendación para ayudarte?", time: "8:30 AM"),
    ]
    
    @State var predefinedAnswers = ["Si, me encantaría", "No, gracias"]
    @State var showInfoLink = false

    var body: some View {
        NavigationView{
            ZStack{
                BackGroundMainPage()
                
                VStack {
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
                    VStack(alignment: .leading, spacing: 10){
                        ScrollView {
                            VStack(spacing: 15) {
                                ForEach(messages, id: \.messageText) { message in
                                    MessageView(message: message)
                                    
                                }
                                if showInfoLink {
                                    NavigationLink(
                                        destination: articulo(),
                                        label: {
                                            Text("Click aquí para más información")
                                                .font(.system(size: 18))
                                                .padding()
                                                .background(.azulFuerte) // O el color que prefieras
                                                .foregroundColor(.black)
                                                .cornerRadius(20)
                                        })
                                    .padding(.bottom,50)
                                }
                            }
                        }
                        .background(RoundedRectangle(cornerRadius: 40.0)
                            .foregroundStyle(.colorFondo2)
                            .shadow(color: Color.black.opacity(0.1),radius: 2,x:2,y:-2)
                        )
                        .padding(.top,10)
                        
                        // Columna de respuestas predefinidas
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                ForEach(predefinedAnswers, id: \.self) { answer in
                                    Button(action: {
                                        handlePredefinedAnswer(answer)
                                    }) {
                                        Text(answer)
                                            .font(.system(size: 20))
                                            .padding()
                                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight:80)
                                            .background(.azulFuerte) // Cambia el color según tu paleta
                                            .foregroundColor(.black)
                                            .cornerRadius(20)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom,60)
                        }
                        .padding(.bottom)
                        .background(RoundedRectangle(cornerRadius: 40.0)
                            .frame(height:200)
                            .foregroundStyle(.colorFondo2)
                            .shadow(color: Color.black.opacity(0.1),radius: 2,x:2,y:-2)
                        )
                        
                    }
                    .padding(.horizontal)
                }
                .padding(.top,80)
                .frame(width: 420)
            }
            .ignoresSafeArea()
        }
    }
    func handlePredefinedAnswer(_ answer: String) {
            let newMessageFromUser = ChatMessage(isFromUser: true, messageText: answer, time: Date().formatted())
            messages.append(newMessageFromUser)
            
            if answer == "Si, me encantaría" {
                let followUpMessage = ChatMessage(isFromUser: false, messageText: "Estudios demuestran que cargar de manera correcta a tu bebé, le ayuda a concebir un mejor sueño.", time: Date().formatted())
                messages.append(followUpMessage)
               
                predefinedAnswers = ["Gracias", "Hasta luego"]
                showInfoLink = true
                
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
                .font(.system(size: 22))
                .padding(15)
                .background(message.isFromUser ? Color.azulFuerte : Color.white)
                .foregroundColor(message.isFromUser ? .black : .black)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1),radius: 4, x: 0, y: 2)
            
            
            if !message.isFromUser {
                Spacer()
            }
        }
        .padding(.top,30)
        .padding(.horizontal,10)
        
    }

}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

