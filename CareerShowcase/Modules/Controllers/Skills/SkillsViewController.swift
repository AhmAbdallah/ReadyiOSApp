//
//  SkillsViewController.swift
//  Ahmed Abdallah
//
//  Created by Ahmed's Mac on 10/24/18.
//  Copyright © 2018 4a5. All rights reserved.
//

import UIKit

class SkillsViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var skillsTableView: UITableView!
    var skillsViewModel : [SkillsViewModel]!{
        didSet{
            self.skillsTableView.delegate = self
            self.skillsTableView.dataSource = self
            self.skillsTableView.register(UINib(nibName: "EductionTableViewCell", bundle: nil), forCellReuseIdentifier: "EductionTableViewCell")
            self.skillsTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getSkillsData()
    }
    func getSkillsData()
    {
        self.startAnimating()
        ServiceConnector.shared.connect(.getSkills, success: { (target, response) in
            print(response)
            self.stopAnimating()
            if (response["status"]).int == 200
            {
                self.skillsViewModel = SkillsViewModel.getSkills(json: response)
            }
        })
    }
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let eductionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EductionTableViewCell", for: indexPath) as! EductionTableViewCell
        eductionTableViewCell.selectionStyle = UITableViewCellSelectionStyle.none
        let skill = self.skillsViewModel?[indexPath.row]
        eductionTableViewCell.skillsViewModel = skill
        return eductionTableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = self.skillsViewModel?.count
        return count!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}
