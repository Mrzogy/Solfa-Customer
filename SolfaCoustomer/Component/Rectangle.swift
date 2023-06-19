//
//  Rectangle.swift
//  SolfaCoustomer
//
//  Created by 3bood on 01/12/1444 AH.
//

import SwiftUI

struct Rectangle1: View {
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 350,height: 100)
                    .shadow(radius: 10)
                .foregroundColor(Color("Color 3"))
                HStack {
                    VStack(spacing: 10) {
                        Text("All Store You Can See")
                            .foregroundColor(.white)
                        Text("Here You can see All Store")
                            .foregroundColor(.white)
                    }.padding()
                    Image("Store")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 120,height: 120)
                        
                }
            }
        }
    }
}

struct Rectangle_Previews: PreviewProvider {
    static var previews: some View {
        Rectangle1()
    }
}
