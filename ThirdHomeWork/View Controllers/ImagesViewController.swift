//
//  ImagesViewController.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/21/22.
//

import UIKit

class ImagesViewController: UIViewController {
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    let imagesViewModel = ImagesViewModel()
    var collectionViewHelper:CollectionViewHelper?
    var myImagesArray:[ImageCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        imagesViewModel.imagesViewDelegate = self
        imagesViewModel.imagesDataFetch()
    }
    
    func initCollectionView(){
        collectionViewHelper = .init(collectionView: imagesCollectionView, vc: self, imagesURLArray: myImagesArray)
    }

}

extension ImagesViewController:ImagesViewDelegate {
    func didImagesCellItemFetch(_ items: [ImageCellViewModel]) {
        myImagesArray = items
        DispatchQueue.main.async {
            self.initCollectionView()
            self.collectionViewHelper?.collectionView?.reloadData()
        }
    }
    
    
}
