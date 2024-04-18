//
//  CardTracker.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 27/10/23.
//

import SwiftUI

struct CardTracker: View {
    let lastSleepDate = Date().addingTimeInterval(-3600 * 5)
    let lastFedDate = Date().addingTimeInterval(-3600 * 1)
    let lastExtractionate = Date().addingTimeInterval(-3600 * 2)
    let lastMilestoneDate = Date().addingTimeInterval(-3600 * 0.5)
    let lastPañalDate = Date().addingTimeInterval(-3600 * 0.1)
    let lastRutineDate = Date().addingTimeInterval(-3600 * 10)
    let lastGrowthDate = Date().addingTimeInterval(-3600 * 20)
    let lastSintomaDate = Date().addingTimeInterval(-3600 * 13)
    let lastMedDate = Date().addingTimeInterval(-3600 * 10)
    let lastCitaMedicaDate = Date().addingTimeInterval(-3600 * 20)
    let lastVacunaDate = Date().addingTimeInterval(-3600 * 13)
    
    @Binding var mom: MomData?
    
    var body: some View {
        ZStack {
            Color(.colorFondo2).ignoresSafeArea()
            ZStack (alignment: .top){
                Wave1()
                    .foregroundColor(Color(red: 0.69, green: 0.67, blue: 0.76))
                    .frame(width: 431, height: 97.11926)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
                
                Wave2()
                    .foregroundColor(Color(red: 0.82, green: 0.81, blue: 0.87))
                    .frame(width: 431, height: 76)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
            }.ignoresSafeArea()
            VStack {
                ScrollView (showsIndicators: false){
                    CardView(
                        text: "Dormir",
                        iconName1: "dormir",
                        iconName2: "plus.circle.fill",
                        gradientStartColor: Color(red: 0.95, green: 0.9, blue: 0.64),
                        gradientEndColor: Color(red: 0.94, green: 0.91, blue: 0.76),
                        lastRecordedDate: lastSleepDate,
                        sheetContent: {
                            SleepDetailView()
                        }
                    )
                    .padding(.bottom, 28)
                    CardView(
                        text: "Alimentación",
                        iconName1: "biberon",
                        iconName2: "plus.circle.fill",
                        gradientStartColor: Color(red: 0.71, green: 0.84, blue: 0.88),
                        gradientEndColor: Color(red: 0.79, green: 0.91, blue: 0.95),
                        lastRecordedDate: lastFedDate,
                        sheetContent: {
                            
                            FoodDetailView()
                        }
                    )
                    .padding(.bottom, 28)
                    CardView(
                        text: "Pañal",
                        iconName1: "pañal",
                        iconName2: "plus.circle.fill",
                        gradientStartColor: Color(red: 0.95, green: 0.77, blue: 0.75),
                        gradientEndColor: Color(red: 0.95, green: 0.86, blue: 0.86),
                        lastRecordedDate: lastPañalDate,sheetContent: {
                            Pan_alTracker()
                        }
                    )
                    .padding(.bottom, 28)
                    CardView(
                        text: "Crecimiento",
                        iconName1: "crecimiento",
                        iconName2: "plus.circle.fill",
                        gradientStartColor: Color(red: 0.71, green: 0.84, blue: 0.88),
                        gradientEndColor: Color(red: 0.79, green: 0.91, blue: 0.95),
                        lastRecordedDate: lastGrowthDate,sheetContent: {
                            TrackerCrecimiento()
                        }
                    )
                    .padding(.bottom, 28)
                    CardView(
                        text: "Sintomas",
                        iconName1: "Sintomas",
                        iconName2: "plus.circle.fill",
                        gradientStartColor: Color(red: 0.95, green: 0.77, blue: 0.75),
                        gradientEndColor: Color(red: 0.95, green: 0.86, blue: 0.86),
                        lastRecordedDate: lastSintomaDate,sheetContent: {
                            TrackerSintomas()
                        }
                    )
                    .padding(.bottom, 28)
                    CardView(
                        text: "Medicamentos",
                        iconName1: "Medicamentos",
                        iconName2: "plus.circle.fill",
                        gradientStartColor: Color(red: 0.85, green: 0.89, blue: 0.51),
                        gradientEndColor: Color(red: 0.87, green: 0.92, blue: 0.61),
                        lastRecordedDate: lastMedDate,sheetContent: {
                            MedicamentosTracker(mom: $mom)
                        }
                    )
                    .padding(.bottom, 60)
                }
                .padding(.top,55)
            }
            
        }
    }
}

