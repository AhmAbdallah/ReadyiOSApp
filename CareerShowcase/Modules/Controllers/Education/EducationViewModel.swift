//
//  EducationViewModel.swift
//  CareerShowcase
//
//  Created by Ahmed Abdallah on 28.11.2018.
//  Copyright © 2018 CareerShowcase. All rights reserved.
//

import Foundation
import SwiftyJSON

class EducationViewModel {
    var name: String
    var descriptionField: String
    var period: String
    private var educationModel : EducationModel?
    
    init(response: JSON) {
        
        educationModel = EducationModel.init(fromJson: response)
        name = (educationModel?.name)!
        descriptionField = (educationModel?.descriptionField)!
        period = (educationModel?.period)!
    }
    static func addEducation(json: JSON) -> [EducationViewModel] {
        var educationArray : [EducationViewModel] = []
        let jsonArr = json["data"].arrayValue
        educationArray = jsonArr.map{EducationViewModel.init(response: $0)}
        return educationArray
    }
    
}
