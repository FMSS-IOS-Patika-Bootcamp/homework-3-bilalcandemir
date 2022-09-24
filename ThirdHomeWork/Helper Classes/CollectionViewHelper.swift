//
//  CollectionViewHelper.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/21/22.
//

import Foundation
import UIKit

// This class handle to create a new collection view for images view controller
class CollectionViewHelper:NSObject {
    
    // Create collection view view controller and data array for load when we init on view controller
    var collectionView:UICollectionView?
    var viewController:ImagesViewController?
    var dataArray:[ImageCellViewModel] = []
    
    
    // Create collection view
    init(collectionView:UICollectionView, vc:ImagesViewController, imagesURLArray:[ImageCellViewModel]){
        super.init()
        self.collectionView = collectionView
        self.viewController = vc
        self.dataArray = imagesURLArray
        configureCollectionView()
    }
    
    // Configure collection view with register function and delegation process
    func configureCollectionView(){
        collectionView?.register(.init(nibName: ImagesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImagesCollectionViewCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
}

// MARK: Collection View Delegation
extension CollectionViewHelper:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure Cell and send data which come from view model
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesCollectionViewCell.identifier, for: indexPath) as! ImagesCollectionViewCell
        cell.setData(dataArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // We have 5000 images in api, so we can show only 100
        return 100
    }
}

extension CollectionViewHelper:UICollectionViewDelegateFlowLayout {
    //Size for item at for make grid look
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2 - 25
        
        return CGSize(width: width, height: 120)
    }
    
    // Given Some insets from collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30 , left: 16, bottom: 0, right: 16)
    }
    
    // Given line spacing for each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}


