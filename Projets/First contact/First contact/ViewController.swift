//
//  ViewController.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 11/12/2018.
//  Copyright © 2018 m2i. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let library = Library()

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var pagesTextField: UITextField!
    @IBOutlet weak var isbnTextField: UITextField!

    @IBOutlet weak var isDigitalSwitch: UISwitch!
    @IBOutlet weak var isReadSwitch: UISwitch!
    @IBOutlet weak var notationSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    @IBAction func readValueChanged(_ sender: UISwitch) {

        notationSlider.isHidden = !sender.isOn
    }

    @IBAction func save(_ sender: UIButton) {

        guard let author = authorTextField.text, author.count > 0 else { return }
        guard let title = titleTextField.text, title.count > 0 else { return }
        guard let nbPagesString = pagesTextField.text, let nbPagesInt = Int(nbPagesString)  else { return }
        guard let isbn = isbnTextField.text, isbn.count > 0 else { return }

        var note: Float? = nil
        if isReadSwitch.isOn {
            note = notationSlider.value
        }

        let newBook = Book(author: author, title: title, nbOfPages: nbPagesInt, isbn: isbn, isDigital: isDigitalSwitch.isOn, note: note)
        library.add(newBook)
    }
}

