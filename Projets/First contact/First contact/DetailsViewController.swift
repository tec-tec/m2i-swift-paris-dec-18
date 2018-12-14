//
//  DetailsViewController.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 14/12/2018.
//  Copyright © 2018 m2i. All rights reserved.
//

import UIKit
import CoreLocation

class DetailsViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    var bookToDisplay: Book?

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = bookToDisplay?.title
        requestImage()
        requestWebservice()
    }

    func requestImage() {
        let url = URL(string: "https://developer.apple.com/assets/elements/icons/core-ml/core-ml-256x256_2x.png")!

        let sharedSession = URLSession.shared
        let imageTask = sharedSession.dataTask(with: url) { (data, response, error) in

            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                    print("terminé")
                }
            }
        }
        imageTask.resume()
    }

    func requestWebservice() {
        let url = URL(string: "http://localhost:8080/books")!

        let sharedSession = URLSession.shared
        let task = sharedSession.dataTask(with: url) { (data, response, error) in
            if let data = data, let json = String(data: data, encoding: .utf8) {

                let jsonDecoder = JSONDecoder()
                if let books = try? jsonDecoder.decode([Book].self, from: data) {
                    for book in books {
                        Library.shared.add(book)
                    }
                }

                print(json)
            }
        }
        task.resume()
        print("test")
    }

    func requestLocation() {

        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.startUpdatingLocation()
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

    }
}
