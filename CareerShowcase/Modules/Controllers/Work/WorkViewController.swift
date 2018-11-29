//
//  WorkViewController.swift
//  Ahmed Abdallah
//
//  Created by Ahmed's Mac on 10/24/18.
//  Copyright © 2018 4a5. All rights reserved.
//

import UIKit

class WorkViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var workTableView: UITableView!
    var workViewModel : [WorkViewModel]!{
        didSet{
            self.workTableView.delegate = self
            self.workTableView.dataSource = self
            self.workTableView.register(UINib(nibName: "EductionTableViewCell", bundle: nil), forCellReuseIdentifier: "EductionTableViewCell")
            self.workTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getWorkData()
    }
    func getWorkData()
    {
        self.startAnimating()
        ServiceConnector.shared.connect(.getWork, success: { (target, response) in
            print(response)
            self.stopAnimating()
            if (response["status"]).int == 200
            {
                self.workViewModel = WorkViewModel.getWork(json: response)
            }
        })
    }
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eductionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EductionTableViewCell", for: indexPath) as! EductionTableViewCell
        eductionTableViewCell.selectionStyle = UITableViewCellSelectionStyle.none
        let work = self.workViewModel?[indexPath.row]
        eductionTableViewCell.workViewModel = work
        return eductionTableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.workViewModel?.count
            return count!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
