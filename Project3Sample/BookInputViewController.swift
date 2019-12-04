//
//  BookInputViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookInputViewController: UIViewController {
    
    @IBOutlet weak var BookNameInput: UITextField!
    @IBOutlet weak var BookArthurInput: UITextField!
    @IBOutlet weak var BookPublishedInput: UITextField!
    @IBOutlet weak var BookImageURL: UITextField!
    @IBOutlet weak var Submit: UIButton!
    
    let bookService = BookService.shared
    override func viewDidLoad() {
        BookNameInput.delegate = self
        BookArthurInput.delegate = self
        BookPublishedInput.delegate = self
        BookImageURL.delegate = self
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
            view.addGestureRecognizer(tap)
            super.viewDidLoad()
        }
        
    @IBAction func sumbitReview(_ sender: Any) {
        let title = BookNameInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let author = BookArthurInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let published = BookPublishedInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let imageURL = BookImageURL.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let book = Book(id: nil, title: title, author: author, published: published, imageURLString: imageURL)
            bookService.createBook(book: book) {
                      print("book created")
            }
            self.dismiss(animated: true)
        }
        
    func allFieldsFilledIn() -> Bool{
        return !BookNameInput.text!.isEmpty && !BookArthurInput.text!.isEmpty && !BookPublishedInput.text!.isEmpty && !BookImageURL.text!.isEmpty
        }
    }

    extension BookInputViewController: UITextFieldDelegate{
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == BookNameInput {
                 BookArthurInput.becomeFirstResponder()
             }
            if textField == BookArthurInput {
                BookPublishedInput.becomeFirstResponder()
            }
            if textField == BookPublishedInput {
                BookImageURL.becomeFirstResponder()
                
            }
            if textField == BookImageURL {
                BookImageURL.resignFirstResponder()
            }
             return true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            Submit.isEnabled = allFieldsFilledIn()
        }
    }
