//
//  MeidcamentosTracker.swift
//  MuunApp
//
//  Created by Doris Elena  on 23/11/23.
//

import SwiftUI

struct MedicamentosTracker: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingSheet = false
    @Binding var mom: MomData?
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        
        ZStack{
            
            Color(Color(red: 0.96, green: 0.96, blue: 0.97)).ignoresSafeArea()
            
            ZStack(alignment: .top){
                wave2_medicamentos()
                    .frame(width: 432.64734, height: 100.80618)
                    .foregroundColor(Color(red: 0.8, green: 0.84, blue: 0.56))
                    .padding(.top, 19)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
                wave1_medicamentos()
                    .frame(width: 432.64734, height: 100.80618)
                    .foregroundColor(Color(red: 0.9, green: 0.93, blue: 0.71))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
                
            }.ignoresSafeArea()
            
            HStack{
                Text("Medicamentos")
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                    .font(.system(size: 30))
                Spacer()
                
                Button(action: {
                    dismiss()
                }){
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 32))
                        .padding(.bottom, 10)
                }
                
            }.frame(maxWidth: 430, maxHeight: .infinity, alignment: .topTrailing)
                .padding(25)
                .padding(.trailing, 10)
                .padding(.leading, 10)
            VStack{
                Spacer()
                
                
                if let mom = mom {
                    
                    if let baby = mom.baby {
                        HStack{
                            Text("Medicamentos de ")
                                .foregroundColor(.black)
                                .fontWeight(.light)
                                .font(.system(size: 20)) +
                            Text(baby.name)
                                .foregroundColor(.black)
                                .fontWeight(.bold) // Bold for the baby's name
                                .font(.system(size: 20))
                        }
                    } else {
                        Text("No hay información del bebé")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.leading,20)
                    }
                    
                }  else {
                    Text("No hay información de la mama")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.leading,20)
                }
                
                Spacer()
                
                MedicamentosTracker_Card(medicamento: MedicamentoData.medicamentos[0])
                    .padding(.bottom, 46)
                
                
                MedicamentosTracker_Card(medicamento: MedicamentoData.medicamentos[1])
                
                
                Spacer()
                
                
                Button(action: {
                    showingSheet = true
                }){
                    Text("Agregar Medicamento")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .fontWeight(.medium)
                        .frame(width: 300, height: 55)
                        .background(Color(red: 0.8, green: 0.84, blue: 0.56))
                        .cornerRadius(60)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                }
                .sheet(isPresented: $showingSheet) {
                    RegistrarMed()
                }
            }
        }
    }
}





struct wave1_medicamentos: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: -0.00578*width, y: 0.99023*height))
        path.addLine(to: CGPoint(x: 0.03605*width, y: 0.91539*height))
        path.addCurve(to: CGPoint(x: 0.2454*width, y: 0.68904*height), control1: CGPoint(x: 0.07789*width, y: 0.84055*height), control2: CGPoint(x: 0.16156*width, y: 0.69086*height))
        path.addCurve(to: CGPoint(x: 0.49714*width, y: 0.84992*height), control1: CGPoint(x: 0.32925*width, y: 0.68722*height), control2: CGPoint(x: 0.41327*width, y: 0.83326*height))
        path.addCurve(to: CGPoint(x: 0.74841*width, y: 0.62266*height), control1: CGPoint(x: 0.581*width, y: 0.86658*height), control2: CGPoint(x: 0.66472*width, y: 0.75386*height))
        path.addCurve(to: CGPoint(x: 0.9576*width, y: 0.26693*height), control1: CGPoint(x: 0.8321*width, y: 0.49146*height), control2: CGPoint(x: 0.91577*width, y: 0.34177*height))
        path.addLine(to: CGPoint(x: 0.99943*width, y: 0.19209*height))
        path.addLine(to: CGPoint(x: 0.99917*width, y: -0.0297*height))
        path.addLine(to: CGPoint(x: 0.95724*width, y: -0.02879*height))
        path.addCurve(to: CGPoint(x: 0.74763*width, y: -0.02424*height), control1: CGPoint(x: 0.91532*width, y: -0.02788*height), control2: CGPoint(x: 0.83148*width, y: -0.02606*height))
        path.addCurve(to: CGPoint(x: 0.4961*width, y: -0.01877*height), control1: CGPoint(x: 0.66379*width, y: -0.02241*height), control2: CGPoint(x: 0.57994*width, y: -0.02059*height))
        path.addCurve(to: CGPoint(x: 0.24456*width, y: -0.0133*height), control1: CGPoint(x: 0.41225*width, y: -0.01695*height), control2: CGPoint(x: 0.3284*width, y: -0.01513*height))
        path.addCurve(to: CGPoint(x: 0.03495*width, y: -0.00875*height), control1: CGPoint(x: 0.16071*width, y: -0.01148*height), control2: CGPoint(x: 0.07687*width, y: -0.00966*height))
        path.addLine(to: CGPoint(x: -0.00698*width, y: -0.00784*height))
        path.addLine(to: CGPoint(x: -0.00578*width, y: 0.99023*height))
        path.closeSubpath()
        return path
    }
}


