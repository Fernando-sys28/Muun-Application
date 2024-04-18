//
//  StatsMainView.swift
//  Muun
//
//  Created by Doris Elena  on 26/11/23.
//

import SwiftUI
import Foundation
import Charts

struct StatsMainView: View {
    var body: some View {
        ZStack{
            Color(Color(red: 0.96, green: 0.96, blue: 0.97)).ignoresSafeArea()
            
            ZStack(alignment: .top){
                wave2_medicamentos()
                    .frame(width: 432.64734, height: 100.80618)
                    .foregroundColor(Color(red: 0.69, green: 0.67, blue: 0.76))
                    .padding(.top, 19)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                wave1_medicamentos()
                    .frame(width: 432.64734, height: 100.80618)
                    .foregroundColor(Color(red: 0.82, green: 0.81, blue: 0.87))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
            }.ignoresSafeArea()
            
            
            
            ScrollView {
                HStack{
                    Text("Estadisticas")
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                        .font(.system(size: 30))
                        .kerning(1.2)
                        .foregroundColor(.black)
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                VStack{
                    
                    ZStack{
                        
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 376, height: 275)
                        .background(.white)
                        .cornerRadius(40)
                        
                        VStack{
                            HStack(){
                                Text("Tiempo total del sueño")
                                    .fontWeight(.medium)
                                    .font(.system(size: 14))
                                Image(systemName: "arrow.right")
                                    .fontWeight(.medium)
                                    .font(.system(size: 14))
                            }.padding(.leading, 50).frame(maxWidth: .infinity, alignment: .leading)
                                
                            HStack{
                                Text("Actividad Diaria")
                                    .fontWeight(.medium)
                                    .font(.system(size: 10))
                                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                    .padding(.top,2)


                            }.padding(.leading, 50).frame(maxWidth: .infinity, alignment: .leading)
                            
                            BarChart()
                            
                            
                        }
                        
                    }.padding(.bottom,50)
                    
                    
                    
                    ZStack{
                        
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 376, height: 275)
                        .background(.white)
                        .cornerRadius(40)
                        
                        VStack{
                            HStack(){
                                Text("Crecimiento del bebé")
                                    .fontWeight(.medium)
                                    .font(.system(size: 14))
                                Image(systemName: "arrow.right")
                                    .fontWeight(.medium)
                                    .font(.system(size: 14))
                            }.padding(.leading, 50).frame(maxWidth: .infinity, alignment: .leading)
                                
                            HStack{
                                Text("Actividad semanal")
                                    .fontWeight(.medium)
                                    .font(.system(size: 10))
                                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                    .padding(.top,2)


                            }.padding(.leading, 50).frame(maxWidth: .infinity, alignment: .leading)
                            
                           
                            GradientAreaChartExampleView(datosCrecimiento: datosCrecimiento)
                            
                        }
                        
                    }
                }.padding(.bottom,50)
                
                
                ZStack{
                    
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 376, height: 275)
                    .background(.white)
                    .cornerRadius(40)
                    
                    VStack{
                        HStack(){
                            Text("Sintomas del bebé")
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                            Image(systemName: "arrow.right")
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                        }.padding(.leading, 50).frame(maxWidth: .infinity, alignment: .leading)
                            
                        HStack{
                            Text("Actividad diaria")
                                .fontWeight(.medium)
                                .font(.system(size: 10))
                                .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                .padding(.top,2)


                        }.padding(.leading, 50).frame(maxWidth: .infinity, alignment: .leading)
                        
                       
                        Piechart()
                        
                    
                    
                }
            }.padding(.bottom,50)
                
            }
            
            
        }//final del stack
    }
}

///todo para el chart del sueño

struct horasDormirData {
    var dia: String
    var tiempo: Double

}

var data: [horasDormirData] = [
    .init(dia: "Lunes", tiempo: 5),
    .init(dia: "Martes", tiempo: 7),
    .init(dia: "Miercoles", tiempo: 1),
    .init(dia: "Jueves", tiempo: 5),
    .init(dia: "Viernes", tiempo: 2),
    .init(dia: "Sabado", tiempo: 7),
    .init(dia: "Domingo", tiempo: 12)
]


