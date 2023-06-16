//
//  ContactWithUs.swift
//  SolfaCoustomer
//
//  Created by 3bood on 27/11/1444 AH.
//

import SwiftUI

struct ContactWithUs: View {
    @State var name = ""
    @ObservedObject var vm = Contact()
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Contact With Us")
                    .bold()
                Text("Do you Have Quitions?")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Group {
                    
                    VStack(alignment: .leading) {
                        Text("subject")
                        TextField("name", text: $vm.subject)
                            .textFieldStyle(.roundedBorder)
                    }
                    VStack(alignment: .leading) {
                        Text("Name")
                        TextField("phone", text:  $vm.name)
                            .textFieldStyle(.roundedBorder)
                    }
                    VStack(alignment: .leading) {
                        Text("Phone")
                        TextField("Email", text:  $vm.phone)
                            .textFieldStyle(.roundedBorder)
                    }
                    VStack(alignment: .leading) {
                        Text("Email")
                        TextField("Email", text:  $vm.email)
                            .textFieldStyle(.roundedBorder)
                    }
                    //VStack(alignment: .leading) {
                        Text("Message")
                        TextField("Email", text:  $vm.massege)
                        .font(.footnote)
                        .padding(.leading,11)
                        .frame(width: 368,height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        
                   // }
                    Spacer()
                    
                }
            }.padding()
            Button("Send") {
                vm.AddContact()
            }
        }
    }
}

struct ContactWithUs_Previews: PreviewProvider {
    static var previews: some View {
        ContactWithUs()
    }
}
