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
    
    private var workModel : [WorkModel]? = []
    
    init(_ response: JSON) {
        
        workModel = WorkModel.workFrom(json: response)
    }
    func getWork(row: Int) ->  (name: String, description: String, period: String){
        let work = workModel![row]
        return (work.name!, work.descriptionField!, work.period!)
    }
    var count: Int? {
        
        return workModel?.count
        
    }
}
