//
//  BookListViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController {
    
    @IBOutlet weak var Books: UITableView!
    
    let bookService = BookService.shared
        
        
    override func viewDidLoad() {
        //Books.dataSource = self
            
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        Books.refreshControl = refreshControl
        fetchBooks()
           
        }


        
    func fetchBooks() {
        bookService.fetchBooks { [weak self] in
            DispatchQueue.main.async {
                self?.Books.reloadData()
        }
    }
}
    @objc func refresh(_ refreshControl: UIRefreshControl){
        bookService.fetchBooks { [weak self] in
            DispatchQueue.main.async {
                self?.Books.reloadData()
                refreshControl.endRefreshing()
              }
            
              }
        }
    }

//    extension BookListViewController: UITableViewDataSource {
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return bookService.books.count
//        }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//        let cell = Books.dequeueReusableCell(withIdentifier:"BookDetailViewController")!
//        let book = bookService.books[indexPath.item]
//        let bookName = book.title
//
//        if let Info = cell as? BookCell{
//            Info.book = book
//            bookService.image(for: book) { (getbook, image) in
//                if Info.book?.id == getbook.id {
//                    DispatchQueue.main.async {
//                        info.BookImage.image = image
//                        info.BookTitle.text = bookName
//                    }
//                }
//            }
//}
//            return cell
//
//        }
//    }
