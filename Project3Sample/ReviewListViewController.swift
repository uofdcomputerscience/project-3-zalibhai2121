//
//  ReviewListViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewListViewController: UIViewController {
    @IBOutlet weak var ReviewList: UITableView!
    
    var Book:String = "Book: "
    var Title:String = "Title: "
    var ReviewerName:String = "Name: "
    var Body: String = ""
    
    let reviewService = ReviewService.shared
    let bookService = BookService.shared
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ReviewList.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.ReviewList.dataSource = self
        self.ReviewList.delegate = self
        ReviewList.refreshControl = refreshControl
        fetchBooks()
        fetchReviews()
    }
    
    func fetchBooks() {
        bookService.fetchBooks { [weak self] in
            DispatchQueue.main.async {
                self?.ReviewList.reloadData()
            }
        }
    }
    
    func fetchReviews() {
        reviewService.fetchReviews { [weak self] in
            DispatchQueue.main.async {
                self?.ReviewList.reloadData()
            }
    }
        
}
    @objc func refresh(_ refreshControl: UIRefreshControl){
      bookService.fetchBooks { [weak self] in
              DispatchQueue.main.async {
                  self?.ReviewList.reloadData()
                  refreshControl.endRefreshing()
        }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let review = reviewService.reviews[indexPath.item]
           Book =  "Book: " + bookService.books[review.bookId].title
           Title = "Title: " +  review.title
           ReviewerName = "Name: " + review.reviewer
           Body = "" + review.body
           performSegue(withIdentifier: "ReviewList", sender: self)
       }
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReviewList" {
            if let review = segue.destination as? ReviewDetailViewController {
                review.Title = Book
                review.Title = Title
                review.ReviewerNames = ReviewerName
                review.Body = Body
               }
           }
       }
    }
extension ReviewListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewService.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewBookCell", for: indexPath)
            if let ReviewCell = cell as? ReviewBookCell{
                let review = reviewService.reviews[indexPath.item]
                ReviewCell.BookTitle.text =  bookService.books[review.bookId].title
                ReviewCell.ReviewTitle.text =  review.title
                ReviewCell.ReviewerName.text =  review.reviewer

            }
            
            return cell
        }
    
    
}

extension ReviewListViewController: UITableViewDelegate {
    
}
