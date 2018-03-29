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
    @IBOutlet weak var guessLabel: UITextField!
    @IBOutlet weak var guessedLettersLabel: UITextField!

    var guessedLetters = "" { didSet { guessedLettersLabel.text = guessedLetters } }
    var wordToGuess = "RHYTHM"
    var numberOfBadGuesses = 0 { didSet { hangManLabel.text = hangManGraphic[numberOfBadGuesses] } }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLetterButtons()

        hangManLabel.text = hangManGraphic[numberOfBadGuesses]

//        guessLabel.text = "_ _ _ _ _ _"
        presentGuess()

//        for hangMan in hangManGraphic {
//            hangManLabel.text = hangMan

//            let ac = UIAlertController(title: "whatevs", message: nil, preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "OK", style: .default))
//            view.addSubview(ac.view)
//            present(ac, animated: true)
//        }
    }

    private func checkForMatching(pressed letter: String) {
        if wordToGuess.contains(letter) {
            var newUnderscores = ""
            for letterToCheck in wordToGuess {
                newUnderscores += (String(letterToCheck) == letter) ? letter : "_"
            }
            guessLabel.text = newUnderscores
            guessLabel.addCharacterSpacing()
        } else {
            numberOfBadGuesses += 1
            hangManLabel.text = hangManGraphic[numberOfBadGuesses]
        }

        guessedLetters += letter
    }

    private func presentGuess() {
//        let guessLength: Int = wordToGuess.count
        var underscores = ""

        for _ in wordToGuess {
            underscores += "_"
        }
        guessLabel.text = underscores
        guessLabel.addCharacterSpacing()
    }

    private func configureLetterButtons() {
        for subview in view.subviews where subview.tag == letterButtonTag {
            let button = subview as! UIButton
            button.addTarget(self, action: #selector(letterButtonPressed), for: .touchUpInside)
        }
    }

    @objc private func letterButtonPressed(button: UIButton) {
        if let letter = button.titleLabel?.text {
            if guessedLetters.contains(letter) { return }
            checkForMatching(pressed: letter)
        }
    }
}

