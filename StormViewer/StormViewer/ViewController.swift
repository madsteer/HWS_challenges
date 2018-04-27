//
//  ViewController.swift
//  Project1
//
//  Created by Cory Steers on 2/19/18.
//  Copyright © 2018 Cory Steers. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    var pictures = [String]()
//    var storms = [Storm]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Storm Viewer"

        getPictures()
    }

    private func getPictures() {
        pictures.append("nssl0033")
        pictures.append("nssl0034")
        pictures.append("nssl0041")
        pictures.append("nssl0042")
        pictures.append("nssl0043")
        pictures.append("nssl0045")
        pictures.append("nssl0046")
        pictures.append("nssl0049")
        pictures.append("nssl0051")
        pictures.append("nssl0091")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Storm", for: indexPath) as! StormCell
        cell.name?.text = pictures[indexPath.item]

        cell.imageView?.image = UIImage(named: pictures[indexPath.item])
        cell.imageView?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7

        return cell
    }
}