struct CardView<SheetContentType: View>: View {
    let text: String
    let iconName1: String
    let iconName2: String
    let gradientStartColor: Color
    let gradientEndColor: Color
    let lastRecordedDate: Date
    
    @State private var showingSheet = false
    var sheetContent: () -> SheetContentType
    
    var body: some View {
        ZStack(alignment : .leading){
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 308, height: 100)
                .background(
                    AngularGradient(
                        gradient: Gradient(colors: [gradientStartColor, gradientEndColor]), center: UnitPoint(x: 0.5, y: 0.5),
                        angle: Angle(degrees: 90)
                    )
                )
                .cornerRadius(30)
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y:4)
            
            VStack{
                
                Spacer()
                if(iconName1 == "milestones" || iconName1 == "Medicamentos"){
                    Image(iconName1)
                        .resizable()
                        .foregroundColor(.colorFondo2)
                        .frame(width: 35,height: 35)
                        .padding(.bottom, 10)
                        .padding(.leading,5)
                }else{
                    Image(iconName1)
                        .resizable()
                        .foregroundColor(.colorFondo2)
                        .frame(width: 37,height: 35)
                        .padding(.bottom, 10)
                }
                
                Button(action: {
                    showingSheet.toggle()
                }){
                    Image(systemName: iconName2)
                        .foregroundColor(.colorFondo2)
                        .font(.system(size: 32))
                }
                .sheet(isPresented: $showingSheet, content: sheetContent)
                
                Spacer()
            }
            .padding(.leading, 250)
            
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 240, height: 100)
                .cornerRadius(30)
            
            VStack(alignment: .leading){
                Text(text)
                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    .fontWeight(.light)
                    .font(.system(size: 15))
                    .padding(.bottom, 4)
                
                
                Text(timeAgo(from: lastRecordedDate))
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                
            }.padding(.leading, 30)
            
            
        }
    }
}

func timeAgo(from date: Date) -> String {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.minute, .hour], from: date, to: Date())
    
    if let hour = components.hour, hour >= 1 {
        return "Hace \(hour) hrs"
    } else if let minute = components.minute {
        return "Hace \(minute) min"
    } else {
        return "Hace un momento"
    }
}


