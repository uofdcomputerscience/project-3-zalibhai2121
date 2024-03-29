//
//  ReviewInputViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewInputViewController: UIViewController {
    
    @IBOutlet weak var BookTitle: UITextField!
    
    @IBOutlet weak var ReviewerName: UITextField!
    
    @IBOutlet weak var BookReview: UITextField!
    
    let reviewService = ReviewService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BookTitle.text = ""
        ReviewerName.text = ""
        BookReview.text = ""
        
        self.BookTitle.delegate = self
        self.ReviewerName.delegate = self
        self.BookReview.delegate = self
    }
    @IBAction func ButtonPressed(_ sender: Any) {
        submitReview()
    }
    
    func submitReview() {
        let review = Review(id: nil, bookId: -1, date: nil, reviewer: ReviewerName.text!, title: BookTitle.text!, body: BookReview.text!)
        reviewService.createReview(review: review) {
        }
    }

    
}
extension ReviewInputViewController: UITextFieldDelegate {
    
}
