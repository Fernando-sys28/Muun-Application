//
//  Tab.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 19/10/23.
//

import SwiftUI
/// App Tab's
enum Tab: String, CaseIterable {
    case home = "Home"
    case tracker = "Tracker"
    case Luna = "Luna"
    case statistics = "Statistics"
    case perfil="Perfil"
    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .tracker:
            return "text.book.closed"
        case .Luna:
            return "person"
        case .statistics:
            return "chart.xyaxis.line"
        case .perfil:
            return "person"
            
        }
        
    }
    var selectedSystemImage: String {
            switch self {
            case .home:
                return "house.fill"
            case .tracker:
                return "text.book.closed.fill"
            case .Luna:
                return "person"
            case .statistics:
                return "chart.xyaxis.line"
            case .perfil:
                return "person.fill"
            }
        }
    
    var ColorTab: Color {
            switch self {
            case .home:
                return Color(.colorTab)
            case .tracker:
                return Color(.naranja)
            case .Luna:
                return Color(.ciculoRosado)
            case .statistics:
                return Color(.verdoso)
            case .perfil:
                return Color(.ciculoRosado)
            }
        }
    
    
    var index:Int{
        return Tab.allCases.firstIndex(of:self) ?? 0
    }
}

