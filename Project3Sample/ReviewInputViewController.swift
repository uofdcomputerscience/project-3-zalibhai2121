//
//  ReviewInputViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewInputViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var BookTitle: UITextField!
    
    @IBOutlet weak var ReviewerName: UITextField!
    
    @IBOutlet weak var BookReview: UITextField!
    
    let reviewService = ReviewService.shared
    var book = -1
    
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
        _ = navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    func submitReview() {
        let review = Review(id: nil, bookId: book, date: Date(), reviewer: ReviewerName.text!, title: BookTitle.text!, body: BookReview.text!)
        reviewService.createReview(review: review) {
        }
    }

    
}
