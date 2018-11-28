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
    
    private var educationModel : [EducationModel]? = []
    
    init(_ response: JSON) {
        
        self.educationModel = EducationModel.educationFrom(json: response)
    }
    func getEducation(row: Int) ->  (name: String, description: String, period: String){
        let edu = self.educationModel![row]
        return (edu .name!, edu.descriptionField!, edu.period!)
    }
    var count: Int? {
        
        return self.educationModel?.count
        
    }
}
