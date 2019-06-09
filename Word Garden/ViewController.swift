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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    @IBAction func guessLetterFieldChanged(_ sender: UITextField) {
        print("Guessed Letter Field changed!")
    }
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        updateUIAfterGuess()
    }
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        updateUIAfterGuess()
    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
}

