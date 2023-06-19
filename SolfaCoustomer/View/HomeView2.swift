//
//  HomeView2.swift
//  SolfaCoustomer
//
//  Created by 3bood on 01/12/1444 AH.
//

import SwiftUI

struct HomeView2: View {
    @ObservedObject var vm = Stores()
    var body: some View {
        ScrollView {
            VStack(spacing: 50){
                HomeViewHeader()
                Rectangle1()
                Storesos()
                Spacer()
            }
        }
        
    }
}

struct HomeView2_Previews: PreviewProvider {
    static var previews: some View {
        HomeView2()
    }
}
