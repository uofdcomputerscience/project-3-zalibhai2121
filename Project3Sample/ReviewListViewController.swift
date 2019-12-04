//
//  ReviewListViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewListViewController: UIViewController {
    
    let reviewService = ReviewService.shared
    
    func fetchReviews() {
        reviewService.fetchReviews { [weak self] in
            print(String(describing: self?.reviewService.reviews))
        }
    }
    
}
