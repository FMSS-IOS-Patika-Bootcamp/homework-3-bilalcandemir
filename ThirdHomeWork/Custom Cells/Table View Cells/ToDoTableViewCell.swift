//
//  ToDoTableViewCell.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/19/22.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var noteDescriptionLabel: UILabel!
    @IBOutlet weak var isDoneImageView: UIImageView!
    
    // I defined the identifer as static to make this identifier reachable in other classes
    static let identifier = "ToDoTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // This function shows todo list which information come from core data
    func setData(item: ToDoListItem){
        noteTitleLabel.text = item.noteTitle
        noteDescriptionLabel.text = item.noteDescription
        // This check the value isDone. If processes mark is done this change the image which is inside of cell
        if item.isDone {
            isDoneImageView.image = UIImage(systemName: "checkmark.circle")
        }
        else {
            isDoneImageView.image = UIImage(systemName: "circlebadge")
        }
    }
    
}
