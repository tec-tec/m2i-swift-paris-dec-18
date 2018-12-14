//
//  DetailsViewController.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 14/12/2018.
//  Copyright © 2018 m2i. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    var bookToDisplay: Book?

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = bookToDisplay?.title
    }
}
