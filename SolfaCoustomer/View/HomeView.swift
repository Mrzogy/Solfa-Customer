//
//  HomeView.swift
//  SolfaCoustomer
//
//  Created by 3bood on 27/11/1444 AH.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm = Stores()
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: -10){
                ForEach(vm.store) { i in
                    VStack{
                        ZStack(alignment: .topTrailing){
                            Image(systemName: "car")
                                .resizable()
                                .clipShape(Rectangle())
                                .frame(width: 100,height: 100)
                                .cornerRadius(10)
                                .padding()
                            Image(systemName: "heart.fill")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 20,height: 20)
                                .padding(8)
                                .background(.white)
                                .clipShape(Circle())
                        }
                        VStack {
                            Text(i.Storename)
                            Text(i.StoreTitle)
                            Text(i.StoreType)
                        }
                        .padding(-1)
                    }.padding(.trailing)
               
                }
            }
            .onAppear() {
                self.vm.readStore()
        }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
