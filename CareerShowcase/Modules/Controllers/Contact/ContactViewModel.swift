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
    var name: String
    var descriptionField: String
    var period: String
    private var contactModel : ContactModel?
    init(_ response: JSON) {
        contactModel = ContactModel.init(fromJson: response)
        name = (contactModel?.name)!
        descriptionField = (contactModel?.descriptionField)!
        period = (contactModel?.period)!
    }
    static func addContacts(json: JSON?) -> [ContactViewModel] {
        var contactViewModel : [ContactViewModel] = []
        let jsonArray = json!["data"].arrayValue
        contactViewModel = jsonArray.map{ContactViewModel.init($0)}
        return contactViewModel
    }
}
