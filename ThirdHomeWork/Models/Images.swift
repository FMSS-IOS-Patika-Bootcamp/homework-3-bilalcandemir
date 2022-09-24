//
//  Images.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/21/22.
//

import Foundation

// Images Decodable model which come from api
struct Images:Decodable {
    let albumId:Int
    let id:Int
    let title:String
    let url:String
    let thumbnailUrl:String
}

struct ImageCellViewModel {
    let url:String
}
