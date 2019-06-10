//
//  ViewController.swift
//  Word Garden
//
//  Created by Kelly Slimmon on 6/8/19.
//  Copyright © 2019 Kelly Slimmon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var flowerImageView: UIImageView!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
    }
    
    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    func formatUserGuessLabel(){
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        for letter in wordToGuess{
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + " \(letter)"
                print(revealedWord)
            } else {
                revealedWord = revealedWord + " _"
            }
        }
        
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    func guessALetter(){
        formatUserGuessLabel()
        guessCount += 1
        
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed){
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            print(wrongGuessesRemaining)
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        
        let revealedWord = userGuessLabel.text!
        if wrongGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessedLetterField.isEnabled = false
            guessCountLabel.text = "So sorry, you're all out of guesses. Try again?"
        } else if !(revealedWord.contains("_")) {
            // You won
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessedLetterField.isEnabled = false
            guessCountLabel.text = "You got it! It took you \(guessCount) guesses to find the word"
        } else {
            let guess = (guessCount == 1 ? "guess" : "guesses")
            guessCountLabel.text = "You've made \(guessCount) \(guess)"
        }
    }
    
    @IBAction func guessLetterFieldChanged(_ sender: UITextField) {
        print("Guessed Letter Field changed!")
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = String(letterGuessed)
            guessLetterButton.isEnabled = true
        } else {
             // disable the button if no characters are entered in guessLetterField
            guessLetterButton.isEnabled = false
        }
    }
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        print("guessed a letter")
        updateUIAfterGuess()
    }
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        guessALetter()
        print("different")
        updateUIAfterGuess()
    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessedLetterField.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've made 0 guesses."
        guessCount = 0
    }
}

