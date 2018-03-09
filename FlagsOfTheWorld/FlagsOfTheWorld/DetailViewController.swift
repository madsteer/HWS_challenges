//
//  DetailViewController.swift
//  FlagsOfTheWorld
//
//  Created by Cory Steers on 3/8/18.
//  Copyright © 2018 Cory Steers. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        title = selectedImage

        if let imageToload = selectedImage {
            imageView.image = UIImage(named: imageToload)
            imageView.contentMode = .scaleAspectFit
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return navigationController!.hidesBarsOnTap
    }
}
