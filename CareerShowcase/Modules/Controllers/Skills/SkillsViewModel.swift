//
//  SkillsViewModel.swift
//  CareerShowcase
//
//  Created by Ahmed Abdallah on 28.11.2018.
//  Copyright © 2018 CareerShowcase. All rights reserved.
//

import Foundation
import SwiftyJSON

class SkillsViewModel {
    
    private var skillsModel : [SkillsModel]? = []
    
    init(_ response: JSON) {
        
        skillsModel = SkillsModel.skillsFrom(json: response)
    }
    func getSkill(row: Int) ->  (name: String, description: String, period: String){
        let skill = skillsModel![row]
        return (skill.name!, skill.descriptionField!, skill.period!)
    }
    var count: Int? {
        
        return skillsModel?.count
        
    }
}
