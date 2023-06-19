//
//  Stores.swift
//  SolfaCoustomer
//
//  Created by 3bood on 01/12/1444 AH.
//

import SwiftUI

struct Storesos: View {
    @ObservedObject var vm = Stores()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let gradiant = Gradient(colors: [Color.blue,Color.white])
  
    var body: some View {
        let liner = LinearGradient(gradient: gradiant, startPoint: .top, endPoint: .bottomTrailing)
      //  NavigationView {
            ScrollView {
                VStack {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(vm.store) { i in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("Color 2"))
                                .frame(width: 170, height: 170)
                                .cornerRadius(10)
                                .foregroundColor(.primary)
                                .shadow(radius: 10)
                                
                                VStack(alignment: .leading) {
                                   
                                    Text(i.Storename)
                                        .foregroundColor(.black)
                                        .bold()
                                    Text(i.StoreType)
                                        .foregroundColor(.white)
                                        Spacer()
    //                                Image(systemName: "map")
                                    NavigationLink {
                                        MapView()
                                    } label: {
                                        Image(systemName: "map")
                                            .foregroundColor(.white)
                                    }

                                }.padding()
                           
                            }
                          
                        }
                    }
               }.padding(5)
                .onAppear() {
                    self.vm.readStore()
            }
            }
       // }
    }
}

struct Stores_Previews: PreviewProvider {
    static var previews: some View {
        Storesos()
    }
}
