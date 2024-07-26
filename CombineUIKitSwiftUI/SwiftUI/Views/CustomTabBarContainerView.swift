//
//  CustomTabBarContainerView.swift
//  CombineUIKitSwiftUI
//
//  Created by KOSIGN on 29/11/23.
//

import SwiftUI

struct CustomTabBarContainerView<Content:View>: View {
    
    @Binding var selection: TabItem
    let content: Content
    @State private var tabs: [TabItem] = []
    
    init(selection: Binding<TabItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        } //: ZSTACK
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [TabItem] = [
        .home, .services, .partners, .activity
    ]
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}


