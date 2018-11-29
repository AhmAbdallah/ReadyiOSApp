//
//  ContactViewController.swift
//  Ahmed Abdallah
//
//  Created by Ahmed's Mac on 10/24/18.
//  Copyright © 2018 4a5. All rights reserved.
//

import UIKit


class ContactViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var contactTableView: UITableView!
    var contactViewModel: [ContactViewModel]!{
        didSet{
            self.contactTableView.delegate = self
            self.contactTableView.dataSource = self
            self.contactTableView.register(UINib(nibName: "EductionTableViewCell", bundle: nil), forCellReuseIdentifier: "EductionTableViewCell")
            self.contactTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getSkillsData()
    }
    func getSkillsData()
    {
        self.startAnimating()
        ServiceConnector.shared.connect(.getContact, success: { (target, response) in
            print(response)
            self.stopAnimating()
            if (response["status"]).int == 200
            {
                self.contactViewModel = ContactViewModel.addContacts(json: response)
            }
        })
    }
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eductionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EductionTableViewCell", for: indexPath) as! EductionTableViewCell
        eductionTableViewCell.selectionStyle = UITableViewCellSelectionStyle.none
        eductionTableViewCell.contactViewModel = self.contactViewModel?[indexPath.row]
        return eductionTableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.contactViewModel.count
        return count
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
