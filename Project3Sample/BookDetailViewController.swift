//
//  BookDetailViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var BookImage: UIImageView!
    @IBOutlet weak var Arthur: UILabel!
    @IBOutlet weak var PublishedYear: UILabel!
    @IBOutlet weak var BookTitle: UILabel!
    @IBOutlet weak var AddReview: UIButton!
    
    
    let bookService = BookService.shared
    var Title: String?
    var Author: String?
    var Published: String?
    var Id = -1
    var Image = UIImage(named: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BookTitle.text = Title
        Arthur.text = Author
        PublishedYear.text = Published
        BookImage.image = Image
        
    }
}

