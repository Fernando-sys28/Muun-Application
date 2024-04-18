//
//  TrackerSintomas.swift
//  Muun
//
//  Created by Pimienta on 23/11/23.
//

import SwiftUI
import Combine

struct TrackerSintomas: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedOptions: Set<String>=[]
    var body: some View {
        ZStack{
            Color(.colorFondo2).ignoresSafeArea()
            
            ZStack (alignment: .top){
                        wave2TrackerSintomas()
                            .foregroundColor(Color(red: 0.95, green: 0.77, blue: 0.75))
                            .frame(width: 412, height: 143)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
                        
                        wave1TrackerSintomas()
                            .foregroundColor(Color(red: 0.96, green: 0.86, blue: 0.85))
                            .frame(width: 412, height: 117)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
                    }.ignoresSafeArea() //zstack
            
            
            HStack{
                        Text("Síntomas")
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
                        .padding(.leading, 10) //hstack
                        
            
            
            VStack(spacing: 20){
               
                VStack(){
                    Text("Selecciona los síntomas que")
                        .padding(.top, 50)
                    Text("que mejor describan a tu bebé")
                        .padding(.bottom, 20)
                }//texto
                
                
                HStack(spacing: 30){
                    VStack{
                        Circle()
                            .fill(selectedOptions.contains("Feliz") ? Color(red:0.86, green: 0.85, blue:0.52):Color(red:0.96, green: 0.94, blue: 0.52))
                            .frame(width: 118.35, height: 118.35)
                            .overlay(
                                Circle()
                                    .fill(Color(red:0.96, green: 0.94, blue: 0.52))
                                    .frame(width: 108.35, height: 108.35)
                                    .overlay(Icon1()
                                    .frame(width: 28.60, height: 28.60))
                                    .onTapGesture {
                                        toggleSelection(option: "Feliz")
                                                            }
                            )
                            Text("Feliz")
                        }//feliz
                    
                    VStack{
                        Circle()
                            .fill(selectedOptions.contains("Enojado") ? Color(red: 0.75, green: 0.37, blue: 0.37):Color(red:0.95, green: 0.47, blue: 0.47))
                            .frame(width: 118.35, height: 118.35)
                            .overlay(
                                Circle()
                                    .fill(Color(red:0.95, green: 0.47, blue: 0.47))
                                    .frame(width: 108.35, height: 108.35)
                                    .overlay(Icon2()
                                    .frame(width: 28.60, height: 28.60))
                                    .onTapGesture {
                                        toggleSelection(option: "Enojado")
                                    }
                            )
                        Text("Enojado")
                    }//enojado
                }//hstack1
                
                HStack(spacing: 30){
                    VStack{
                        Circle()
                            .fill(selectedOptions.contains("Llorón") ? Color(red: 0.54, green: 0.72, blue: 0.79):Color(red:0.62, green: 0.82, blue: 0.9))
                            .frame(width: 118.35, height: 118.35)
                            .overlay(
                                Circle()
                                    .fill(Color(red:0.62, green: 0.82, blue: 0.9))
                                    .frame(width: 108.35, height: 108.35)
                                    .overlay(Icon3()
                                    .frame(width: 28.60, height: 28.60))
                                    .onTapGesture {
                                        toggleSelection(option: "Llorón")
                                    }
                            )
                        Text("Llorón")
                    }//llorón
                    
                    VStack{
                        Circle()
                            .fill(selectedOptions.contains("Enfermo") ? Color(red: 0.51, green: 0.5, blue: 0.5):Color(red:0.62, green: 0.62, blue: 0.62))
                            .frame(width: 118.35, height: 118.35)
                            .overlay(
                                Circle()
                                    .fill(Color(red:0.62, green: 0.62, blue: 0.62))
                                    .frame(width: 108.35, height: 108.35)
                                    .overlay(Icon4()
                                    .frame(width: 28.60, height: 28.60))
                                    .onTapGesture {
                                        toggleSelection(option: "Enfermo")
                                    }
                            )
                        Text("Enfermo")
                    }//enfermo
                    
                }//HStack2
                HStack(spacing: 30){
                    VStack{
                        Circle()
                            .fill(selectedOptions.contains("Tranquilo") ? Color(red: 0.5, green: 0.75, blue: 0.48):Color(red:0.56, green: 0.87, blue: 0.54))
                            .frame(width: 118.35, height: 118.35)
                            .overlay(
                                Circle()
                                    .fill(Color(red:0.56, green: 0.87, blue: 0.54))
                                    .frame(width: 108.35, height: 108.35)
                                    .overlay(Icon5()
                                    .frame(width: 38.60, height: 38.60))
                                    .onTapGesture {
                                        toggleSelection(option: "Tranquilo")
                                    }
                            )
                        
                        Text("Tranquilo")
                    }//tranquilo
                    
                    VStack{
                        Circle()
                            .fill(selectedOptions.contains("Inquieto") ? Color(red: 0.69, green: 0.54, blue: 0.4):Color(red:0.81, green: 0.64, blue: 0.49))
                            .frame(width: 118.35, height: 118.35)
                            .overlay(
                                Circle()
                                    .fill(Color(red:0.81, green: 0.64, blue: 0.49))
                                    .frame(width: 108.35, height: 108.35)
                                    .overlay(Icon6()
                                    .frame(width: 28.60, height: 28.60))
                                    .onTapGesture {
                                        toggleSelection(option: "Inquieto")
                                    }
                            )
                        
                        Text("Inquieto")
                    }//inquieto
                    
                }//hstack3
                
                Button(action: {
                    dismiss()// Acción del botón de inicio de sesión
                }) {
                    Text("Guardar")
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
                .padding(.horizontal)
                .padding(.top,25)
              
                
            }//VStack
            
        }//ZStack
        
    }
    
    func toggleSelection(option: String) {
            if selectedOptions.contains(option) {
                selectedOptions.remove(option)
            } else {
                selectedOptions.insert(option)
            }
    }
}


struct wave2TrackerSintomas: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 1.05116*width, y: 0.77778*height))
        path.addLine(to: CGPoint(x: 0.99195*width, y: 0.81481*height))
        path.addCurve(to: CGPoint(x: 0.69767*width, y: 0.85185*height), control1: CGPoint(x: 0.93363*width, y: 0.85185*height), control2: CGPoint(x: 0.81521*width, y: 0.92593*height))
        path.addCurve(to: CGPoint(x: 0.34419*width, y: 0.55556*height), control1: CGPoint(x: 0.58014*width, y: 0.77778*height), control2: CGPoint(x: 0.46172*width, y: 0.55556*height))
        path.addCurve(to: CGPoint(x: 0.04991*width, y: 0.88889*height), control1: CGPoint(x: 0.22665*width, y: 0.55556*height), control2: CGPoint(x: 0.10823*width, y: 0.77778*height))
        path.addLine(to: CGPoint(x: -0.0093*width, y: height))
        path.addLine(to: CGPoint(x: -0.0093*width, y: 0))
        path.addLine(to: CGPoint(x: 0.04991*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.34419*width, y: 0), control1: CGPoint(x: 0.10823*width, y: 0), control2: CGPoint(x: 0.22665*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.69767*width, y: 0), control1: CGPoint(x: 0.46172*width, y: 0), control2: CGPoint(x: 0.58014*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.99195*width, y: 0), control1: CGPoint(x: 0.81521*width, y: 0), control2: CGPoint(x: 0.93363*width, y: 0))
        path.addLine(to: CGPoint(x: 1.05116*width, y: 0))
        path.addLine(to: CGPoint(x: 1.05116*width, y: 0.77778*height))
        path.closeSubpath()
        return path
    }
}

