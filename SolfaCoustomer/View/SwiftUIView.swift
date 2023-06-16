//
//  SwiftUIView.swift
//  SolfaCoustomer
//
//  Created by 3bood on 27/11/1444 AH.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var vm = Contact()
    var body: some View {
        VStack{
            ForEach(vm.Contact1) { i in
                Text(i.name)
            }
        }
        .onAppear() {
            self.vm.readContact()
        }
       
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