struct Wave2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99814*width, y: 0.82222*height))
        path.addLine(to: CGPoint(x: 0.95659*width, y: 0.85035*height))
        path.addCurve(to: CGPoint(x: 0.74871*width, y: 0.79913*height), control1: CGPoint(x: 0.91503*width, y: 0.87847*height), control2: CGPoint(x: 0.83193*width, y: 0.93473*height))
        path.addCurve(to: CGPoint(x: 0.49906*width, y: 0.39234*height), control1: CGPoint(x: 0.66549*width, y: 0.66353*height), control2: CGPoint(x: 0.58217*width, y: 0.33609*height))
        path.addCurve(to: CGPoint(x: 0.24996*width, y: 0.97221*height), control1: CGPoint(x: 0.41595*width, y: 0.44859*height), control2: CGPoint(x: 0.33306*width, y: 0.88855*height))
        path.addCurve(to: CGPoint(x: 0.04193*width, y: 0.64692*height), control1: CGPoint(x: 0.16687*width, y: 1.05587*height), control2: CGPoint(x: 0.08357*width, y: 0.78324*height))
        path.addLine(to: CGPoint(x: 0.00028*width, y: 0.51061*height))
        path.addLine(to: CGPoint(x: 0, y: 0.01728*height))
        path.addLine(to: CGPoint(x: 0.04157*width, y: 0.01656*height))
        path.addCurve(to: CGPoint(x: 0.24942*width, y: 0.01296*height), control1: CGPoint(x: 0.08314*width, y: 0.01584*height), control2: CGPoint(x: 0.16628*width, y: 0.0144*height))
        path.addCurve(to: CGPoint(x: 0.49884*width, y: 0.00864*height), control1: CGPoint(x: 0.33256*width, y: 0.01152*height), control2: CGPoint(x: 0.4157*width, y: 0.01008*height))
        path.addCurve(to: CGPoint(x: 0.74826*width, y: 0.00432*height), control1: CGPoint(x: 0.58198*width, y: 0.0072*height), control2: CGPoint(x: 0.66512*width, y: 0.00576*height))
        path.addCurve(to: CGPoint(x: 0.95611*width, y: 0.00072*height), control1: CGPoint(x: 0.8314*width, y: 0.00288*height), control2: CGPoint(x: 0.91454*width, y: 0.00144*height))
        path.addLine(to: CGPoint(x: 0.99768*width, y: 0))
        path.addLine(to: CGPoint(x: 0.99814*width, y: 0.82222*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.99814*width, y: 0.82222*height))
        path.addLine(to: CGPoint(x: 0.95659*width, y: 0.85035*height))
        path.addCurve(to: CGPoint(x: 0.74871*width, y: 0.79913*height), control1: CGPoint(x: 0.91503*width, y: 0.87847*height), control2: CGPoint(x: 0.83193*width, y: 0.93473*height))
        path.addCurve(to: CGPoint(x: 0.49906*width, y: 0.39234*height), control1: CGPoint(x: 0.66549*width, y: 0.66353*height), control2: CGPoint(x: 0.58217*width, y: 0.33609*height))
        path.addCurve(to: CGPoint(x: 0.24996*width, y: 0.97221*height), control1: CGPoint(x: 0.41595*width, y: 0.44859*height), control2: CGPoint(x: 0.33306*width, y: 0.88855*height))
        path.addCurve(to: CGPoint(x: 0.04193*width, y: 0.64692*height), control1: CGPoint(x: 0.16687*width, y: 1.05587*height), control2: CGPoint(x: 0.08357*width, y: 0.78324*height))
        path.addLine(to: CGPoint(x: 0.00028*width, y: 0.51061*height))
        path.addLine(to: CGPoint(x: 0, y: 0.01728*height))
        path.addLine(to: CGPoint(x: 0.04157*width, y: 0.01656*height))
        path.addCurve(to: CGPoint(x: 0.24942*width, y: 0.01296*height), control1: CGPoint(x: 0.08314*width, y: 0.01584*height), control2: CGPoint(x: 0.16628*width, y: 0.0144*height))
        path.addCurve(to: CGPoint(x: 0.49884*width, y: 0.00864*height), control1: CGPoint(x: 0.33256*width, y: 0.01152*height), control2: CGPoint(x: 0.4157*width, y: 0.01008*height))
        path.addCurve(to: CGPoint(x: 0.74826*width, y: 0.00432*height), control1: CGPoint(x: 0.58198*width, y: 0.0072*height), control2: CGPoint(x: 0.66512*width, y: 0.00576*height))
        path.addCurve(to: CGPoint(x: 0.95611*width, y: 0.00072*height), control1: CGPoint(x: 0.8314*width, y: 0.00288*height), control2: CGPoint(x: 0.91454*width, y: 0.00144*height))
        path.addLine(to: CGPoint(x: 0.99768*width, y: 0))
        path.addLine(to: CGPoint(x: 0.99814*width, y: 0.82222*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.99814*width, y: 0.82222*height))
        path.addLine(to: CGPoint(x: 0.95659*width, y: 0.85035*height))
        path.addCurve(to: CGPoint(x: 0.74871*width, y: 0.79913*height), control1: CGPoint(x: 0.91503*width, y: 0.87847*height), control2: CGPoint(x: 0.83193*width, y: 0.93473*height))
        path.addCurve(to: CGPoint(x: 0.49906*width, y: 0.39234*height), control1: CGPoint(x: 0.66549*width, y: 0.66353*height), control2: CGPoint(x: 0.58217*width, y: 0.33609*height))
        path.addCurve(to: CGPoint(x: 0.24996*width, y: 0.97221*height), control1: CGPoint(x: 0.41595*width, y: 0.44859*height), control2: CGPoint(x: 0.33306*width, y: 0.88855*height))
        path.addCurve(to: CGPoint(x: 0.04193*width, y: 0.64692*height), control1: CGPoint(x: 0.16687*width, y: 1.05587*height), control2: CGPoint(x: 0.08357*width, y: 0.78324*height))
        path.addLine(to: CGPoint(x: 0.00028*width, y: 0.51061*height))
        path.addLine(to: CGPoint(x: 0, y: 0.01728*height))
        path.addLine(to: CGPoint(x: 0.04157*width, y: 0.01656*height))
        path.addCurve(to: CGPoint(x: 0.24942*width, y: 0.01296*height), control1: CGPoint(x: 0.08314*width, y: 0.01584*height), control2: CGPoint(x: 0.16628*width, y: 0.0144*height))
        path.addCurve(to: CGPoint(x: 0.49884*width, y: 0.00864*height), control1: CGPoint(x: 0.33256*width, y: 0.01152*height), control2: CGPoint(x: 0.4157*width, y: 0.01008*height))
        path.addCurve(to: CGPoint(x: 0.74826*width, y: 0.00432*height), control1: CGPoint(x: 0.58198*width, y: 0.0072*height), control2: CGPoint(x: 0.66512*width, y: 0.00576*height))
        path.addCurve(to: CGPoint(x: 0.95611*width, y: 0.00072*height), control1: CGPoint(x: 0.8314*width, y: 0.00288*height), control2: CGPoint(x: 0.91454*width, y: 0.00144*height))
        path.addLine(to: CGPoint(x: 0.99768*width, y: 0))
        path.addLine(to: CGPoint(x: 0.99814*width, y: 0.82222*height))
        path.closeSubpath()
        return path
    }
}

