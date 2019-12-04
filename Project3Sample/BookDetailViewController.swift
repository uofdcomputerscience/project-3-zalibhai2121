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
    @IBOutlet weak var BookName: UILabel!
    @IBOutlet weak var BookArthor: UILabel!
    @IBOutlet weak var BookPublished: UILabel!
    
    @IBOutlet weak var Continue: UIButton!
    
    var book: Book?
    var bookService: BookService?
       
    var bookTitle: String?
    override func viewDidLoad() {
        BookName.text = book?.title
        BookArthor.text = book?.author
        BookPublished.text = book?.published
           
        bookService!.image(for: book!) { (getbook, image) in
            if self.book!.id == getbook.id {
                DispatchQueue.main.async {
                    self.BookImage.image = image
                   }
               }
           }
           
           
       }
}

