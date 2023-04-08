//
//  ContactModel.swift
//  ContactsSwiftyJSON-start
//
//  Created by Raman Kozar on 08/04/2023.
//

import Foundation
import Alamofire
import SwiftyJSON

class ContactModel {
    
    var id: String
    var name: String
    var status: String
    var species: String
    var gender: String
    var origin: String
    
    init(contactDictionary: JSON) {
        self.id = contactDictionary["id"].stringValue
        self.name = contactDictionary["name"].stringValue
        self.status = contactDictionary["status"].stringValue
        self.species = contactDictionary["species"].stringValue
        self.gender = contactDictionary["gender"].stringValue
        self.origin = contactDictionary["origin"].stringValue
    }
    
}
