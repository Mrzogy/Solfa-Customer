//
//  ContentView.swift
//  SolfaCoustomer
//
//  Created by 3bood on 26/11/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ViewModel()
    @StateObject private var viewModel = settingsViewModel()
    @Binding var showsSignView: Bool
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Button("read") {
                    vm.read()
                    vm.Update()
                    vm.server()
                    
                }
                Button("update") {
                    vm.frank()
                }
                Button("update frank") {
                    vm.nestedOb()
                }
                Button("update Array") {
                    vm.ArrayUpdate()
                }
                Button("remove Array") {
                    vm.removeArray()
                }
                
                Button("numiric Array") {
                    vm.numiric()
                }
                
                Button("transition") {
                    vm.transition()
                }
                Button("pathed") {
                    vm.batched()
                }
                Button("pathed") {
                    vm.oflineData()
                }
              
            }
            .padding()
            VStack{
                Button("where field") {
                    vm.Where()
                }
                Button("getAll doc") {
                    vm.getAllDoc()
                }
                Button("listener doc") {
                    vm.listener()
                }
                Button("evant doc") {
                    vm.evant()
                }
                Button("listen Multiple Collection") {
                    vm.listenMultipleCollection()
                }
                Button("Add city array") {
                    vm.array()
                }
                Button("simple query array") {
                    vm.simpleQuery()
                }
                Button("log out") {
                    Task{
                        do {
                            try viewModel.signOut()
                            showsSignView = true
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( showsSignView: .constant(false))
    }
}
