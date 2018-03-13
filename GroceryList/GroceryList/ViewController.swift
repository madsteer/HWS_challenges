//
//  ViewController.swift
//  GroceryList
//
//  Created by Cory Steers on 3/12/18.
//  Copyright © 2018 Cory Steers. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var groceryList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self,
                                                            action: #selector(promptForAnswer))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self,
                                                            action: #selector(shareList))

        title = "Grocery List"
        tableView.reloadData()
    }

    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Add Item to List", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned self, ac] _ in
            let answer = ac.textFields![0]
            self.groceryList.append(answer.text!)
            self.tableView.reloadData()
        }

        ac.addAction(submitAction)
        present(ac, animated: true)
    }

    @objc func shareList() {
        let shoppingList = groceryList.joined(separator: "\n")
        let vc = UIActivityViewController(activityItems: [shoppingList], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = groceryList[indexPath.item]
        return cell
    }
}

