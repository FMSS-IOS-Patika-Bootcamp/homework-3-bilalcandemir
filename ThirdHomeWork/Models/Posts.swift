//
//  Posts.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/18/22.
//

import Foundation

// Posts Model type which we need to show in screens
struct PostsCellViewModel {
    let title:String
    let description:String
}

// Posts Decodable model which come from api
struct Posts:Decodable {
    let userId:Int?
    let id:Int?
    let title:String
    let body:String
}
