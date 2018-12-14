//
//  Library.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 12/12/2018.
//  Copyright © 2018 m2i. All rights reserved.
//

import Foundation

class Library {

    static let shared = Library()
    private var books: [Book]

    private init() {
        books = []
    }
    var count: Int {
        return books.count
    }
    var allBooks: [Book] {
        return books
    }
    var allAuthors: [String] {
        return books.map({ (currentBook) -> String in
            return currentBook.author
        })
    }
    var allReadBooksTitles: [String] {
        return books.compactMap { (currentBook) -> String? in
            if currentBook.note != nil {
                return currentBook.title
            } else {
                return nil
            }
        }
    }

    var biggestBook: Book? {
        return books.max(by: { (lhs, rhs) -> Bool in
            return lhs.nbOfPages > rhs.nbOfPages
        })

//        let minComparator: (Book, Book) -> Bool = { (lhs, rhs) -> Bool in
//            return lhs.nbOfPages > rhs.nbOfPages
//        }
//
//        books.min(by: minComparator)
    }

    func add(_ book: Book) {
        books.append(book)

        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: Notification.Name("libraryDidChange"), object: self)
    }

    func remove(_ book: Book) {
        if let index = books.firstIndex(of: book) {
            books.remove(at: index)

            let notificationCenter = NotificationCenter.default
            notificationCenter.post(name: Notification.Name("libraryDidChange"), object: self)
        }
    }

    func find(_ searchString: String, in field: SearchField) -> [Book] {

        return books.filter({ (currentBook) -> Bool in
            switch field {
            case .title:
                return currentBook.title.lowercased().contains(searchString.lowercased())
            case .author:
                return currentBook.author.lowercased().contains(searchString.lowercased())
            case .isbn:
                return currentBook.isbn.lowercased().contains(searchString.lowercased())
            }
        })

    }
}