struct wave1TrackerSintomas: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 1.00465*width, y: 0.77778*height))
        path.addLine(to: CGPoint(x: 0.9483*width, y: 0.81481*height))
        path.addCurve(to: CGPoint(x: 0.66822*width, y: 0.85185*height), control1: CGPoint(x: 0.89279*width, y: 0.85185*height), control2: CGPoint(x: 0.78008*width, y: 0.92592*height))
        path.addCurve(to: CGPoint(x: 0.33178*width, y: 0.55556*height), control1: CGPoint(x: 0.55635*width, y: 0.77778*height), control2: CGPoint(x: 0.44365*width, y: 0.55556*height))
        path.addCurve(to: CGPoint(x: 0.0517*width, y: 0.88889*height), control1: CGPoint(x: 0.21992*width, y: 0.55556*height), control2: CGPoint(x: 0.10721*width, y: 0.77778*height))
        path.addLine(to: CGPoint(x: -0.00465*width, y: height))
        path.addLine(to: CGPoint(x: -0.00465*width, y: 0))
        path.addLine(to: CGPoint(x: 0.0517*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.33178*width, y: 0), control1: CGPoint(x: 0.10721*width, y: 0), control2: CGPoint(x: 0.21992*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.66822*width, y: 0), control1: CGPoint(x: 0.44365*width, y: 0), control2: CGPoint(x: 0.55635*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.9483*width, y: 0), control1: CGPoint(x: 0.78008*width, y: 0), control2: CGPoint(x: 0.89279*width, y: 0))
        path.addLine(to: CGPoint(x: 1.00465*width, y: 0))
        path.addLine(to: CGPoint(x: 1.00465*width, y: 0.77778*height))
        path.closeSubpath()
        return path
    }
}

