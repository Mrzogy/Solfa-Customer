//
//  AllOrders.swift
//  SolfaCoustomer
//
//  Created by 3bood on 26/11/1444 AH.
//

import SwiftUI

struct AllOrders: View {
    @Binding var showsSignView: Bool
    var body: some View {
        NavigationView{
            Form {
               // Text("Hi")
                NavigationLink {
                   Account(showsSignView: $showsSignView)
                } label: {
                        Text("Account")
                }
                NavigationLink {
                   SettingsView(showsSignView: $showsSignView)
                } label: {
                        Text("Settings")
                }
                NavigationLink {
                  ContactWithUs()
                } label: {
                        Text("Contact")
                }
                NavigationLink {
                  SwiftUIView()
                } label: {
                        Text("read")
                }
            }
        }
    }
}

struct AllOrders_Previews: PreviewProvider {
    static var previews: some View {
        AllOrders(showsSignView: .constant(false))
    }
}
