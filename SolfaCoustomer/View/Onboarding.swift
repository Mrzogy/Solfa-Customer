////
////  Onboarding.swift
////  SolfaCoustomer
////
////  Created by 3bood on 01/12/1444 AH.
////
//
//import SwiftUI
////import RiveRuntime
////import Firebase
////import FirebaseAuth
//struct Onboarding: View {
//   // let button = RiveViewModel(fileName: "button")
//    @State var like: Bool = false
//    @State var showModel = false
//    @Binding var show: Bool
//    var body: some View {
//        NavigationStack {
//            ZStack{
//                backgrund
//                
//                content
//                Color("Shadow")
//                    .offset(y: showModel ? -0 : 0)
//                    .opacity(showModel ? 0.4 : 0)
//                    .ignoresSafeArea()
//                
//                
//                
//            }
//        }
//    }
//    var content: some View{
//        VStack(alignment: .leading,spacing: 30){
//            Text("Solfa")
//                .font(.custom("Poppins Bold", size: 35, relativeTo: .largeTitle))
//                .frame(width: 260, alignment: .leading)
//            
//            Text("It is an application that helps establishments manage their facilities comfortably ")
//                .font(.body)
//                .opacity(0.7)
//            
//            Spacer()
//            
//            NavigationLink(destination:LoginScreenView()) {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label Content@*/Text("Navigate")/*@END_MENU_TOKEN@*/
//            }
//           
//
//            Text("We recpiect all peoaple come in or life and we have issus that we love you so mutch")
//                .font(.footnote)
//                .opacity(0.7)
//        }
//        .padding(40)
//        .padding(.top,40)
//        
//    }
//}
//
//var backgrund : some View {
//  //  RiveViewModel(fileName: "shame").view()
//        .ignoresSafeArea()
//        .blur(radius: 30)
//        .background(
//        Image("Spline")
//            .blur(radius: 50)
//            .offset(x: 200, y: 100)
//        
//        )
//  
//    
//}
//
//
//struct Onboarding_Previews: PreviewProvider {
//    static var previews: some View {
//        Onboarding(show: .constant(true))
//    }
//}