struct wave2_medicamentos: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.0012*width, y: 0.99051*height))
        path.addLine(to: CGPoint(x: 0.04303*width, y: 0.91783*height))
        path.addCurve(to: CGPoint(x: 0.25238*width, y: 0.69801*height), control1: CGPoint(x: 0.08486*width, y: 0.84515*height), control2: CGPoint(x: 0.16853*width, y: 0.69978*height))
        path.addCurve(to: CGPoint(x: 0.50411*width, y: 0.85425*height), control1: CGPoint(x: 0.33622*width, y: 0.69624*height), control2: CGPoint(x: 0.42025*width, y: 0.83807*height))
        path.addCurve(to: CGPoint(x: 0.75538*width, y: 0.63354*height), control1: CGPoint(x: 0.58798*width, y: 0.87043*height), control2: CGPoint(x: 0.67169*width, y: 0.76096*height))
        path.addCurve(to: CGPoint(x: 0.96458*width, y: 0.28808*height), control1: CGPoint(x: 0.83907*width, y: 0.50613*height), control2: CGPoint(x: 0.92274*width, y: 0.36076*height))
        path.addLine(to: CGPoint(x: 1.00641*width, y: 0.2154*height))
        path.addLine(to: CGPoint(x: 1.00614*width, y: 0))
        path.addLine(to: CGPoint(x: 0.96422*width, y: 0.00088*height))
        path.addCurve(to: CGPoint(x: 0.75461*width, y: 0.00531*height), control1: CGPoint(x: 0.9223*width, y: 0.00177*height), control2: CGPoint(x: 0.83845*width, y: 0.00354*height))
        path.addCurve(to: CGPoint(x: 0.50307*width, y: 0.01062*height), control1: CGPoint(x: 0.67076*width, y: 0.00708*height), control2: CGPoint(x: 0.58692*width, y: 0.00885*height))
        path.addCurve(to: CGPoint(x: 0.25154*width, y: 0.01593*height), control1: CGPoint(x: 0.41923*width, y: 0.01239*height), control2: CGPoint(x: 0.33538*width, y: 0.01416*height))
        path.addCurve(to: CGPoint(x: 0.04192*width, y: 0.02035*height), control1: CGPoint(x: 0.16769*width, y: 0.01769*height), control2: CGPoint(x: 0.08385*width, y: 0.01946*height))
        path.addLine(to: CGPoint(x: 0, y: 0.02123*height))
        path.addLine(to: CGPoint(x: 0.0012*width, y: 0.99051*height))
        path.closeSubpath()
        return path
    }
}

/*struct MedicamentosTracker_Previews : PreviewProvider {
    static var previews: some View {
        MedicamentosTracker()
    }
}*/