struct Wave1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99791*width, y: 0.83531*height))
        path.addLine(to: CGPoint(x: 0.95646*width, y: 0.86347*height))
        path.addCurve(to: CGPoint(x: 0.74905*width, y: 0.81112*height), control1: CGPoint(x: 0.91501*width, y: 0.89164*height), control2: CGPoint(x: 0.8321*width, y: 0.94796*height))
        path.addCurve(to: CGPoint(x: 0.49991*width, y: 0.40061*height), control1: CGPoint(x: 0.666*width, y: 0.67428*height), control2: CGPoint(x: 0.58282*width, y: 0.34429*height))
        path.addCurve(to: CGPoint(x: 0.25148*width, y: 0.98349*height), control1: CGPoint(x: 0.417*width, y: 0.45693*height), control2: CGPoint(x: 0.33437*width, y: 0.89958*height))
        path.addCurve(to: CGPoint(x: 0.04387*width, y: 0.6552*height), control1: CGPoint(x: 0.16859*width, y: 1.06741*height), control2: CGPoint(x: 0.08545*width, y: 0.7926*height))
        path.addLine(to: CGPoint(x: 0.0023*width, y: 0.51779*height))
        path.addLine(to: CGPoint(x: 0.00195*width, y: 0.0211*height))
        path.addLine(to: CGPoint(x: 0.04342*width, y: 0.02053*height))
        path.addCurve(to: CGPoint(x: 0.25079*width, y: 0.01769*height), control1: CGPoint(x: 0.08489*width, y: 0.01996*height), control2: CGPoint(x: 0.16784*width, y: 0.01883*height))
        path.addCurve(to: CGPoint(x: 0.49964*width, y: 0.01429*height), control1: CGPoint(x: 0.33374*width, y: 0.01656*height), control2: CGPoint(x: 0.41669*width, y: 0.01543*height))
        path.addCurve(to: CGPoint(x: 0.74848*width, y: 0.01089*height), control1: CGPoint(x: 0.58258*width, y: 0.01316*height), control2: CGPoint(x: 0.66553*width, y: 0.01202*height))
        path.addCurve(to: CGPoint(x: 0.95585*width, y: 0.00805*height), control1: CGPoint(x: 0.83143*width, y: 0.00975*height), control2: CGPoint(x: 0.91437*width, y: 0.00862*height))
        path.addLine(to: CGPoint(x: 0.99732*width, y: 0.00749*height))
        path.addLine(to: CGPoint(x: 0.99791*width, y: 0.83531*height))
        path.closeSubpath()
        return path
    }
}




struct SleepDetailView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        TrackerDormir()
        
    }
}

struct FoodDetailView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        TrackerAlimentacion()
    }
}

