//
//  AllOrders.swift
//  SolfaCoustomer
//
//  Created by 3bood on 26/11/1444 AH.
//

import SwiftUI

struct AllOrders: View {
    var body: some View {
        NavigationView{
            Form {
               // Text("Hi")
                NavigationLink {
                    Text("Hi")
                } label: {
                    VStack {
                        Text("Hi")
                            .foregroundColor(.green)
                        Text("Hi")
                            .foregroundColor(.green)
                        Text("Hi")
                            .foregroundColor(.green)
                        Text("Hi")
                            .foregroundColor(.green)
                    }
                  
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
