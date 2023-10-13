//
//  SwiftUIView.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 19/10/23.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var activeTab: Tab = .home
    
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                TabView(selection: $activeTab){
                    
                    SignInView()
                        .tag(Tab.home)
                        .toolbar(.hidden, for: .tabBar)
                    SignInView()
                        .tag(Tab.perrosPerdidos)
                        .toolbar(.hidden, for: .tabBar)
                    SignInView()
                        .tag(Tab.perroEncontrados)
                        .toolbar(.hidden, for: .tabBar)
                    SignInView()
                        .tag(Tab.mensajes)
                        .toolbar(.hidden, for: .tabBar)
                    SignInView()
                        .tag(Tab.perfil)
                        .toolbar(.hidden, for: .tabBar)
                }
                CustomTabBar()
            }
        }
        .navigationBarHidden(true)
    }
    @ViewBuilder
    func CustomTabBar(_ tint: Color = .orange, _ inactiveTint: Color = .gray) ->
    some View {
        HStack(alignment: .bottom, spacing: 0 ){
            ForEach(Tab.allCases, id: \.rawValue){
                TabItem(tint: tint,
                        inactiveTint: inactiveTint,
                        tab: $0,
                        activeTab: $activeTab
                )
            }
        }
        .padding(.horizontal,10)
        .padding(.vertical,10)
        .background(content: {
            Rectangle()
                .fill(Color("ColorFondo"))
                .ignoresSafeArea()
                .shadow(color: Color("ColorFondo").opacity(2), radius: 1, x: 0, y: -2)
            
        })
        
    }
}
struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    @Binding var activeTab:Tab
    var body: some View {
        VStack(spacing:0){
            Image(systemName: activeTab == tab ? tab.selectedSystemImage : tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .orange : inactiveTint)
                .frame(width: 35,height: 35)
                
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            activeTab = tab
        }
    }
}

#Preview {
    SwiftUIView()
}
