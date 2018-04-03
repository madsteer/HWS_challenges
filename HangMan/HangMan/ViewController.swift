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

        presentChallenge()
    }

    private func presentChallenge() {
        numberOfBadGuesses = 0
        guessedLetters = ""

        configureLetterButtons()

        hangManLabel.text = hangManGraphic[numberOfBadGuesses]

        var underscores = ""

        for _ in wordToGuess {
            underscores += "_"
        }
        guessLabel.text = underscores
        guessLabel.addCharacterSpacing()
    }

    private func checkForMatching(pressed letter: String) {
        if wordToGuess.contains(letter) {
            var newUnderscores = ""
            guard let currentGuess = guessLabel.text else { return }
            for index in wordToGuess.indices {
                if String(wordToGuess[index]) == letter {
                    newUnderscores += letter
                } else {
                    let currentGuessLetter = currentGuess[index]
                    newUnderscores += currentGuessLetter != "_" ? String(currentGuessLetter) : "_"
                }
            }
            guessLabel.text = newUnderscores
            guessLabel.addCharacterSpacing()
        } else {
            numberOfBadGuesses += 1
            hangManLabel.text = hangManGraphic[numberOfBadGuesses]
        }

        guessedLetters += letter

        if let guessText = guessLabel.text,
            !guessText.contains("_") {
            endGame(with: "You Win", and: "Great job Partner!")
        }

        if numberOfBadGuesses > 6 {
            endGame(with: "You Lose", and: "Ya done got hanged!")
        }
    }

    private func endGame(with title: String, and message: String) {
        let ac = UIAlertController(title: title, message: message + " Would you like to play again?", preferredStyle: .alert)
        ac.addAction(okAction())
        present(ac, animated: true)
    }

    private func okAction() -> UIAlertAction {
        let action = UIAlertAction(title: "OK", style: .default) { [unowned self] _ in
            self.presentChallenge()
        }
        return action
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

