//
//  TabView.swift
//  SolfaCoustomer
//
//  Created by 3bood on 28/11/1444 AH.
//

import SwiftUI

struct TabView1: View {
    @ObservedObject var vm = ViewModel()
    @StateObject private var viewModel = settingsViewModel()
    @ObservedObject var vm1 = CastomerViewModel()
    @State private var showSignInView1: Bool = false
    @Binding var showsSignView: Bool
    var body: some View {
        NavigationStack {
            TabView {
              
                AllOrders()
                    .tabItem {
                        Label("More", systemImage: "ellipsis.rectangle")
                    }
               
//                ContactWithUs()
//                    .tabItem {
//                        Label("Home", systemImage: "house")
//                    }
                HomeView2()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                 Account(showsSignView: $showsSignView)
                     .tabItem {
                         Label("Account", systemImage: "person.crop.circle.badge")
                     }
            }
        }
    }
}

struct TabView1_Previews: PreviewProvider {
    static var previews: some View {
        TabView1(showsSignView: .constant(false))
    }
}