struct Icon1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.18864*width, y: 0.54597*height))
        path.addLine(to: CGPoint(x: 0.19315*width, y: 0.55505*height))
        path.addCurve(to: CGPoint(x: 0.49164*width, y: 0.8061*height), control1: CGPoint(x: 0.21795*width, y: 0.69767*height), control2: CGPoint(x: 0.34215*width, y: 0.8061*height))
        path.addCurve(to: CGPoint(x: 0.79014*width, y: 0.55506*height), control1: CGPoint(x: 0.64113*width, y: 0.8061*height), control2: CGPoint(x: 0.76534*width, y: 0.69768*height))
        path.addLine(to: CGPoint(x: 0.79465*width, y: 0.54597*height))
        path.addCurve(to: CGPoint(x: 0.88411*width, y: 0.45927*height), control1: CGPoint(x: 0.79465*width, y: 0.4933*height), control2: CGPoint(x: 0.83151*width, y: 0.45927*height))
        path.addCurve(to: CGPoint(x: 0.96779*width, y: 0.54597*height), control1: CGPoint(x: 0.92984*width, y: 0.45927*height), control2: CGPoint(x: 0.95861*width, y: 0.50291*height))
        path.addCurve(to: CGPoint(x: 0.49164*width, y: 0.97952*height), control1: CGPoint(x: 0.94593*width, y: 0.77135*height), control2: CGPoint(x: 0.72241*width, y: 0.97952*height))
        path.addCurve(to: CGPoint(x: 0.01549*width, y: 0.54597*height), control1: CGPoint(x: 0.26088*width, y: 0.97952*height), control2: CGPoint(x: 0.03735*width, y: 0.77135*height))
        path.addCurve(to: CGPoint(x: 0.09918*width, y: 0.45926*height), control1: CGPoint(x: 0.02468*width, y: 0.50291*height), control2: CGPoint(x: 0.05344*width, y: 0.45926*height))
        path.addCurve(to: CGPoint(x: 0.18864*width, y: 0.54597*height), control1: CGPoint(x: 0.15177*width, y: 0.45926*height), control2: CGPoint(x: 0.18864*width, y: 0.4933*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.23192*width, y: 0.02572*height))
        path.addCurve(to: CGPoint(x: 0.36179*width, y: 0.15578*height), control1: CGPoint(x: 0.30365*width, y: 0.02572*height), control2: CGPoint(x: 0.36179*width, y: 0.08395*height))
        path.addCurve(to: CGPoint(x: 0.23192*width, y: 0.28585*height), control1: CGPoint(x: 0.36179*width, y: 0.22761*height), control2: CGPoint(x: 0.30365*width, y: 0.28585*height))
        path.addCurve(to: CGPoint(x: 0.10207*width, y: 0.15578*height), control1: CGPoint(x: 0.16021*width, y: 0.28585*height), control2: CGPoint(x: 0.10207*width, y: 0.22761*height))
        path.addCurve(to: CGPoint(x: 0.23192*width, y: 0.02572*height), control1: CGPoint(x: 0.10207*width, y: 0.08395*height), control2: CGPoint(x: 0.16021*width, y: 0.02572*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.75136*width, y: 0.02572*height))
        path.addCurve(to: CGPoint(x: 0.88122*width, y: 0.15578*height), control1: CGPoint(x: 0.82308*width, y: 0.02572*height), control2: CGPoint(x: 0.88122*width, y: 0.08395*height))
        path.addCurve(to: CGPoint(x: 0.75136*width, y: 0.28585*height), control1: CGPoint(x: 0.88122*width, y: 0.22761*height), control2: CGPoint(x: 0.82308*width, y: 0.28585*height))
        path.addCurve(to: CGPoint(x: 0.6215*width, y: 0.15578*height), control1: CGPoint(x: 0.67964*width, y: 0.28585*height), control2: CGPoint(x: 0.6215*width, y: 0.22761*height))
        path.addCurve(to: CGPoint(x: 0.75136*width, y: 0.02572*height), control1: CGPoint(x: 0.6215*width, y: 0.08395*height), control2: CGPoint(x: 0.67964*width, y: 0.02572*height))
        path.closeSubpath()
        return path
    }
}

