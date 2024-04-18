//
//  PerfilMomView.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 13/10/23.
//

import SwiftUI

struct PerfilMomView: View {
    @Binding var mom: MomData?
    @Environment(ViewModel.self) var viewModel
    var body: some View {
        NavigationView {
            ZStack{
                BackGroundMom()
                VStack{
                    if let mom = mom {
                        ZStack{
                            Circle()
                                .frame(width: 160,height: 160)
                                .foregroundColor(.white)
                                .offset(y:8)
                            Image(mom.profileImageName ?? "ImageBaby")
                                .resizable()
                                .frame(width: 150,height: 150)
                                .clipShape(Circle())
                                .aspectRatio(contentMode: .fill)
                                .padding(.top)
                        }
                        Text(mom.name) // Aquí baby ya no es opcional
                            .font(.title)
                        
                        Button(action: {
                        }) {
                            Text("Agragar bebe +")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: 220)
                                .background(Color("verdoso"))
                                .cornerRadius(60)
                                .shadow(color:Color("verdoso"),radius: 1.5)
                        }
                        .padding(.bottom,20)
                        
                        VStack(alignment: .leading, spacing: 15){
                            
                            if let baby = mom.baby {
                                Text(baby.name) // Ahora baby.name es seguro de acceder
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .padding(.leading,20)
                                let difference = baby.birthday.differenceInMonthsAndWeeks(to: Date())
                                if difference.weeks > 0 {
                                    Text("\(difference.months) meses, \(difference.weeks) semanas")
                                        .font(.caption2)
                                        .fontWeight(.light)
                                        .foregroundColor(.gray)
                                        .padding(.leading,20)
                                        .padding(.top,-10)
                                } else {
                                    Text("\(difference.months) meses")
                                        .font(.caption2)
                                        .fontWeight(.light)
                                        .foregroundColor(.gray)
                                        .padding(.leading,20)
                                        .padding(.top,-10)
                                }
                            } else {
                                Text("No hay información del bebé")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .padding(.leading,20)
                            }
                            
                            NavigationLink(
                                destination: Text("Agregar cuidador"),
                                label: {
                                    HStack{
                                        Text("Agregar cuidador")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                            .padding(.horizontal,20)
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black)
                                            .padding(.leading,125)
                                    }
                                })
                            
                            NavigationLink(
                                destination: Text("Informe para un médico"),
                                label: {
                                    HStack{
                                        Text("Informe para un médico")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                            .padding(.horizontal,20)
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black)
                                            .padding(.leading,80)
                                        
                                    }
                                    
                                })
                            .padding(.bottom,15)
                            Button(action: {
                                print("Editar información")
                            }, label: {
                                Text("Editar información")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.vertical,5)
                                
                            })
                            .frame(width: 170)
                            .background(Color("verdoso"))
                            .cornerRadius(60)
                            .padding(.leading,140)
                            
                        }
                        .frame(width: 350, height: 200)
                        .background(Color(.white))
                        .cornerRadius(40)
                        .shadow(radius: 3)
                        .padding(.bottom,10)
                        
                        
                        VStack(alignment: .leading){
                            
                            NavigationLink(
                                destination: Insignias(),
                                label: {
                                    Image(systemName: "trophy")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                        .foregroundColor(.black)
                                        .padding(.leading,10)
                                    Text("Insignias")
                                        .font(.footnote)
                                        .foregroundStyle(.black)
                                        .padding(.trailing,200)
                                })
                            NavigationLink(
                                destination: libreriaArticulos(),
                                label: {
                                    
                                    Image(systemName: "bookmark")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                        .foregroundColor(.black)
                                        .padding(.leading,10)
                                    Text("Libreria de Articulos")
                                        .font(.footnote)
                                        .foregroundStyle(.black)
                                    
                                    
                                })
                            Button(action: {
                            }) {
                                Image(systemName: "gearshape")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .foregroundColor(.black)
                                    .padding(.leading,10)
                                Text("Configuración")
                                    .font(.footnote)
                                    .foregroundStyle(.black)
                            }
                            Button(action: {
                            }) {
                                Image(systemName: "questionmark.circle")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .foregroundColor(.black)
                                    .padding(.leading,10)
                                Text("Ayuda y Soporte")
                                    .font(.footnote)
                                    .foregroundStyle(.black)
                            }
                        }
                        .frame(width: 350, height: 150)
                        .background(Color(.white))
                        .cornerRadius(40)
                        .shadow(radius: 3)
                    }  else {
                        Text("No hay información de la mama")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.leading,20)
                    }
                    
                    
                }
                .padding(.top,-15)
            }
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)
    }
}
/*struct PerfilMomView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilMomView(mom:MomData.moms[0])
    }
}*/

