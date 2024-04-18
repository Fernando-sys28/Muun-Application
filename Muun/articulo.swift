//
//  articulo.swift
//  Muun
//
//  Created by Pimienta on 26/11/23.
//

import SwiftUI

struct articulo: View {
    var body: some View {
        
        NavigationView {
            ZStack (alignment: .top){
                Color(Color(red: 0.96, green: 0.96, blue: 0.97))
                wave2TrackerDormir()
                
                    .foregroundColor(Color(red: 0.71, green: 0.84, blue: 0.88))
                    .frame(width: 412, height: 143)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                WaveAtrasAlimentacion()
                    .foregroundColor(Color(red: 0.82, green: 0.89, blue: 0.92))
                    .frame(width: 412, height: 117)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                VStack{
                    ZStack{
                        
                        Image("cargar_bebe")
                            .resizable()
                            .padding(.top, 50)
                            .frame(width: 450, height: 350)
                        
                        HStack{
                            Image(systemName: "bookmark.fill")
                                .foregroundColor(.white)
                            Text("Cómo cargar a un recién nacido")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                        }
                        .padding(.top,200)
                        
                    }
                    ZStack {
                        ScrollView {
                            
                            VStack{
                                Text("Siempre tenga cuidado con la cabeza de su bebé, especialmente alrededor de las fontanelas. Siempre sostenga la cabeza y el cuello de su bebé.\n\nPara levantar a su bebé, deslice una mano debajo de la cabeza y el cuello, y la otra mano debajo de su parte inferior. Doble las rodillas para proteger su espalda.\n\nUna vez que tenga un buen agarre, levante a su bebé y acérquelo a su pecho mientras endereza las piernas nuevamente.\n\nAsegúrese de que la cabeza de su bebé descanse contra su pecho. Deslice la mano desde la parte inferior del bebé para sostener su cuello.\n\nMueva suavemente la cabeza de su bebé hacia el hueco de su brazo, aún sosteniendo su cuello. Coloque la otra mano debajo de la parte inferior del bebé.\n\nUsar la posición de cuna le permite mirar a su bebé. Puede sonreír y hablarle.")
                                    .padding(.top,20)
                                
                                NavigationLink(
                                    destination: RealityKitViewContainer(),
                                    label: {
                                        Text("Ver demostración")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.center)
                                            .padding()
                                            .frame(width: 340, height: 55.012)
                                            .background(Color(red: 0.95, green: 0.77, blue: 0.75))
                                            .cornerRadius(60)
                                            .shadow(radius: 1.5)
                                    }
                                )
                                .padding(.horizontal)
                                .padding(.vertical,30)
                                .padding(.bottom,80)
                            }
                            .background(RoundedRectangle(cornerRadius: 40)
                                .frame(width: 400)
                                .foregroundStyle(.colorFondo2)
                                .shadow(color: Color.black.opacity(0.1),radius: 2,x:2,y:-2)
                                        
                                )
                            .padding(.horizontal,50)
                        }
                    }
                    .padding(.top,-70)
                }
               
                
            }
            . ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    articulo()
}