struct Icon2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.07984*width, y: 0.03086*height))
        path.addCurve(to: CGPoint(x: 0.03421*width, y: 0.06553*height), control1: CGPoint(x: 0.06097*width, y: 0.03093*height), control2: CGPoint(x: 0.04289*width, y: 0.04371*height))
        path.addCurve(to: CGPoint(x: 0.05808*width, y: 0.14681*height), control1: CGPoint(x: 0.02213*width, y: 0.09589*height), control2: CGPoint(x: 0.03282*width, y: 0.1323*height))
        path.addLine(to: CGPoint(x: 0.20269*width, y: 0.23869*height))
        path.addCurve(to: CGPoint(x: 0.23511*width, y: 0.38537*height), control1: CGPoint(x: 0.1998*width, y: 0.29102*height), control2: CGPoint(x: 0.2106*width, y: 0.34496*height))
        path.addCurve(to: CGPoint(x: 0.31831*width, y: 0.44161*height), control1: CGPoint(x: 0.25469*width, y: 0.41769*height), control2: CGPoint(x: 0.284*width, y: 0.44161*height))
        path.addCurve(to: CGPoint(x: 0.43374*width, y: 0.23622*height), control1: CGPoint(x: 0.40417*width, y: 0.44161*height), control2: CGPoint(x: 0.43891*width, y: 0.31879*height))
        path.addCurve(to: CGPoint(x: 0.10184*width, y: 0.03683*height), control1: CGPoint(x: 0.31964*width, y: 0.17573*height), control2: CGPoint(x: 0.2129*width, y: 0.10485*height))
        path.addCurve(to: CGPoint(x: 0.07984*width, y: 0.03086*height), control1: CGPoint(x: 0.09474*width, y: 0.03275*height), control2: CGPoint(x: 0.08723*width, y: 0.03083*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.93094*width, y: 0.03086*height))
        path.addCurve(to: CGPoint(x: 0.90894*width, y: 0.03683*height), control1: CGPoint(x: 0.92355*width, y: 0.03083*height), control2: CGPoint(x: 0.91604*width, y: 0.03275*height))
        path.addCurve(to: CGPoint(x: 0.57704*width, y: 0.23622*height), control1: CGPoint(x: 0.79788*width, y: 0.10485*height), control2: CGPoint(x: 0.69114*width, y: 0.17573*height))
        path.addCurve(to: CGPoint(x: 0.69247*width, y: 0.44161*height), control1: CGPoint(x: 0.57186*width, y: 0.31879*height), control2: CGPoint(x: 0.60661*width, y: 0.44161*height))
        path.addCurve(to: CGPoint(x: 0.77567*width, y: 0.38537*height), control1: CGPoint(x: 0.72677*width, y: 0.44161*height), control2: CGPoint(x: 0.75609*width, y: 0.41769*height))
        path.addCurve(to: CGPoint(x: 0.80809*width, y: 0.23869*height), control1: CGPoint(x: 0.80017*width, y: 0.34496*height), control2: CGPoint(x: 0.81098*width, y: 0.29102*height))
        path.addLine(to: CGPoint(x: 0.95269*width, y: 0.14681*height))
        path.addCurve(to: CGPoint(x: 0.97657*width, y: 0.06553*height), control1: CGPoint(x: 0.97796*width, y: 0.1323*height), control2: CGPoint(x: 0.98865*width, y: 0.09589*height))
        path.addCurve(to: CGPoint(x: 0.93094*width, y: 0.03086*height), control1: CGPoint(x: 0.96789*width, y: 0.0437*height), control2: CGPoint(x: 0.9498*width, y: 0.03093*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.49982*width, y: 0.64579*height))
        path.addCurve(to: CGPoint(x: 0.06103*width, y: 0.85644*height), control1: CGPoint(x: 0.34245*width, y: 0.64634*height), control2: CGPoint(x: 0.18506*width, y: 0.71648*height))
        path.addLine(to: CGPoint(x: 0.05826*width, y: 0.85984*height))
        path.addCurve(to: CGPoint(x: 0.04451*width, y: 0.8758*height), control1: CGPoint(x: 0.05266*width, y: 0.86623*height), control2: CGPoint(x: 0.04805*width, y: 0.87151*height))
        path.addCurve(to: CGPoint(x: 0.04394*width, y: 0.96306*height), control1: CGPoint(x: 0.02475*width, y: 0.89966*height), control2: CGPoint(x: 0.02453*width, y: 0.93876*height))
        path.addCurve(to: CGPoint(x: 0.11494*width, y: 0.96377*height), control1: CGPoint(x: 0.06335*width, y: 0.98736*height), control2: CGPoint(x: 0.09517*width, y: 0.98764*height))
        path.addLine(to: CGPoint(x: 0.12646*width, y: 0.95007*height))
        path.addLine(to: CGPoint(x: 0.12908*width, y: 0.94732*height))
        path.addCurve(to: CGPoint(x: 0.50649*width, y: 0.76911*height), control1: CGPoint(x: 0.2357*width, y: 0.827*height), control2: CGPoint(x: 0.37136*width, y: 0.76765*height))
        path.addCurve(to: CGPoint(x: 0.88375*width, y: 0.95816*height), control1: CGPoint(x: 0.64264*width, y: 0.77052*height), control2: CGPoint(x: 0.77848*width, y: 0.83368*height))
        path.addCurve(to: CGPoint(x: 0.89527*width, y: 0.97214*height), control1: CGPoint(x: 0.88774*width, y: 0.96286*height), control2: CGPoint(x: 0.89166*width, y: 0.9676*height))
        path.addCurve(to: CGPoint(x: 0.96627*width, y: 0.97286*height), control1: CGPoint(x: 0.9147*width, y: 0.99644*height), control2: CGPoint(x: 0.94651*width, y: 0.99675*height))
        path.addCurve(to: CGPoint(x: 0.96683*width, y: 0.88556*height), control1: CGPoint(x: 0.98603*width, y: 0.94899*height), control2: CGPoint(x: 0.98624*width, y: 0.90987*height))
        path.addCurve(to: CGPoint(x: 0.95335*width, y: 0.86918*height), control1: CGPoint(x: 0.96229*width, y: 0.87986*height), control2: CGPoint(x: 0.95779*width, y: 0.8744*height))
        path.addCurve(to: CGPoint(x: 0.50732*width, y: 0.64579*height), control1: CGPoint(x: 0.82898*width, y: 0.72214*height), control2: CGPoint(x: 0.66836*width, y: 0.64746*height))
        path.addCurve(to: CGPoint(x: 0.49982*width, y: 0.64579*height), control1: CGPoint(x: 0.50483*width, y: 0.64576*height), control2: CGPoint(x: 0.50232*width, y: 0.64578*height))
        path.addLine(to: CGPoint(x: 0.49982*width, y: 0.64579*height))
        path.closeSubpath()
        return path
    }
}

