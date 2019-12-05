//
//  BookInputViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookInputViewController: UIViewController, UITextFieldDelegate {
    
    let bookService = BookService.shared
    @IBOutlet weak var BookTitle: UITextField!
    @IBOutlet weak var Author: UITextField!
    @IBOutlet weak var PublishedYear: UITextField!
    @IBOutlet weak var ImageURL: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BookTitle.text = ""
        Author.text = ""
        PublishedYear.text = ""
        ImageURL.text = ""
        
        self.BookTitle.delegate = self
        self.Author.delegate = self
        self.PublishedYear.delegate = self
        self.ImageURL.delegate = self
    }
    
    @IBAction func ButtonTapped(_ sender: Any) {
        submitBook()
        _ = navigationController?.popViewController(animated: true)
        
    }
    func submitBook() {
        let book = Book(id: nil, title: BookTitle.text!, author: Author.text!, published: PublishedYear.text!, imageURLString: ImageURL.text!)
        bookService.createBook(book: book) {
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
