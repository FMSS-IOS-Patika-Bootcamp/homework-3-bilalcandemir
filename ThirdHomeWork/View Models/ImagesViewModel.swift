//
//  ImagesViewModel.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/21/22.
//

import Foundation

// This protocol send the data to view controller
protocol ImagesViewDelegate: AnyObject {
    func didImagesCellItemFetch(_ items: [ImageCellViewModel])
}

class ImagesViewModel {
    
    var imagesViewDelegate:ImagesViewDelegate?
    var imagesModel = ImagesModel()
    
    var imagesArray:[ImageCellViewModel] = []
    
    // Data will fetch from images model class using network helper
    func imagesDataFetch(){
        imagesModel.fetchImageData { [weak self] images, error in
            guard let self = self else {
                return
            }
            guard let images = images else {
                return
            }
            // Change the items with only url data
            self.imagesArray = self.imageDataBaseModel(images: images)
            self.didImageFetchProccessFinished(true)
        }
    }
    
    func imageDataBaseModel(images:[Images]) -> [ImageCellViewModel]{
        return images.map{.init(url: $0.url)}
    }
}

// Send data to view controller using this function
extension ImagesViewModel:ImagesViewModelProtocol {
    func didImageFetchProccessFinished(_ isSuccess: Bool) {
        if isSuccess {
            imagesViewDelegate?.didImagesCellItemFetch(imagesArray)
        }
        else {
            
        }
    }
    
    
}
