//
//  PostsModel.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/20/22.
//

import Foundation

protocol PostsViewModelProtocol:AnyObject {
    func didFetchProccessFinished(_ isSuccess:Bool)
}

class PostsModel {
    
    // Define the closure for use inside of network process
    typealias PostsComplationClosure = (([Posts]?, Error?) -> Void)
    
    var networkManager = NetworkManager()
    
    // Send url to network manager
    func fetchData(complation: PostsComplationClosure?){
        networkManager.fetchData(url: "https://jsonplaceholder.typicode.com/posts", complation: complation)
    }
}

