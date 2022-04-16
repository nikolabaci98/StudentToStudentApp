//
//  FeedTableViewCell.swift
//  Qlink
//
//  Created by Nikola Baci on 4/10/22.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    var tableViewDelegate: FeedTableViewController!
    var row: Int!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var postTextField: UITextView!
    
    func configure(row: Int, _ delegate: FeedTableViewController) {
        self.tableViewDelegate = delegate
        self.row = row
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        
    }
    
    @IBAction func onUpvotePressed(_ sender: UIButton) {
        print("Liked printed on row \(row!)")
    }
    
    @IBAction func onDownvotePressed(_ sender: UIButton) {
        print("Unlike printed on row \(row!)")
    }
    
}