struct Icon3: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.37453*width, y: 0.84432*height))
        path.addCurve(to: CGPoint(x: 0.84339*width, y: 0.79747*height), control1: CGPoint(x: 0.46211*width, y: 0.34437*height), control2: CGPoint(x: 0.91313*width, y: 0.76401*height))
        path.addCurve(to: CGPoint(x: 0.42012*width, y: 0.8912*height), control1: CGPoint(x: 0.70936*width, y: 0.86176*height), control2: CGPoint(x: 0.55755*width, y: 0.84174*height))
        path.move(to: CGPoint(x: 0.30073*width, y: 0.08252*height))
        path.addCurve(to: CGPoint(x: 0.21087*width, y: 0.36244*height), control1: CGPoint(x: 0.56293*width, y: 0.34237*height), control2: CGPoint(x: 0.62209*width, y: 0.11714*height))
        path.move(to: CGPoint(x: 0.93253*width, y: 0.07218*height))
        path.addCurve(to: CGPoint(x: 0.69445*width, y: 0.23158*height), control1: CGPoint(x: 0.83832*width, y: 0.1487*height), control2: CGPoint(x: 0.75897*width, y: 0.20183*height))
        path.addCurve(to: CGPoint(x: 0.93253*width, y: 0.36247*height), control1: CGPoint(x: 0.79366*width, y: 0.30063*height), control2: CGPoint(x: 0.87302*width, y: 0.34427*height))
        path.move(to: CGPoint(x: 0.17779*width, y: 0.5076*height))
        path.addCurve(to: CGPoint(x: 0.27702*width, y: 0.73194*height), control1: CGPoint(x: -0.19174*width, y: 1.11569*height), control2: CGPoint(x: 0.30022*width, y: 0.93011*height))
        path.addCurve(to: CGPoint(x: 0.17779*width, y: 0.5076*height), control1: CGPoint(x: 0.26891*width, y: 0.66277*height), control2: CGPoint(x: 0.20347*width, y: 0.57154*height))
        path.closeSubpath()
        return path
    }
}

struct Icon4: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.18585*width, y: 0.31861*height))
        path.addCurve(to: CGPoint(x: 0.30861*width, y: 0.17721*height), control1: CGPoint(x: 0.25365*width, y: 0.31861*height), control2: CGPoint(x: 0.30861*width, y: 0.2553*height))
        path.addCurve(to: CGPoint(x: 0.18585*width, y: 0.03582*height), control1: CGPoint(x: 0.30861*width, y: 0.09912*height), control2: CGPoint(x: 0.25365*width, y: 0.03582*height))
        path.addCurve(to: CGPoint(x: 0.06309*width, y: 0.17721*height), control1: CGPoint(x: 0.11806*width, y: 0.03582*height), control2: CGPoint(x: 0.06309*width, y: 0.09912*height))
        path.addCurve(to: CGPoint(x: 0.18585*width, y: 0.31861*height), control1: CGPoint(x: 0.06309*width, y: 0.2553*height), control2: CGPoint(x: 0.11806*width, y: 0.31861*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.79966*width, y: 0.31861*height))
        path.addCurve(to: CGPoint(x: 0.92241*width, y: 0.17721*height), control1: CGPoint(x: 0.86745*width, y: 0.31861*height), control2: CGPoint(x: 0.92241*width, y: 0.2553*height))
        path.addCurve(to: CGPoint(x: 0.79966*width, y: 0.03582*height), control1: CGPoint(x: 0.92241*width, y: 0.09912*height), control2: CGPoint(x: 0.86745*width, y: 0.03582*height))
        path.addCurve(to: CGPoint(x: 0.6769*width, y: 0.17721*height), control1: CGPoint(x: 0.73186*width, y: 0.03582*height), control2: CGPoint(x: 0.6769*width, y: 0.09912*height))
        path.addCurve(to: CGPoint(x: 0.79966*width, y: 0.31861*height), control1: CGPoint(x: 0.6769*width, y: 0.2553*height), control2: CGPoint(x: 0.73186*width, y: 0.31861*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.71494*width, y: 0.68556*height))
        path.addLine(to: CGPoint(x: 0.57868*width, y: 0.79726*height))
        path.addLine(to: CGPoint(x: 0.44242*width, y: 0.68556*height))
        path.addCurve(to: CGPoint(x: 0.40682*width, y: 0.67245*height), control1: CGPoint(x: 0.43202*width, y: 0.67703*height), control2: CGPoint(x: 0.41958*width, y: 0.67245*height))
        path.addCurve(to: CGPoint(x: 0.37122*width, y: 0.68556*height), control1: CGPoint(x: 0.39406*width, y: 0.67245*height), control2: CGPoint(x: 0.38161*width, y: 0.67703*height))
        path.addLine(to: CGPoint(x: 0.23496*width, y: 0.79726*height))
        path.addLine(to: CGPoint(x: 0.09869*width, y: 0.68556*height))
        path.addLine(to: CGPoint(x: 0.02749*width, y: 0.80009*height))
        path.addLine(to: CGPoint(x: 0.19936*width, y: 0.94148*height))
        path.addCurve(to: CGPoint(x: 0.23496*width, y: 0.95459*height), control1: CGPoint(x: 0.20975*width, y: 0.95001*height), control2: CGPoint(x: 0.22219*width, y: 0.95459*height))
        path.addCurve(to: CGPoint(x: 0.27056*width, y: 0.94148*height), control1: CGPoint(x: 0.24772*width, y: 0.95459*height), control2: CGPoint(x: 0.26016*width, y: 0.95001*height))
        path.addLine(to: CGPoint(x: 0.40682*width, y: 0.82978*height))
        path.addLine(to: CGPoint(x: 0.54308*width, y: 0.94148*height))
        path.addCurve(to: CGPoint(x: 0.57868*width, y: 0.95459*height), control1: CGPoint(x: 0.55348*width, y: 0.95001*height), control2: CGPoint(x: 0.56592*width, y: 0.95459*height))
        path.addCurve(to: CGPoint(x: 0.61428*width, y: 0.94148*height), control1: CGPoint(x: 0.59144*width, y: 0.95459*height), control2: CGPoint(x: 0.60389*width, y: 0.95001*height))
        path.addLine(to: CGPoint(x: 0.75054*width, y: 0.82907*height))
        path.addLine(to: CGPoint(x: 0.88681*width, y: 0.94148*height))
        path.addLine(to: CGPoint(x: 0.95801*width, y: 0.82624*height))
        path.addLine(to: CGPoint(x: 0.78614*width, y: 0.68485*height))
        path.addCurve(to: CGPoint(x: 0.75045*width, y: 0.67209*height), control1: CGPoint(x: 0.77569*width, y: 0.67643*height), control2: CGPoint(x: 0.76321*width, y: 0.67197*height))
        path.addCurve(to: CGPoint(x: 0.71494*width, y: 0.68556*height), control1: CGPoint(x: 0.73769*width, y: 0.67222*height), control2: CGPoint(x: 0.72527*width, y: 0.67693*height))
        path.closeSubpath()
        return path
    }
}