struct VectorMom: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 1.00366*width, y: 0.9436*height))
        path.addLine(to: CGPoint(x: 0.96163*width, y: 0.80356*height))
        path.addCurve(to: CGPoint(x: 0.75215*width, y: 0.42432*height), control1: CGPoint(x: 0.9196*width, y: 0.66352*height), control2: CGPoint(x: 0.83554*width, y: 0.38345*height))
        path.addCurve(to: CGPoint(x: 0.5028*width, y: 0.92804*height), control1: CGPoint(x: 0.66877*width, y: 0.46518*height), control2: CGPoint(x: 0.58606*width, y: 0.827*height))
        path.addCurve(to: CGPoint(x: 0.25218*width, y: 0.83*height), control1: CGPoint(x: 0.41954*width, y: 1.02908*height), control2: CGPoint(x: 0.33573*width, y: 0.86936*height))
        path.addCurve(to: CGPoint(x: 0.04368*width, y: 0.91211*height), control1: CGPoint(x: 0.16863*width, y: 0.79063*height), control2: CGPoint(x: 0.08533*width, y: 0.87162*height))
        path.addLine(to: CGPoint(x: 0.00202*width, y: 0.9526*height))
        path.addLine(to: CGPoint(x: 0, y: -0.01023*height))
        path.addLine(to: CGPoint(x: 0.04173*width, y: -0.0106*height))
        path.addCurve(to: CGPoint(x: 0.25041*width, y: -0.01248*height), control1: CGPoint(x: 0.08347*width, y: -0.01098*height), control2: CGPoint(x: 0.16694*width, y: -0.01173*height))
        path.addCurve(to: CGPoint(x: 0.50082*width, y: -0.01473*height), control1: CGPoint(x: 0.33388*width, y: -0.01323*height), control2: CGPoint(x: 0.41735*width, y: -0.01398*height))
        path.addCurve(to: CGPoint(x: 0.75122*width, y: -0.01698*height), control1: CGPoint(x: 0.58429*width, y: -0.01548*height), control2: CGPoint(x: 0.66775*width, y: -0.01623*height))
        path.addCurve(to: CGPoint(x: 0.9599*width, y: -0.01886*height), control1: CGPoint(x: 0.83469*width, y: -0.01773*height), control2: CGPoint(x: 0.91816*width, y: -0.01848*height))
        path.addLine(to: CGPoint(x: 1.00163*width, y: -0.01923*height))
        path.addLine(to: CGPoint(x: 1.00366*width, y: 0.9436*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 1.00366*width, y: 0.9436*height))
        path.addLine(to: CGPoint(x: 0.96163*width, y: 0.80356*height))
        path.addCurve(to: CGPoint(x: 0.75215*width, y: 0.42432*height), control1: CGPoint(x: 0.9196*width, y: 0.66352*height), control2: CGPoint(x: 0.83554*width, y: 0.38345*height))
        path.addCurve(to: CGPoint(x: 0.5028*width, y: 0.92804*height), control1: CGPoint(x: 0.66877*width, y: 0.46518*height), control2: CGPoint(x: 0.58606*width, y: 0.827*height))
        path.addCurve(to: CGPoint(x: 0.25218*width, y: 0.83*height), control1: CGPoint(x: 0.41954*width, y: 1.02908*height), control2: CGPoint(x: 0.33573*width, y: 0.86936*height))
        path.addCurve(to: CGPoint(x: 0.04368*width, y: 0.91211*height), control1: CGPoint(x: 0.16863*width, y: 0.79063*height), control2: CGPoint(x: 0.08533*width, y: 0.87162*height))
        path.addLine(to: CGPoint(x: 0.00202*width, y: 0.9526*height))
        path.addLine(to: CGPoint(x: 0, y: -0.01023*height))
        path.addLine(to: CGPoint(x: 0.04173*width, y: -0.0106*height))
        path.addCurve(to: CGPoint(x: 0.25041*width, y: -0.01248*height), control1: CGPoint(x: 0.08347*width, y: -0.01098*height), control2: CGPoint(x: 0.16694*width, y: -0.01173*height))
        path.addCurve(to: CGPoint(x: 0.50082*width, y: -0.01473*height), control1: CGPoint(x: 0.33388*width, y: -0.01323*height), control2: CGPoint(x: 0.41735*width, y: -0.01398*height))
        path.addCurve(to: CGPoint(x: 0.75122*width, y: -0.01698*height), control1: CGPoint(x: 0.58429*width, y: -0.01548*height), control2: CGPoint(x: 0.66775*width, y: -0.01623*height))
        path.addCurve(to: CGPoint(x: 0.9599*width, y: -0.01886*height), control1: CGPoint(x: 0.83469*width, y: -0.01773*height), control2: CGPoint(x: 0.91816*width, y: -0.01848*height))
        path.addLine(to: CGPoint(x: 1.00163*width, y: -0.01923*height))
        path.addLine(to: CGPoint(x: 1.00366*width, y: 0.9436*height))
        path.closeSubpath()
        return path
    }
}

struct BackGroundMom: View {
    var body: some View {
        ZStack {
            // Fondo de color crema
            Color("ColorFondo2")
                .edgesIgnoringSafeArea(.all)
            VectorMom()
                .foregroundColor(Color("ColorVerde"))
                .frame(width: 450,height: 200)
                .offset(y:-360)
                .shadow(color: Color.gray.opacity(0.3),radius: 4)
          
        }
    }
}

