//
//  HomeViewHeader.swift
//  SolfaCoustomer
//
//  Created by 3bood on 01/12/1444 AH.
//

import SwiftUI

struct HomeViewHeader: View {
    var body: some View {
        HStack(spacing: 100) {
            VStack(alignment: .leading) {
                Text("Hi There!")
                    .bold()
                Text("welcome to the best App")
            }
            
            Image("person")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 50,height: 50)
            
                
        }
    }
}

struct HomeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewHeader()
    }
}
