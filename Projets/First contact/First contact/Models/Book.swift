//
//  Book.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 12/12/2018.
//  Copyright © 2018 m2i. All rights reserved.
//

import Foundation

struct Book: Equatable, Codable {
    let author: String
    let title: String
    let nbOfPages: Int
    let isbn: String
    let isDigital: Bool
    var note: Float?

    var id: Int?

// La fonction == n'est plus indispensable si l'équalité du type correspond à la stricte égalité des membres et que les membres sont eux-même Equatable

//    static func == (lhs: Book, rhs: Book) -> Bool {
//        if lhs.author == rhs.author && lhs.title == rhs.title && lhs.nbOfPages == rhs.nbOfPages {
//            return true
//        } else {
//            return false
//        }
//    }
}
