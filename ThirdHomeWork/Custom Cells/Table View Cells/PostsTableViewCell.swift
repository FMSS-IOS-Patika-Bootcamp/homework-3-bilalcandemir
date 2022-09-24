//
//  PostsTableViewCell.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/18/22.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    // I defined the identifer as static to make this identifier reachable in other classes
    static let identifier = "PostsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // This function shows posts which is downloaded from model
    func setData(item:PostsCellViewModel){
        titleLabel.text = item.title
        bodyLabel.text = item.description
    }
    
}
