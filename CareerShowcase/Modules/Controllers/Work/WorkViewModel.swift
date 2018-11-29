//
//  WorkViewModel.swift
//  CareerShowcase
//
//  Created by Ahmed Abdallah on 28.11.2018.
//  Copyright © 2018 CareerShowcase. All rights reserved.
//

import Foundation
import SwiftyJSON

class WorkViewModel {
    var name: String
    var descriptionField: String
    var period: String
    private var workModel : WorkModel?
    
    init(_ response: JSON) {
        workModel = WorkModel.init(fromJson: response)
        name = (workModel?.name)!
        descriptionField = (workModel?.descriptionField)!
        period = (workModel?.period)!
    }
    static func getWork(json: JSON) -> [WorkViewModel] {
        var workArray : [WorkViewModel] = []
        let jsonArray = json["data"].arrayValue
        workArray = jsonArray.map{WorkViewModel.init($0)}
        return workArray
    }
}
