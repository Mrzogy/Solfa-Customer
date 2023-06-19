//
//  SettingsView.swift
//  SolfaCoustomer
//
//  Created by 3bood on 27/11/1444 AH.
//

import SwiftUI

struct SettingsView: View {
    @State var pass = ""
    @StateObject private var viewModel = settingsViewModel()
    @State var ShowAlert = false
    @Binding var showsSignView: Bool
    var body: some View {
        Form{
            Section {
                Button("Reaset Password") {
                    Task{
                        do {
                            try await viewModel.resetPassword()
                            print("Password reset")
                            ShowAlert = true
                        } catch {
                            print(error)
                        }
                    }
                }
                Button("Update Email") {
                    Task{
                        do {
                            try await viewModel.updateEmail()
                            print("Password reset")
                           // ShowAlert = true
                        } catch {
                            print(error)
                        }
                    }
                }
                .alert("password is reset",isPresented: $ShowAlert) {
                    Text("No")
            }
            }header: {
                Text("Account Settings")
            }
            
//            Button("Update Password") {
//                Task{
//                    do {
//                        try await viewModel.updatePassword()
//                        print("Password updated")
//                       // showsSignView = true
//                    } catch {
//                        print(error)
//                    }
//                }
//            }
//            Button("Update email") {
//                Task{
//                    do {
//                        try await viewModel.updateEmail()
//                        print("email updated")
//                       // showsSignView = true
//                    } catch {
//                        print(error)
//                    }
//                }
//            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView( showsSignView: .constant(false))
    }
}
