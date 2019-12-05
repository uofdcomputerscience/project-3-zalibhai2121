//
//  BookListViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController, UICollectionViewDelegate{
    
    @IBOutlet weak var BookList: UICollectionView!
    
    let bookService = BookService.shared
    let refreshControl = UIRefreshControl()
    var Title: String?
    var Author: String?
    var Published: String?
    var Id = -1
    var Image = UIImage(named: "noImg.jpg")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.BookList.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        self.BookList.dataSource = self
        BookList.delegate = self
        BookList.refreshControl = refreshControl
        getBooks()
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let book = bookService.books[indexPath.item]
            let cell = collectionView.cellForItem(at: indexPath)
            Title = "Title: " + book.title
            Author = "Author: " + book.author
            Published = "Published: " + book.published
            if book.id != nil {
                Id = book.id!
            }
            if let viewImage = cell as? BookCell{
                Image = viewImage.BookImage.image
            }

            performSegue(withIdentifier: "BookList", sender: self)
        }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BookList" {
            if let book = segue.destination as? BookDetailViewController {
                book.Title = Title
                book.Author = Author
                book.Published = Published
                book.Image = Image
                book.Id = Id
            }
        }
    }
    
    func getBooks() {
           bookService.fetchBooks { [weak self] in
               self?.setImage()
           }
       }
    func setImage() {
        let book = bookService.books.first!
        bookService.image(for: book) { [weak self] (retrievedBook, image) in
            if book.id == retrievedBook.id {
                DispatchQueue.main.async {
                    self?.BookList.reloadData()
                }
            }
        }
    }
    @objc func refresh(_ refreshControl: UIRefreshControl){
         bookService.fetchBooks { [weak self] in
                 DispatchQueue.main.async {
                     self?.BookList.reloadData()
                     refreshControl.endRefreshing()
           }
           }
       }
    
    }

extension BookListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookService.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath)
        if let viewImage = cell as? BookCell{
                bookService.image(for: bookService.books[indexPath.item]) { (retrievedBook, image) in
                    if self.bookService.books[indexPath.item].id == retrievedBook.id{
                        DispatchQueue.main.async {
                            viewImage.BookImage.image = image
                            if(viewImage.BookImage.image == nil){
                                viewImage.BookImage.image = UIImage(named: "noImg.jpg")
                            }
                        }
                    }
                }
            }
            return cell
        }
    
    
}
