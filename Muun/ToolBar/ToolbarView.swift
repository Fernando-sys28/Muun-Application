//
//  SwiftUIView.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 19/10/23.
//
import SwiftUI

struct ToolbarView: View {
    @State private var activeTab: Tab = .home
    
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                TabView(selection: $activeTab){
                    
                    MainPage(calendar: Calendar(identifier: .gregorian))
                        .tag(Tab.home)
                        .toolbar(.hidden, for: .tabBar)
                    Normal()
                        .tag(Tab.tracker)
                        .toolbar(.hidden, for: .tabBar)
                    ChatView()
                        .tag(Tab.Luna)
                        .toolbar(.hidden, for: .tabBar)
                    Normal()
                        .tag(Tab.statistics)
                        .toolbar(.hidden, for: .tabBar)
                    PerfilMomView(mom:MomData.moms[0])
                        .tag(Tab.perfil)
                        .toolbar(.hidden, for: .tabBar)
                }
                CustomTabBar()
                    .background(Color("ColorFondo2"))
                
            }
            
        }
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    func CustomTabBar(_ tint: Color = Color("ColorTab"), _ inactiveTint: Color = .gray) ->
    some View {
        HStack(alignment: .bottom, spacing: 15) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                if tab == .Luna {
                    Button(action: {
                        activeTab = tab
                    }) {
                        Image("LunaTab")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .padding(.top, 7)
                    }
                    .background(Circle().fill(Color.white).frame(width: 65, height: 65).shadow(radius: 4))
                    .offset(y: -55)
                } else {
                    TabItem(tint: tint,
                            inactiveTint: inactiveTint,
                            tab: tab,
                            activeTab: $activeTab)
                }
            }
        }
        .padding(.horizontal,10)
        .padding(.vertical,10)
        .padding(.bottom,-70)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .shadow(radius: 0.4 ,y:0.4)
            
        )
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
                .foregroundColor(activeTab == tab ? tab.ColorTab : inactiveTint)
                .frame(width: 35,height: 35)
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tab.ColorTab : .gray)
        }
        .offset(y:-65)
        .frame(maxWidth: .infinity)
        .onTapGesture {
            activeTab = tab
        }
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}

struct Normal: View {
    var body: some View {
        ZStack{
            Color(.red)
        }
        
    }
}
