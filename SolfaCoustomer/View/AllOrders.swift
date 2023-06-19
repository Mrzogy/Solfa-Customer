//
//  AllOrders.swift
//  SolfaCoustomer
//
//  Created by 3bood on 26/11/1444 AH.
//

import SwiftUI

var navigationItems = [
   // NavigationItem(title: "Account", icon: "person", menu: .compass),
    NavigationItem(title: "Settings", icon: "gear", menu: .card),
    NavigationItem(title: "Contact With Us", icon: "headphones", menu: .charts),
    
]
enum Menu: String {
   // case compass
    case card
    case charts
   
}
struct AllOrders: View {
   // @Binding var showsSignView: Bool
    var body: some View {
            NavigationStack {
                List(navigationItems) { item in
                    NavigationLink(value: item) {
                        Label(item.title, systemImage: item.icon)
                            .foregroundColor(.primary)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("SwiftUI apps")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: NavigationItem.self) { item in
                    switch item.menu {
                    
                       // Account(showsSignView: .constant(false))
                    case .card:
                        SettingsView( showsSignView: .constant(false))
                    case .charts:
                        ContactWithUs()
               
                    }
                }
            }
        
    }
}

struct AllOrders_Previews: PreviewProvider {
    static var previews: some View {
        AllOrders()
    }
}
