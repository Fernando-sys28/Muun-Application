//
//  Prueba_DormirTracker.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 27/10/23.
//
import SwiftUI
import Combine

// Enum y Struct para la información del sueño
enum EventoBebe: String {
    case seLevanto = "Se levantó"
    case leDieronDeComer = "Le dieron de comer"
    case lloro = "Lloró"
    case volvioADormir = "Volvió a dormir"
}

struct EventoConTiempo: Identifiable {
    let id = UUID()
    let evento: EventoBebe
    let hora: Date
}

struct RegistroSueno {
    let inicio: Date
    var fin: Date?
    var eventos: [EventoConTiempo]
}

// ViewModel
class TrackerSuenoViewModel: ObservableObject {
    @Published var tiempoTranscurrido: Double = 0
    @Published var registroActual: RegistroSueno? = RegistroSueno(inicio: Date(), fin: nil, eventos: [])
    @Published var registros: [RegistroSueno] = []

    private var timer: AnyCancellable?
    
    func comenzarSesion() {
        registroActual = RegistroSueno(inicio: Date(), fin: nil, eventos: [])
        
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.tiempoTranscurrido += 1
            }
    }
    
    func acabarSesion() {
        registroActual?.fin = Date()
        timer?.cancel()
    }
    
    func agregarEvento(_ evento: EventoBebe) {
        let eventoConTiempo = EventoConTiempo(evento: evento, hora: Date())
        registroActual?.eventos.append(eventoConTiempo)
    }
    
    func guardarRegistro() {
        if let registro = registroActual {
            registros.append(registro)
            registroActual = nil
            tiempoTranscurrido = 0
        }
    }

    deinit {
        timer?.cancel()
    }
}

// Resumen de la Sesión
struct ResumenView: View {
    var registro: RegistroSueno?
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            
            HStack{
                
                Spacer()
                
                Button(action: {
                    dismiss()
                }){
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 32))
                        .padding(.bottom, 10)
                }
                
                
                
            }
            
            Text("Resumen de la Sesión")
                .font(.title)
            
            if let registro = registro {
                Text("Inicio: \(formatDate(registro.inicio))")
                Text("Fin: \(formatDate(registro.fin ?? Date()))")
                
                List(registro.eventos, id: \.id) { eventoConTiempo in
                    Text("\(eventoConTiempo.evento.rawValue) a las \(formatDate(eventoConTiempo.hora))")
                }
            } else {
                Text("No hay registro disponible")
            }
            
            Button("Cerrar") {
                // Aquí puedes agregar código para cerrar la vista de resumen si lo necesitas
            }
        }
        .padding()
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

// Vista principal
struct Prueba_DormirTracker: View {
    @StateObject var viewModel = TrackerSuenoViewModel()
    @State var sesionActiva: Bool = false
    @State var mostrarResumen: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text(tiempoFormateado(tiempo: viewModel.tiempoTranscurrido))
                .font(.largeTitle)
            
            Button(action: {
                if sesionActiva {
                    viewModel.acabarSesion()
                } else {
                    viewModel.comenzarSesion()
                }
                sesionActiva.toggle()
            }, label: {
                Text(sesionActiva ? "Acabar sesión de sueño" : "Comenzar sesión de sueño")
            }).foregroundColor(.red)
            
            if sesionActiva || (viewModel.registroActual?.eventos.count ?? 0 > 0) {
                VStack {
                    HStack(spacing: 10) {
                        VStack{
                            
                            BotonEstilizado(emoji:"👶🏽") {
                                viewModel.agregarEvento(.seLevanto)
                            }
                            Text("Despertó")
                            
                        }
                        VStack{
                            BotonEstilizado(emoji: "🍼") {
                                viewModel.agregarEvento(.leDieronDeComer)
                            }
                            Text("Comió")
                        }
                        VStack{
                            BotonEstilizado(emoji: "😴") {
                                viewModel.agregarEvento(.volvioADormir)
                            }
                            Text("Durmió")
                        }
                        VStack{
                            BotonEstilizado(emoji: "😭") {
                                viewModel.agregarEvento(.lloro)
                            }
                            Text("Lloró")
                            
                        }
                    
                       
                    }
                    if !sesionActiva {
                        ZStack{
                            Rectangle()
                              .foregroundColor(.clear)
                              .frame(width: 373, height: 50)
                              .background(Color(red: 0.95, green: 0.9, blue: 0.66))
                              .cornerRadius(60)
                            
                            Button("Guardar Registro") {
                                viewModel.guardarRegistro()
                                mostrarResumen = true
                            }.padding(.top)
                        }
                        
                    }
                }
            }
        }
        .padding()
        .sheet(isPresented: $mostrarResumen) {
            ResumenView(registro: viewModel.registros.last)
        }
    }

    func tiempoFormateado(tiempo: Double) -> String {
        let horas = Int(tiempo) / 3600
        let minutos = (Int(tiempo) % 3600) / 60
        let segundos = Int(tiempo) % 60

        return String(format: "%02i:%02i:%02i", horas, minutos, segundos)
            
    }
}

struct TrackerSuenoView_Previews: PreviewProvider {
    static var previews: some View {
        Prueba_DormirTracker()
    }
}


struct BotonEstilizado: View {
    var emoji: String
    var accion: () -> Void
    @State private var backgroundColor =  Color.white

    var body: some View {
        
        Button(action: {
                    // Cambia el color al hacer clic
                    backgroundColor = Color(Color(red: 0.95, green: 0.9, blue: 0.66))

                    // Realiza la acción asignada
                    accion()

                    // Restablece el color después de un breve retraso
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        backgroundColor = Color.white
                    }
                }) {
                    VStack {
                        ZStack {
                            Rectangle()
                                .foregroundColor(backgroundColor)
                                .frame(width: 66, height: 54)
                                .cornerRadius(20)
                                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4)
                            Text(emoji)
                        }
                    }
                }
        
        
        
    }
}



#Preview{
    Prueba_DormirTracker()
}
