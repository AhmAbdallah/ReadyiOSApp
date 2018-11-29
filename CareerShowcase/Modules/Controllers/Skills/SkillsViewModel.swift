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
    var name: String
    var descriptionField: String
    var period: String
    private var skillsModel :SkillsModel?
    init(response: JSON) {
        
        skillsModel = SkillsModel.init(fromJson: response)
        name = (skillsModel?.name)!
        descriptionField = (skillsModel?.descriptionField)!
        period = (skillsModel?.period)!
    }
    static func getSkills(json: JSON) -> [SkillsViewModel] {
        var skillsArray : [SkillsViewModel] = []
        let jsonArray = json["data"].arrayValue
        skillsArray = jsonArray.map{SkillsViewModel.init(response: $0)}
        return skillsArray
    }}