struct Icon5: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.35666*width, y: 0.26902*height))
        path.addCurve(to: CGPoint(x: 0.45502*width, y: 0.36753*height), control1: CGPoint(x: 0.41076*width, y: 0.26902*height), control2: CGPoint(x: 0.45502*width, y: 0.31286*height))
        path.addCurve(to: CGPoint(x: 0.44125*width, y: 0.41679*height), control1: CGPoint(x: 0.45502*width, y: 0.38576*height), control2: CGPoint(x: 0.44961*width, y: 0.40251*height))
        path.addCurve(to: CGPoint(x: 0.35666*width, y: 0.40694*height), control1: CGPoint(x: 0.44125*width, y: 0.41679*height), control2: CGPoint(x: 0.40584*width, y: 0.40694*height))
        path.addCurve(to: CGPoint(x: 0.27207*width, y: 0.41679*height), control1: CGPoint(x: 0.30748*width, y: 0.40694*height), control2: CGPoint(x: 0.27207*width, y: 0.41679*height))
        path.addCurve(to: CGPoint(x: 0.2583*width, y: 0.36753*height), control1: CGPoint(x: 0.26371*width, y: 0.40251*height), control2: CGPoint(x: 0.2583*width, y: 0.38576*height))
        path.addCurve(to: CGPoint(x: 0.35666*width, y: 0.26902*height), control1: CGPoint(x: 0.2583*width, y: 0.31286*height), control2: CGPoint(x: 0.30256*width, y: 0.26902*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.65174*width, y: 0.26902*height))
        path.addCurve(to: CGPoint(x: 0.7501*width, y: 0.36753*height), control1: CGPoint(x: 0.70633*width, y: 0.26902*height), control2: CGPoint(x: 0.7501*width, y: 0.31286*height))
        path.addCurve(to: CGPoint(x: 0.73633*width, y: 0.41679*height), control1: CGPoint(x: 0.7501*width, y: 0.38576*height), control2: CGPoint(x: 0.74469*width, y: 0.40251*height))
        path.addCurve(to: CGPoint(x: 0.65174*width, y: 0.40694*height), control1: CGPoint(x: 0.73633*width, y: 0.41679*height), control2: CGPoint(x: 0.70092*width, y: 0.40694*height))
        path.addCurve(to: CGPoint(x: 0.56715*width, y: 0.41679*height), control1: CGPoint(x: 0.60256*width, y: 0.40694*height), control2: CGPoint(x: 0.56715*width, y: 0.41679*height))
        path.addCurve(to: CGPoint(x: 0.55338*width, y: 0.36753*height), control1: CGPoint(x: 0.55879*width, y: 0.40251*height), control2: CGPoint(x: 0.55338*width, y: 0.38576*height))
        path.addCurve(to: CGPoint(x: 0.65174*width, y: 0.26902*height), control1: CGPoint(x: 0.55338*width, y: 0.31286*height), control2: CGPoint(x: 0.59715*width, y: 0.26902*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.5042*width, y: 0.94385*height))
        path.addCurve(to: CGPoint(x: 0.90895*width, y: 0.65422*height), control1: CGPoint(x: 0.68715*width, y: 0.94385*height), control2: CGPoint(x: 0.84994*width, y: 0.8276*height))
        path.addLine(to: CGPoint(x: 0.84404*width, y: 0.63156*height))
        path.addCurve(to: CGPoint(x: 0.5042*width, y: 0.87489*height), control1: CGPoint(x: 0.79436*width, y: 0.77736*height), control2: CGPoint(x: 0.65764*width, y: 0.87489*height))
        path.addCurve(to: CGPoint(x: 0.16436*width, y: 0.63156*height), control1: CGPoint(x: 0.35076*width, y: 0.87489*height), control2: CGPoint(x: 0.21404*width, y: 0.77736*height))
        path.addLine(to: CGPoint(x: 0.09945*width, y: 0.65422*height))
        path.addCurve(to: CGPoint(x: 0.5042*width, y: 0.94385*height), control1: CGPoint(x: 0.15846*width, y: 0.8276*height), control2: CGPoint(x: 0.32125*width, y: 0.94385*height))
        path.closeSubpath()
        return path
    }
}

