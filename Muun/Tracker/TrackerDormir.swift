//
//  TrackerDormir.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 27/10/23.
//
import SwiftUI
import Combine

struct TrackerDormir: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = CronometroViewModel()
    @State var estaCorriendo: Bool = false
    var body: some View {
        ZStack{
            Color(.colorFondo2).ignoresSafeArea()
            
            ZStack (alignment: .top){
                wave2TrackerDormir()
                    .foregroundColor(Color(red: 0.71, green: 0.84, blue: 0.88))
                    .frame(width: 412, height: 143)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                wave1TrackerDormir()
                    .foregroundColor(Color(red: 0.82, green: 0.89, blue: 0.92))
                    .frame(width: 412, height: 117)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
            }.ignoresSafeArea()
            
            HStack{
                Text("Sueño")
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
                Prueba_DormirTracker()
            }
        }
        
        
    
            
    }
}


func tiempoFormateado(tiempo: Double) -> String {
        let minutos = Int(tiempo) / 60
        let segundos = Int(tiempo) % 60
        let decimas = Int((tiempo - floor(tiempo)) * 10)
        
        return String(format: "%02i:%02i.%i", minutos, segundos, decimas)
    }

//Estructuras de diesño: WAVES
struct wave2TrackerDormir: Shape {
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

struct wave1TrackerDormir: Shape {
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
//------------------------------------
class CronometroViewModel: ObservableObject {
    @Published var tiempoTranscurrido: Double = 0
    
    private var timer: AnyCancellable?
    
    func comenzar() {
        timer = Timer.publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.tiempoTranscurrido += 0.1
            }
    }
    
    func pausar() {
        timer?.cancel()
    }
    
    func limpiar() {
        tiempoTranscurrido = 0
    }
    
    deinit {
        timer?.cancel()
    }
}


#Preview {
    TrackerDormir()
}
