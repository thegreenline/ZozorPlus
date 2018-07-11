//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    private let calcul = CalculManager() // instance of class CalculModel
    private let manager = ViewControllerManager() // instance of VCManager
    
    // MARK: - Action
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        // spot number in keyPad
        manager.senderTag = sender.tag
        manager.keypadBtn()
    }
    
    @IBAction func plus() {
        // btn plus
        manager.plusBtn()
    }
    
    @IBAction func minus() {
        // btn minus
        manager.minusBtn()
    }
    
    @IBAction func Multiply() {
        // btn multiply
        manager.multiplyBtn()
    }
    
    @IBAction func divide() {
        // btn divide
        manager.divideBtn()
    }
    
    @IBAction func addComma() {
        // btn comma
         manager.addCommaBtn()
    }
    
    @IBAction func equal() {
        // btn equal
        manager.equalBtn()
//        displayTotal() // est ce pertinent ?
    }
    
    @IBAction func AC() {
        // btn reset
        manager.acBtn()
    }
    
    private var isCorrect: Bool {
        // check if all is ok
        // FIXME: repenser la fonction pour l'integer au manager !!!!!!!!!!
        if calcul.checkFirstStep {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            return false
        }
        else if manager._displayNumber == "" && calcul.isFirstStep {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            return false
        }
        else if calcul.checkIfDiviseWithZero {
            let alertVC = UIAlertController(title: "Zero !", message: "Impossible de diviser par 0 !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    private func displayTotal() {
        // display total on screen

        guard isCorrect else { return }
        let total = calcul.getTotal
        textView.text = textView.text + " = \(total)"
    }
    
    private func updateDisplay() {
        // update textView with new content
        
        var text: String
        text = "\(manager._displayNumber)"
        textView.text = text
    }
    
}

