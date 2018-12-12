//
//  Library.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 12/12/2018.
//  Copyright © 2018 m2i. All rights reserved.
//

import Foundation

class Library {
    private var books: [Book] = []
    var count: Int {
        return books.count
    }
    var allBooks: [Book] {
        return books
    }

    func add(_ book: Book) {
        books.append(book)
    }

    func remove(_ book: Book) {
        if let index = books.firstIndex(of: book) {
            books.remove(at: index)
        }
    }

    func find(_ searchString: String, in field: SearchField) -> [Book] {
        #warning("To fix")
        return []
    }
}

