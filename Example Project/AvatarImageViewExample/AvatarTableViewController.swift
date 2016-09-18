//
//  AvatarTableViewController.swift
//  AvatarImageViewExample
//
//  Created by Ayush Newatia on 12/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import UIKit
import AvatarImageView

class AvatarTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct Cells {
        static let AvatarCell = "avatarCell"
    }
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 120
        }
    }
    
    var data: [ExampleData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<50 { data.append(ExampleData()) }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.AvatarCell) as! AvatarTableViewCell
        cell.avatarImageView.dataSource = data[indexPath.row]
        
        return cell
    }
}
