//
//  ViewController.swift
//  FlagsOfTheWorld
//
//  Created by Cory Steers on 3/8/18.
//  Copyright © 2018 Cory Steers. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    var flags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Flag Viewer"


        setFlags()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Image", for: indexPath)
        if let imageCell = cell as? ImageCell {
            imageCell.flagImage.image = UIImage(named: flags[indexPath.row])
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = flags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    private func setFlags() {
        flags.append("estonia")
        flags.append("france")
        flags.append("germany")
        flags.append("ireland")
        flags.append("italy")
        flags.append("monaco")
        flags.append("nigeria")
        flags.append("poland")
        flags.append("russia")
        flags.append("spain")
        flags.append("uk")
        flags.append("us")
    }
}

