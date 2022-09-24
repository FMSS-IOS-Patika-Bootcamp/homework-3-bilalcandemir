//
//  ImagesCollectionViewCell.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/22/22.
//

import UIKit
import Kingfisher
class ImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemsImageView: UIImageView!
    
    // I defined the identifer as static to make this identifier reachable in other classes
    static let identifier = "ImagesCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // This function use kingfisher for download images which i gave the url downloaded from model
    func setData(_ item:ImageCellViewModel){
        let url = URL(string: item.url)
        itemsImageView.kf.setImage(with: url)
    }
}
