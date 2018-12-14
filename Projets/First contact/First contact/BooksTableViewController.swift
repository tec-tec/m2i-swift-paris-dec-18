//
//  BooksTableViewController.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 13/12/2018.
//  Copyright © 2018 m2i. All rights reserved.
//

import UIKit

class BooksTableViewController: UITableViewController {

    let library = Library.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(forName: Notification.Name("libraryDidChange"), object: library, queue: OperationQueue.main) { (notif) -> Void in
            self.tableView.reloadData()
        }

        DispatchQueue.global(qos: .userInitiated).async {
            for i in 0...3 {
                let newBook = Book(author: "Auteur \(i)", title: "Titre \(Int.random(in: 0...1000))", nbOfPages: 567, isbn: "rtfghjb", isDigital: true, note: nil)
                self.library.add(newBook)
            }

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return library.allBooks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)

        // Configure the cell...
        let allBooks = library.allBooks
        let current = allBooks[indexPath.row]

        cell.textLabel?.text = current.title
        cell.detailTextLabel?.text = current.author

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "displayDetails" {

            guard let cell = sender as? UITableViewCell else { return }
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            let book = library.allBooks[indexPath.row]

            guard let destination = segue.destination as? DetailsViewController else { return }
            destination.title = "Détails d'un livre"
            destination.bookToDisplay = book

        } else if segue.identifier == "displayForm" {
            guard let destination = segue.destination as? UINavigationController else { return }
            destination.viewControllers.last?.title = "Ajouter un livre"
        }
    }


}
