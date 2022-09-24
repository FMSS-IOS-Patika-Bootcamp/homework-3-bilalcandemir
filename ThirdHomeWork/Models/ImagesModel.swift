//
//  ImagesModel.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/21/22.
//

import Foundation

protocol ImagesViewModelProtocol:AnyObject {
    func didImageFetchProccessFinished(_ isSuccess:Bool)
}

class ImagesModel {
    var networkManager = NetworkManager()
    typealias ImagesComplationClosure = (([Images]?, Error?) -> Void)
    
    func fetchImageData(complation: ImagesComplationClosure?){
        networkManager.fetchData(url: "https://jsonplaceholder.typicode.com/photos", complation: complation)
    }
}
