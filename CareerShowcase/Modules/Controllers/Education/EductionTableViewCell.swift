//
//  EductionTableViewCell.swift
//  Ahmed Abdallah
//
//  Created by Ahmed's Mac on 10/24/18.
//  Copyright © 2018 4a5. All rights reserved.
//

import UIKit

class EductionTableViewCell: UITableViewCell {
    @IBOutlet weak var educationTitle: UILabel!
    @IBOutlet weak var educationDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
