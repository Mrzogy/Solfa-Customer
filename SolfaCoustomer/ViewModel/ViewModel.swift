//
//  ViewModel.swift
//  SolfaCoustomer
//
//  Created by 3bood on 26/11/1444 AH.
//

import Foundation
import FirebaseFirestore
import SwiftUI
class ViewModel: ObservableObject {
    @Published var name = [Nams]()
    let db = Firestore.firestore()
    func read() {
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => قراءة\(document.data())")
                }
            }
        }
    }
    //للقراية من كولكشن اخر
    
    func Update() {
        let washingtonRef = db.collection("users").document("hpuNu1l5VHBDQu2sJdbd")

        // Set the "capital" field of the city 'DC'
        washingtonRef.updateData([
            "born": 2001
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    // لتحديث فيلد داخل دوكمنت محدد
    
    func server() {
        db.collection("users").document("hpuNu1l5VHBDQu2sJdbd").updateData([
            "born": FieldValue.serverTimestamp(),
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    // يحدد لي التاريخ الفعلي في وقت التحديث
    
    func nestedOb() {
        db.collection("Nested").document("frank").updateData([
            "age": 20,
            "favorites.color": "zig"
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        
      //يسوي تحديث للمعلومات الي احنانحددها داخل الفيلد الي داخل الدوكمنت
    }
    func frank() {
        let frankDocRef = db.collection("Nested").document("frank")
        frankDocRef.setData([
            "name": "Frank",
            "favorites": [ "food": "Pizza", "color": "Blue", "subject": "recess" ],
            "age": 12
            ])
    }
    // اضافة كولكشن ودوكمنت
    func ArrayUpdate() {
        let washingtonRef = db.collection("Nested").document("frank")
        washingtonRef.updateData([
            "employee": FieldValue.arrayUnion(["greater_virginia"])
        ])
    }
    //يضيف عنصر اضافي داخل المصفوفة
    
    func removeArray() {
        let washingtonRef = db.collection("Nested").document("frank")
        washingtonRef.updateData([
            "employee": FieldValue.arrayRemove(["greater_virginia"])
        ])
        
        //يحذف عنصر داخل المصفوفة
        
      
    }
    func numiric() {
        let washingtonRef = db.collection("Nested").document("frank")

        // Atomically increment the population of the city by 50.
        // Note that increment() with no arguments increments by 1.
        washingtonRef.updateData([
            "age": FieldValue.increment(Int64(50))
        ])
    }
    // يزود على العدد 50
    func transition() {
        let sfReference = db.collection("Nested").document("frank")

        db.runTransaction({ (transaction, errorPointer) -> Any? in
            let sfDocument: DocumentSnapshot
            do {
                try sfDocument = transaction.getDocument(sfReference)
            } catch let fetchError as NSError {
                errorPointer?.pointee = fetchError
                return nil
            }

            guard let oldPopulation = sfDocument.data()?["age"] as? Int else {
                let error = NSError(
                    domain: "AppErrorDomain",
                    code: -1,
                    userInfo: [
                        NSLocalizedDescriptionKey: "Unable to retrieve population from snapshot \(sfDocument)"
                    ]
                )
                errorPointer?.pointee = error
                return nil
            }

            // Note: this could be done without a transaction
            //       by updating the population using FieldValue.increment()
            transaction.updateData(["age": oldPopulation + 1], forDocument: sfReference)
            return nil
        }) { (object, error) in
            if let error = error {
                print("Transaction failed: \(error)")
            } else {
                print("Transaction successfully committed!")
            }
        }
    }
    // تخلي المستخدم كل مايضغط ضغطة يزيد عدد
    
    func passingTransition() {
        let sfReference = db.collection("Nested").document("frank")

        db.runTransaction({ (transaction, errorPointer) -> Any? in
            let sfDocument: DocumentSnapshot
            do {
                try sfDocument = transaction.getDocument(sfReference)
            } catch let fetchError as NSError {
                errorPointer?.pointee = fetchError
                return nil
            }

            guard let oldPopulation = sfDocument.data()?["age"] as? Int else {
                let error = NSError(
                    domain: "AppErrorDomain",
                    code: -1,
                    userInfo: [
                        NSLocalizedDescriptionKey: "Unable to retrieve population from snapshot \(sfDocument)"
                    ]
                )
                errorPointer?.pointee = error
                return nil
            }

            // Note: this could be done without a transaction
            //       by updating the population using FieldValue.increment()
            let newPopulation = oldPopulation + 1
            guard newPopulation <= 1000000 else {
                let error = NSError(
                    domain: "AppErrorDomain",
                    code: -2,
                    userInfo: [NSLocalizedDescriptionKey: "Population \(newPopulation) too big"]
                )
                errorPointer?.pointee = error
                return nil
            }

            transaction.updateData(["age": newPopulation], forDocument: sfReference)
            return newPopulation
        }) { (object, error) in
            if let error = error {
                print("Error updating population: \(error)")
            } else {
                print("Population increased to \(object!)")
            }
        }
    }
    
    func batched() {
        // Get new write batch
        let batch = db.batch()

        // Set the value of 'NYC'
        let nycRef = db.collection("Nested").document("frank")
        batch.setData([:], forDocument: nycRef)

        // Update the population of 'SF'
        let sfRef = db.collection("Nested").document("frank")
        batch.updateData(["age": 1000000 ], forDocument: sfRef)

        // Delete the city 'LA'
        let laRef = db.collection("Nested").document("frank")
        batch.deleteDocument(laRef)

        // Commit the batch
        batch.commit() { err in
            if let err = err {
                print("Error writing batch \(err)")
            } else {
                print("Batch write succeeded.")
            }
        }
    }
    func oflineData() {
        let docRef = db.collection("Nested").document("frank")

        // Force the SDK to fetch the document from the cache. Could also specify
        // FirestoreSource.server or FirestoreSource.default.
        docRef.getDocument(source: .cache) { (document, error) in
          if let document = document {
            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
            print("Cached document data: \(dataDescription)")
          } else {
            print("Document does not exist in cache")
          }
        }
    }
    
    func Where() {
        db.collection("Nested").whereField("Healthy", isEqualTo: true)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
        }
    }
    //يحدد الي الاشياء الي شرطها صحيح داخل الكوليكشن نيستيد هنا جاب كل الناس الصحيين
    
    func getAllDoc(){
        db.collection("Nested").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        //يس،ي ريد لكل الدوكمنت داخل الكولكشن
     
    }
    func listener() {
        db.collection("Nested").document("frank")
            .addSnapshotListener { documentSnapshot, error in
              guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
              }
              guard let data = document.data() else {
                print("Document data was empty.")
                return
              }
              print("Current data: \(data)")
            }
    }
    // هذا للتحديثات الفعلية اي يشي يغيره المستخدم دايركت وفي وقته يتغير في الواجهة
    
    func evant() {
        db.collection("Nested").document("frank")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                let source = document.metadata.hasPendingWrites ? "Local" : "Server"
                print("\(source) data: \(document.data() ?? [:])")
            }
    }
    // الايفانت مايرسل التغير على طول اتوقع انو يكون لها نسخه
    
    func listenMultipleCollection() {
        db.collection("Nested").whereField("Healthy", isEqualTo: true)
            .addSnapshotListener { querySnapshot, error in
                guard let snapshot = querySnapshot else {
                    print("Error fetching snapshots: \(error!)")
                    return
                }
                snapshot.documentChanges.forEach { diff in
                    if (diff.type == .added) {
                        print("New city: \(diff.document.data())")
                            
                    }
                    if (diff.type == .modified) {
                        print("Modified city: \(diff.document.data())")
                    }
                    if (diff.type == .removed) {
                        print("Removed city: \(diff.document.data())")
                    }
                }
            }
    }
    
    func array() {
        let citiesRef = db.collection("cities")

        citiesRef.document("SF").setData([
            "name": "San Francisco",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 860000,
            "regions": ["west_coast", "norcal"]
            ])
        citiesRef.document("LA").setData([
            "name": "Los Angeles",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 3900000,
            "regions": ["west_coast", "socal"]
            ])
        citiesRef.document("DC").setData([
            "name": "Washington D.C.",
            "country": "USA",
            "capital": true,
            "population": 680000,
            "regions": ["east_coast"]
            ])
    }
    
    func simpleQuery() {
        // Create a reference to the cities collection
        db.collection("cities").whereField("capital", isEqualTo: true)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        
                    }
                }
        }
        
    }
    func names() {
        db.collection("Names").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => قراءة\(document.data())")
                }
            }
        }
    }
}

struct Nams: Identifiable {
    var id = UUID()
    var name: String
    var age: String
}
