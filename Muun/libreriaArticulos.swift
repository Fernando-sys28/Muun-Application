//
//  libreriaArticulos.swift
//  Muun
//
//  Created by Doris Elena  on 26/11/23.
//

import SwiftUI

struct libreriaArticulos: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 0.96, green: 0.96, blue: 0.97)
                    .ignoresSafeArea()
                figurita()
                    .frame(width: 430.70557, height: 100)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .foregroundColor(Color(red: 0.69, green: 0.67, blue: 0.76))
                VStack {
                    HStack {
                        
                        Text("Librería de artículos")
                            .font(Font.custom("Poppins", size: 30).weight(.medium))
                            .kerning(1.2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding(.top,50)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top,60)
                    
                    let articles = [
                        Article(image: Image("cargar_bebe"), title: "Cómo cargar a un recién nacido", readingTime: 10),
                        Article(image: Image("juguetes"), title: "Juguetes recomendados para los primeros meses", readingTime: 6),
                        Article(image: Image("ropa"), title: "Cómo escoger la talla adecuada para tu bebé", readingTime: 5)
                    ]
                    
                    ScrollView {
                        VStack {
                            ForEach(articles, id: \.title) { article in
                                ArticleView(article: article)
                                    .padding()
                            }
                        }.frame(width: 340)
                    }
                    
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }.ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        
    }
}

struct Article {
    var image: Image
    var title: String
    var readingTime: Int
}


struct ArticleView: View {
    var article: Article
    @State private var showDetails = false
    
    var body: some View {
        Button(action: {
            showDetails.toggle()
        }) {
            VStack(alignment: .leading) {
                article.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(
                        HStack {
                            Text(article.title)
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                            Spacer()
                            Image(systemName: "clock").foregroundColor(.white)
                            Text("\(article.readingTime) min")
                                .foregroundColor(.white)
                                .padding(.trailing)
                        }
                        .background(Color.black.opacity(0.3))
                        , alignment: .bottomLeading
                    )
            }
            .cornerRadius(15)
            .shadow(radius: 5)
        }
        .sheet(isPresented: $showDetails) {
            // Aquí defines la vista que quieres presentar en la hoja
            Text("Detalles del artículo:\n \(article.title)")
                .multilineTextAlignment(.center)
            
            VStack{
                ZStack{
                    
                    article.image
                        .resizable()
                        .frame(width: 478, height: 356)
                                            
                    HStack{
                        Spacer()
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                        Spacer()
                        
                    }.background(.red)
                    
                    
                    
                }
                
                Text("Detalles del artículo:\n \(article.title)")
                    .multilineTextAlignment(.center)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
        }
    }
}

#Preview {
    libreriaArticulos()
}

