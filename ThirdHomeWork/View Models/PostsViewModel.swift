//
//  PostsViewModel.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/18/22.
//

import Foundation

// Kinda wrong approach to send data to view controller but this protocol doing this job.
protocol PostsViewDelegate: AnyObject {
    func didCellItemFetch(_ items: [PostsCellViewModel])
}

class PostsViewModel {
    
    weak var viewDelegate:PostsViewDelegate?
    var postsModel = PostsModel()
    var postsArray:[PostsCellViewModel] = []
    
    // This function call the PostsModel and make request with network manager
    func genericDataFetch(){
        postsModel.fetchData { [weak self] (posts, error) in
            guard let self = self else {
                return
            }
            guard let posts = posts else {
                return
            }
            // Send to genericDataBaseModel function for increase the data which we used in cells for show data.
            self.postsArray = self.GenericDataBaseModel(posts: posts)
            // Feedback to view controller to reload table view.
            self.didFetchProccessFinished(true)
        }
    }
    
    // Increase data with high order function map.
    func GenericDataBaseModel(posts:[Posts]) -> [PostsCellViewModel]{
        return posts.map{ .init(title: $0.title, description: $0.body)}
    }
}

extension PostsViewModel:PostsViewModelProtocol {
    // Send data to view controller this is also little bit wrong.
    func didFetchProccessFinished(_ isSuccess: Bool) {
        if isSuccess {
            viewDelegate?.didCellItemFetch(postsArray)
        }
        else {
        }
    }
}