struct Icon6: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.1975*width, y: 0.31847*height))
        path.addCurve(to: CGPoint(x: 0.32584*width, y: 0.16137*height), control1: CGPoint(x: 0.26838*width, y: 0.31847*height), control2: CGPoint(x: 0.32584*width, y: 0.24813*height))
        path.addCurve(to: CGPoint(x: 0.1975*width, y: 0.00426*height), control1: CGPoint(x: 0.32584*width, y: 0.0746*height), control2: CGPoint(x: 0.26838*width, y: 0.00426*height))
        path.addCurve(to: CGPoint(x: 0.06916*width, y: 0.16137*height), control1: CGPoint(x: 0.12662*width, y: 0.00426*height), control2: CGPoint(x: 0.06916*width, y: 0.0746*height))
        path.addCurve(to: CGPoint(x: 0.1975*width, y: 0.31847*height), control1: CGPoint(x: 0.06916*width, y: 0.24813*height), control2: CGPoint(x: 0.12662*width, y: 0.31847*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.96754*width, y: 0.16137*height))
        path.addCurve(to: CGPoint(x: 0.8392*width, y: 0.31847*height), control1: CGPoint(x: 0.96754*width, y: 0.24813*height), control2: CGPoint(x: 0.91008*width, y: 0.31847*height))
        path.addCurve(to: CGPoint(x: 0.71086*width, y: 0.16137*height), control1: CGPoint(x: 0.76832*width, y: 0.31847*height), control2: CGPoint(x: 0.71086*width, y: 0.24813*height))
        path.addCurve(to: CGPoint(x: 0.8392*width, y: 0.00426*height), control1: CGPoint(x: 0.71086*width, y: 0.0746*height), control2: CGPoint(x: 0.76832*width, y: 0.00426*height))
        path.addCurve(to: CGPoint(x: 0.96754*width, y: 0.16137*height), control1: CGPoint(x: 0.91008*width, y: 0.00426*height), control2: CGPoint(x: 0.96754*width, y: 0.0746*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.97555*width, y: 0.92972*height))
        path.addCurve(to: CGPoint(x: 0.88566*width, y: 0.91792*height), control1: CGPoint(x: 0.948*width, y: 0.9567*height), control2: CGPoint(x: 0.90786*width, y: 0.95139*height))
        path.addLine(to: CGPoint(x: 0.88529*width, y: 0.91741*height))
        path.addCurve(to: CGPoint(x: 0.88235*width, y: 0.9134*height), control1: CGPoint(x: 0.88479*width, y: 0.9167*height), control2: CGPoint(x: 0.88381*width, y: 0.91533*height))
        path.addCurve(to: CGPoint(x: 0.86772*width, y: 0.89582*height), control1: CGPoint(x: 0.87942*width, y: 0.90953*height), control2: CGPoint(x: 0.87456*width, y: 0.90344*height))
        path.addCurve(to: CGPoint(x: 0.80266*width, y: 0.83789*height), control1: CGPoint(x: 0.85402*width, y: 0.88058*height), control2: CGPoint(x: 0.83249*width, y: 0.85937*height))
        path.addCurve(to: CGPoint(x: 0.5186*width, y: 0.75056*height), control1: CGPoint(x: 0.7434*width, y: 0.79519*height), control2: CGPoint(x: 0.65031*width, y: 0.75056*height))
        path.addCurve(to: CGPoint(x: 0.23424*width, y: 0.83793*height), control1: CGPoint(x: 0.38688*width, y: 0.75056*height), control2: CGPoint(x: 0.29365*width, y: 0.79521*height))
        path.addCurve(to: CGPoint(x: 0.16899*width, y: 0.8959*height), control1: CGPoint(x: 0.20435*width, y: 0.85942*height), control2: CGPoint(x: 0.18274*width, y: 0.88064*height))
        path.addCurve(to: CGPoint(x: 0.1543*width, y: 0.91349*height), control1: CGPoint(x: 0.16212*width, y: 0.90352*height), control2: CGPoint(x: 0.15724*width, y: 0.90963*height))
        path.addCurve(to: CGPoint(x: 0.15134*width, y: 0.9175*height), control1: CGPoint(x: 0.15283*width, y: 0.91543*height), control2: CGPoint(x: 0.15184*width, y: 0.91679*height))
        path.addLine(to: CGPoint(x: 0.15097*width, y: 0.91803*height))
        path.addCurve(to: CGPoint(x: 0.06106*width, y: 0.92963*height), control1: CGPoint(x: 0.12872*width, y: 0.95145*height), control2: CGPoint(x: 0.08857*width, y: 0.95667*height))
        path.addCurve(to: CGPoint(x: 0.05122*width, y: 0.8192*height), control1: CGPoint(x: 0.03343*width, y: 0.90247*height), control2: CGPoint(x: 0.02902*width, y: 0.85302*height))
        path.addLine(to: CGPoint(x: 0.10125*width, y: 0.86839*height))
        path.addCurve(to: CGPoint(x: 0.05122*width, y: 0.8192*height), control1: CGPoint(x: 0.05122*width, y: 0.8192*height), control2: CGPoint(x: 0.0512*width, y: 0.81923*height))
        path.addLine(to: CGPoint(x: 0.05131*width, y: 0.81906*height))
        path.addLine(to: CGPoint(x: 0.05141*width, y: 0.8189*height))
        path.addLine(to: CGPoint(x: 0.05166*width, y: 0.81852*height))
        path.addLine(to: CGPoint(x: 0.0523*width, y: 0.81758*height))
        path.addLine(to: CGPoint(x: 0.05419*width, y: 0.81484*height))
        path.addCurve(to: CGPoint(x: 0.0604*width, y: 0.80639*height), control1: CGPoint(x: 0.05571*width, y: 0.81269*height), control2: CGPoint(x: 0.05778*width, y: 0.80983*height))
        path.addCurve(to: CGPoint(x: 0.08279*width, y: 0.77951*height), control1: CGPoint(x: 0.06563*width, y: 0.79953*height), control2: CGPoint(x: 0.07307*width, y: 0.79029*height))
        path.addCurve(to: CGPoint(x: 0.16924*width, y: 0.70247*height), control1: CGPoint(x: 0.10222*width, y: 0.75794*height), control2: CGPoint(x: 0.13085*width, y: 0.73006*height))
        path.addCurve(to: CGPoint(x: 0.5186*width, y: 0.59345*height), control1: CGPoint(x: 0.24637*width, y: 0.64699*height), control2: CGPoint(x: 0.36182*width, y: 0.59345*height))
        path.addCurve(to: CGPoint(x: 0.86776*width, y: 0.7025*height), control1: CGPoint(x: 0.67538*width, y: 0.59345*height), control2: CGPoint(x: 0.79071*width, y: 0.64699*height))
        path.addCurve(to: CGPoint(x: 0.95405*width, y: 0.77958*height), control1: CGPoint(x: 0.90609*width, y: 0.73011*height), control2: CGPoint(x: 0.93467*width, y: 0.75801*height))
        path.addCurve(to: CGPoint(x: 0.9764*width, y: 0.80649*height), control1: CGPoint(x: 0.96375*width, y: 0.79037*height), control2: CGPoint(x: 0.97119*width, y: 0.79962*height))
        path.addCurve(to: CGPoint(x: 0.9826*width, y: 0.81496*height), control1: CGPoint(x: 0.979*width, y: 0.80993*height), control2: CGPoint(x: 0.98107*width, y: 0.81279*height))
        path.addLine(to: CGPoint(x: 0.98447*width, y: 0.81769*height))
        path.addLine(to: CGPoint(x: 0.98511*width, y: 0.81863*height))
        path.addLine(to: CGPoint(x: 0.98537*width, y: 0.81901*height))
        path.addLine(to: CGPoint(x: 0.98547*width, y: 0.81917*height))
        path.addCurve(to: CGPoint(x: 0.93545*width, y: 0.86839*height), control1: CGPoint(x: 0.98548*width, y: 0.8192*height), control2: CGPoint(x: 0.98556*width, y: 0.81931*height))
        path.addLine(to: CGPoint(x: 0.98556*width, y: 0.81931*height))
        path.addCurve(to: CGPoint(x: 0.97555*width, y: 0.92972*height), control1: CGPoint(x: 1.0077*width, y: 0.85318*height), control2: CGPoint(x: 1.00322*width, y: 0.90262*height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    TrackerSintomas()
}
