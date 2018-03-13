//
//  ViewController.swift
//  HangMan
//
//  Created by Cory Steers on 3/12/18.
//  Copyright © 2018 Cory Steers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var hangManLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        hangManLabel.text = hangManGraphic[7]
//        for hangMan in hangManGraphic {
//            hangManLabel.text = hangMan

//            let ac = UIAlertController(title: "whatevs", message: nil, preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "OK", style: .default))
//            view.addSubview(ac.view)
//            present(ac, animated: true)
//        }
    }

}

