//
//  PostData.swift
//  H4XOR News
//
//  Created by Hodaya Rosenberg on 11/22/22.
//

import UIKit
struct PostData:Decodable{
    let hits : [Post]
}
struct Post:Decodable,Identifiable{
    var id : String { return objectID}
    let objectID:String
    let points:Int
    let title:String
    let url:String?
    
}
