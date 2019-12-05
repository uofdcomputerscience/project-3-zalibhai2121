//
//  ReviewDetailViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewDetailViewController: UIViewController {
    var Book = "Book: "
    var Title = "Title: "
    var Reviewer = "Reviewer: "
    var Body = ""
    
    @IBOutlet weak var BookName: UILabel!
    @IBOutlet weak var BookReviewTitle: UILabel!
    @IBOutlet weak var ReviewerName: UILabel!
    @IBOutlet weak var ReviewBody: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BookName.text = Book
        BookReviewTitle.text = Title
        ReviewerName.text = Reviewer
        ReviewBody.text = Body
    }
    
    
}
