//
//  CustomerViewModel.swift
//  SolfaCoustomer
//
//  Created by 3bood on 26/11/1444 AH.
//

import FirebaseFirestore
import FirebaseAuth

class CastomerViewModel: ObservableObject {
    @Published var name = ""
    @Published var phone = ""
    @Published var email = ""
    @Published var gender = Date()
    @Published var isMale = ""
    let db = Firestore.firestore()
    
    func AddAccount()  {
        
        let docData: [String: Any] = [
            "name": name,
            "phone": phone,
            "email": email,
            "gender": gender,
            "isMale": isMale
                    ]
        
        db.collection("Account_informition").document(Auth.auth().currentUser?.uid ?? "").setData(docData) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    func AddAccountGenirateid() {
        var ref: DocumentReference? = nil
        ref = db.collection("cities").addDocument(data: [
            "name": "Tokyo",
            "country": "Japan"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
        func addDataToSubcollection() {
               let db = Firestore.firestore()
               
               // Create a reference to the document that will contain the subcollection
               let docRef = db.collection("users").document("User_info")
               
               // Create a reference to the subcollection
               let subcollectionRef = docRef.collection("Account_informition")
               
               // Add a new document to the subcollection
               subcollectionRef.addDocument(data: [
                "name": name,
                "phone": phone,
                "email": email,
                "gender": gender,
                "isMale": isMale
               ]) { error in
                   if let error = error {
                       print("Error adding document: \(error)")
                   } else {
                       print("Document added with ID: \(subcollectionRef.document().documentID)")
                   }
               }
           }
    
}


class Contact: ObservableObject {
    let db = Firestore.firestore()
    @Published var subject = ""
    @Published var phone = ""
    @Published var email = ""
    @Published var name = ""
    @Published var massege = ""
    @Published var Contact1 = [ContactStr]()
    
    func readContact() {
        db.collection("Account_Contact").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.Contact1 = documents.map { (queryDocumentSnapshot) -> ContactStr in
                let data = queryDocumentSnapshot.data()
                let subject = data["subject"] as? String ?? ""
                let phone = data["phone"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let massege = data["massege"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                
                return ContactStr(subject: subject, phone: phone, email: email, name: name, massege: massege)
            }
        }
    }
    func AddContact() {
        let doccontact: [String: Any] = [
            "subject": subject,
            "phone": phone,
            "email": email,
            "name": name,
            "massege": massege
                    ]
        
        db.collection("Account_Contact").document(Auth.auth().currentUser?.uid ?? "").setData(doccontact) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}


class Stores: ObservableObject {
    let db = Firestore.firestore()
    @Published var store = [StoresStr]()
    
    func readStore() {
        db.collection("Store").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.store = documents.map { (queryDocumentSnapshot) -> StoresStr in
                let data = queryDocumentSnapshot.data()
                let Storename = data["Storename"] as? String ?? ""
                let StoreType = data["StoreType"] as? String ?? ""
                let StoreTitle = data["StoreTitle"] as? String ?? ""
                let massege = data["massege"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                
                return StoresStr(Storename: Storename, StoreType: StoreType, StoreTitle: StoreTitle)
            }
        }
    }

}
