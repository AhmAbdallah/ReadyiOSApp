//
//  ContactViewModel.swift
//  CareerShowcase
//
//  Created by Ahmed Abdallah on 28.11.2018.
//  Copyright © 2018 CareerShowcase. All rights reserved.
//

import Foundation
import SwiftyJSON

class ContactViewModel {
    
    private var contactModel : [ContactModel]? = []
    init(_ response: JSON) {
        self.contactModel = ContactModel.contactFrom(json: response)
    }
    func getContact(row: Int) ->  (name: String, description: String, period: String){
        let contact = self.contactModel![row]
        return (contact.name!, contact.descriptionField!, contact.period!)
    }
    var count: Int? {
        
            return self.contactModel?.count
        
    }
}
