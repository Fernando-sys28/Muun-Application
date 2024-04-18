//
//  Insignias.swift
//  Muun
//
//  Created by Pimienta on 26/11/23.
//

import SwiftUI

struct Insignias: View {
    var body: some View {
        NavigationView{
            ZStack{
                BackGroundMom()
                    VStack(spacing:10){
                        ZStack{
                            Circle()
                                .frame(width: 160,height: 160)
                                .foregroundColor(.white)
                                .offset(y:8)
                            Image("ImageMom")
                                .resizable()
                                .frame(width: 150,height: 150)
                                .clipShape(Circle())
                                .aspectRatio(contentMode: .fill)
                                .padding(.top)
                        }
                        .padding(.top,-15)
                        Text("Insignias ganadas")
                            .font(.title2)
                            .fontWeight(.semibold)
                        VStack{
                            HStack(spacing: 50){
                                VStack{
                                    Image("crecimiento 1")
                                        .resizable()
                                        .frame(width: 125, height: 107)
                                    Text("Constancia en crecimiento")
                                        .multilineTextAlignment(.center)
                                        .frame(width: 125)
                                        .font(.footnote)
                                }
                                VStack{
                                    Image("medicinasnice")
                                        .resizable()
                                        .frame(width: 120, height: 117)
                                    Text("Medicinas")
                                        .frame(width: 125)
                                        .font(.footnote)
                                }
                             
                            }
                            HStack(spacing: 60){
                                VStack{
                                    Image("responsable")
                                        .resizable()
                                        .frame(width: 120, height: 127)
                                    Text("Responsabilidad")
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                }
                                VStack{
                                    Image("Tiempo_sueño")
                                        .resizable()
                                        .frame(width: 130, height: 127)
                                    Text("Constancia en tiempo de sueño")
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                        .frame(width: 120)
                                }
                            }
                            HStack(spacing: 50){
                                VStack{
                                    Image("alimentación")
                                        .resizable()
                                        .frame(width: 130, height: 127)
                                    Text("Constancia en alimentación")
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                        .frame(width: 120)
                                }
                                VStack{
                                    Image("image 15")
                                        .resizable()
                                        .frame(width: 117, height: 117)
                                    Text("Mejor mamá")
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                }
                                
                            }
                        }
                    }
                    .padding()
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}
      




#Preview {
    Insignias()
}
