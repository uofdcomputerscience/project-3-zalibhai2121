//
//  Book.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import Foundation

struct Book: Codable {
    let id: Int?
    let title: String
    let author: String
    let published: String
    let imageURLString: String
    
    var imageURL: URL? {
        return URL(string: imageURLString ?? "http://www.4motiondarlington.org/wp-content/uploads/2013/06/No-image-found.jpg")
    }
}
