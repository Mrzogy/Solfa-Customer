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
        ScrollView {
            VStack {
                VStack(alignment: .leading,spacing: 10) {
                    Text("Contact With Us")
                        .bold()
                    Text("Do you Have Quitions?")
                        .font(.caption)
                        .foregroundColor(.secondary)
                      
                    Group {
                        
                        VStack(alignment: .leading) {
                            Text("subject")
                            TextField("name", text: $vm.subject)
                                .padding()
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(10)
                        }
                        VStack(alignment: .leading) {
                            Text("Name")
                            TextField("phone", text:  $vm.name)
                                .padding()
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(10)
                        }
                        VStack(alignment: .leading) {
                            Text("Phone")
                            TextField("Email", text:  $vm.phone)
                                .padding()
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(10)
                        }
                        VStack(alignment: .leading) {
                            Text("Email")
                            TextField("Email", text:  $vm.email)
                                .padding()
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(10)
                        }
                        //VStack(alignment: .leading) {
                            Text("Message")
                        TextField("Email", text:  $vm.massege,axis: .vertical)
                            .padding()
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(10)
    //                        .font(.footnote)
    //                        .padding(.leading,11)
    //                        .frame(width: 368,height: 100)
    //                        .overlay(
    //                            RoundedRectangle(cornerRadius: 5)
    //                                .stroke(Color.black, lineWidth: 1)
    //                        )
                            
                            
                       // }
                        Spacer()
                        
                    }
                }.padding()
                Button("Send") {
                    vm.AddContact()
                }
                .font(.headline)
                .foregroundColor(Color("Color 1"))
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color("Color"))
                .cornerRadius(10)
            }.padding()
        }
    }
}

struct ContactWithUs_Previews: PreviewProvider {
    static var previews: some View {
        ContactWithUs()
    }
}
