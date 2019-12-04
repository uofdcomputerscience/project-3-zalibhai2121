//
//  BookCell.swift
//  Project3Sample
//
//  Created by Zainab Alibhai on 12/3/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet weak var BookTitle: UILabel!
    @IBOutlet weak var BookImage: UIImageView!
    
    func config (book: Book, service: BookService) {
        self.BookTitle.text = book.title
        setImage (book: book, service: service)
    }
    
    func setImage(book: Book, service: BookService) {
        service.image(for: book) { (getbook, image) in
            if book.id == getbook.id {
                DispatchQueue.main.async {
                    self.BookImage.image = image
                }
            }
        }
    }

}