struct BarChart: View {
    var body: some View {
        Chart {
            BarMark(
                    x: .value("Día", data[0].dia),
                    y: .value("Tiempo", data[0].tiempo)
                )
                BarMark(
                     x: .value("Día", data[1].dia),
                     y: .value("Tiempo", data[1].tiempo)
                )
                BarMark(
                     x: .value("Día", data[2].dia),
                     y: .value("Tiempo", data[2].tiempo)
                )
            BarMark(
                 x: .value("Día", data[3].dia),
                 y: .value("Tiempo", data[3].tiempo)
            )
            BarMark(
                 x: .value("Día", data[4].dia),
                 y: .value("Tiempo", data[4].tiempo)
            )
            BarMark(
                 x: .value("Día", data[5].dia),
                 y: .value("Tiempo", data[5].tiempo)
            )
            BarMark(
                 x: .value("Día", data[6].dia),
                 y: .value("Tiempo", data[6].tiempo)
            )
        }.frame(width: 300, height: 200)
            .foregroundStyle(Color(red: 0.69, green: 0.67, blue: 0.76))
    }
}

//todo para el chart de Crecimeinto:
struct CrecimientoBebeData: Identifiable {
    let id = UUID()
    var semana: Int
    var altura: Double
}

// Datos de ejemplo
let datosCrecimiento: [CrecimientoBebeData] = [
    .init(semana: 1, altura: 36),
    .init(semana: 2, altura: 39),
    .init(semana: 3, altura: 50),
    .init(semana: 4, altura: 60),

]
struct GradientAreaChartExampleView: View {
    let datosCrecimiento: [CrecimientoBebeData]
    let linearGradient = LinearGradient(
        gradient: Gradient(colors: [Color(red: 0.69, green: 0.67, blue: 0.76).opacity(0.4), Color(red: 0.69, green: 0.67, blue: 0.76).opacity(0.1)]),
        startPoint: .top,
        endPoint: .bottom
    )

    var body: some View {
        Chart {
            // Marcas de línea
            ForEach(datosCrecimiento) { data in
                LineMark(
                    x: .value("Semana", data.semana),
                    y: .value("Altura", data.altura)
                )
                .interpolationMethod(.cardinal)
            }
            
            // Área de degradado bajo la línea
            ForEach(datosCrecimiento) { data in
                AreaMark(
                    x: .value("Semana", data.semana),
                    y: .value("Altura", data.altura)
                )
                .interpolationMethod(.cardinal)
                .foregroundStyle(linearGradient)
            }
        }
        .frame(width: 300, height: 150)
        .chartXScale(domain: datosCrecimiento.first!.semana...datosCrecimiento.last!.semana)
        .chartLegend(.hidden)
        .chartXAxis {
            AxisMarks(values: .stride(by: 1)) { value in
                AxisGridLine()
                AxisTick()
                if let semana = value.as(Int.self) {
                    AxisValueLabel("\(semana)", centered: true)
                }
            }
        }
        .foregroundStyle(Color(red: 0.69, green: 0.67, blue: 0.76))
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}


//Todolo lo necesario para el chart de sintomas:
struct Sintoma: Identifiable {
    let id = UUID()
    let tipo: String
    let freq: Int
}

struct Piechart: View {
    @State private var sintomas: [Sintoma] = [
        .init(tipo: "Feliz", freq: 2),
        .init(tipo: "Enojado", freq: 7),
        .init(tipo: "Llorón", freq: 4),
        .init(tipo: "Enfermo", freq: 2),
        .init(tipo: "Tranquilo", freq: 5),
        .init(tipo: "Inquieto", freq: 3)
    ]
    
    let customColor = Color(red: 0.69, green: 0.67, blue: 0.76)
    
    var body: some View {
        Chart(sintomas) { sintoma in
                    SectorMark(
                        angle: .value(
                            Text(verbatim: sintoma.tipo),
                            sintoma.freq
                        ),
                        innerRadius: .ratio(0.6),
                        angularInset: 8
                    )
                    .foregroundStyle(customColor)
                
        }.chartLegend(.hidden) // Oculta la leyenda
            .frame(width: 160, height: 160)
            
    }
}




struct StatsMainView_Previews: PreviewProvider {
    static var previews: some View {
        StatsMainView()
    }
}

        
