//
//  EductionTableViewCell.swift
//  Ahmed Abdallah
//
//  Created by Ahmed's Mac on 10/24/18.
//  Copyright © 2018 4a5. All rights reserved.
//

import UIKit

class EductionTableViewCell: UITableViewCell {
    @IBOutlet weak var educationNameLBL: UILabel!
    @IBOutlet weak var educationDescriptionLBL: UILabel!
    @IBOutlet weak var educationDurationLBL: UILabel!
    var contactViewModel: ContactViewModel!{
        didSet{
            educationNameLBL.text = contactViewModel.name
            educationDescriptionLBL.text = contactViewModel.descriptionField
            educationDurationLBL.text = contactViewModel.period
        }
    }
    var educationViewModel: EducationViewModel!{
        didSet{
            educationNameLBL.text = educationViewModel.name
            educationDescriptionLBL.text = educationViewModel.descriptionField
            educationDurationLBL.text = educationViewModel.period
        }
    }
    var skillsViewModel: SkillsViewModel!{
        didSet{
            educationNameLBL.text = skillsViewModel.name
            educationDescriptionLBL.text = skillsViewModel.descriptionField
            educationDurationLBL.text = skillsViewModel.period
        }
    }
    var workViewModel: WorkViewModel!{
        didSet{
            educationNameLBL.text = workViewModel.name
            educationDescriptionLBL.text = workViewModel.descriptionField
            educationDurationLBL.text = workViewModel.period
        }
    }
            
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