struct figurita: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 1.00258*width, y: 0.88983*height))
        path.addLine(to: CGPoint(x: 0.96071*width, y: 0.75506*height))
        path.addCurve(to: CGPoint(x: 0.75166*width, y: 0.39102*height), control1: CGPoint(x: 0.91883*width, y: 0.62029*height), control2: CGPoint(x: 0.83509*width, y: 0.35075*height))
        path.addCurve(to: CGPoint(x: 0.50174*width, y: 0.87974*height), control1: CGPoint(x: 0.66823*width, y: 0.43129*height), control2: CGPoint(x: 0.58512*width, y: 0.78138*height))
        path.addCurve(to: CGPoint(x: 0.25124*width, y: 0.78756*height), control1: CGPoint(x: 0.41837*width, y: 0.9781*height), control2: CGPoint(x: 0.33475*width, y: 0.82474*height))
        path.addCurve(to: CGPoint(x: 0.04264*width, y: 0.86888*height), control1: CGPoint(x: 0.16773*width, y: 0.75038*height), control2: CGPoint(x: 0.08434*width, y: 0.82938*height))
        path.addLine(to: CGPoint(x: 0.00095*width, y: 0.90837*height))
        path.addLine(to: CGPoint(x: 0, y: -0.02106*height))
        path.addLine(to: CGPoint(x: 0.04173*width, y: -0.02184*height))
        path.addCurve(to: CGPoint(x: 0.25041*width, y: -0.0257*height), control1: CGPoint(x: 0.08347*width, y: -0.02261*height), control2: CGPoint(x: 0.16694*width, y: -0.02415*height))
        path.addCurve(to: CGPoint(x: 0.50082*width, y: -0.03034*height), control1: CGPoint(x: 0.33388*width, y: -0.02725*height), control2: CGPoint(x: 0.41735*width, y: -0.02879*height))
        path.addCurve(to: CGPoint(x: 0.75122*width, y: -0.03497*height), control1: CGPoint(x: 0.58429*width, y: -0.03188*height), control2: CGPoint(x: 0.66775*width, y: -0.03343*height))
        path.addCurve(to: CGPoint(x: 0.9599*width, y: -0.03883*height), control1: CGPoint(x: 0.83469*width, y: -0.03652*height), control2: CGPoint(x: 0.91816*width, y: -0.03806*height))
        path.addLine(to: CGPoint(x: 1.00163*width, y: -0.03961*height))
        path.addLine(to: CGPoint(x: 1.00258*width, y: 0.88983*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 1.00258*width, y: 0.88983*height))
        path.addLine(to: CGPoint(x: 0.96071*width, y: 0.75506*height))
        path.addCurve(to: CGPoint(x: 0.75166*width, y: 0.39102*height), control1: CGPoint(x: 0.91883*width, y: 0.62029*height), control2: CGPoint(x: 0.83509*width, y: 0.35075*height))
        path.addCurve(to: CGPoint(x: 0.50174*width, y: 0.87974*height), control1: CGPoint(x: 0.66823*width, y: 0.43129*height), control2: CGPoint(x: 0.58512*width, y: 0.78138*height))
        path.addCurve(to: CGPoint(x: 0.25124*width, y: 0.78756*height), control1: CGPoint(x: 0.41837*width, y: 0.9781*height), control2: CGPoint(x: 0.33475*width, y: 0.82474*height))
        path.addCurve(to: CGPoint(x: 0.04264*width, y: 0.86888*height), control1: CGPoint(x: 0.16773*width, y: 0.75038*height), control2: CGPoint(x: 0.08434*width, y: 0.82938*height))
        path.addLine(to: CGPoint(x: 0.00095*width, y: 0.90837*height))
        path.addLine(to: CGPoint(x: 0, y: -0.02106*height))
        path.addLine(to: CGPoint(x: 0.04173*width, y: -0.02184*height))
        path.addCurve(to: CGPoint(x: 0.25041*width, y: -0.0257*height), control1: CGPoint(x: 0.08347*width, y: -0.02261*height), control2: CGPoint(x: 0.16694*width, y: -0.02415*height))
        path.addCurve(to: CGPoint(x: 0.50082*width, y: -0.03034*height), control1: CGPoint(x: 0.33388*width, y: -0.02725*height), control2: CGPoint(x: 0.41735*width, y: -0.02879*height))
        path.addCurve(to: CGPoint(x: 0.75122*width, y: -0.03497*height), control1: CGPoint(x: 0.58429*width, y: -0.03188*height), control2: CGPoint(x: 0.66775*width, y: -0.03343*height))
        path.addCurve(to: CGPoint(x: 0.9599*width, y: -0.03883*height), control1: CGPoint(x: 0.83469*width, y: -0.03652*height), control2: CGPoint(x: 0.91816*width, y: -0.03806*height))
        path.addLine(to: CGPoint(x: 1.00163*width, y: -0.03961*height))
        path.addLine(to: CGPoint(x: 1.00258*width, y: 0.88983*height))
        path.closeSubpath()
        return path
    }
}
