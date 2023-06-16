//
//  Model.swift
//  SolfaCoustomer
//
//  Created by 3bood on 27/11/1444 AH.
//

import Foundation

struct ContactStr: Identifiable {
    var id:String = UUID().uuidString
    var subject: String
    var phone: String
    var email: String
    var name: String
    var massege: String
}

struct StoresStr: Identifiable {
    var id:String = UUID().uuidString
    var Storename: String
    var StoreType: String
    var StoreTitle: String
}
