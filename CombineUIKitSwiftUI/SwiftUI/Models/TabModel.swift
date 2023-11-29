//
//  TabModel.swift
//  CombineUIKitSwiftUI
//
//  Created by KOSIGN on 29/11/23.
//

import Foundation
import SwiftUI

enum TabItem : String, CaseIterable, Hashable {
    case home
    , services
    , partners
    , activity
    
    var title : String {
        switch self {
        case .home     : return "Home"
        case .services : return "Service"
        case .partners : return "Partner"
        case .activity : return "Activity"
        }
    }
    
    var systemImage : String {
        switch self {
        case .home:
            return  "home"
        case .services:
            return "service"
        case .partners:
            return "partner"
        case .activity:
            return "directions_bike"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return Color.red
        case .services: return Color.blue
        case .partners: return Color.green
        case .activity: return Color.orange
        }
    }
    
    var index : Int {
        return TabItem.allCases.firstIndex(of: self) ?? 0
    }
}

//MARK: Create PreferenceKey
//import Foundation
//import SwiftUI

// MARK: -  Create PreferenceKey
struct TabBarItemsPreferenceKey: PreferenceKey {
    
    static var defaultValue: [TabItem] = []
    
    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value += nextValue()
    }
}

// MARK: -  ViewModifier
struct TabBarItemViewModifier: ViewModifier {
    
    let tab: TabItem
    @Binding var selection: TabItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
    }
}

// MARK: -  Extenstion
extension View {
    func tabBarItem(tab: TabItem, selection: Binding<TabItem>) -> some View {
        self
            .modifier(TabBarItemViewModifier(tab: tab, selection: selection))
    }
}

