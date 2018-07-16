//
//  AlertPopup.swift
//  CountOnMe
//
//  Created by Nicolas Bachur on 15/07/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import UIKit

struct AlertVC {
    // prototype of an alerteVC
   private static func showAlert(on vc: UIViewController, with title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        vc.present(alertVC, animated: true, completion: nil)
    }
    static func alertStartNewCalc(on vc: UIViewController) {
//        codeErreur == 1
        showAlert(on: vc, with: "Zéro !", message: "Démarrez un nouveau calcul !")
    }
    static func alertWrongExpression(on vc: UIViewController) {
//        codeErreur == 2
        showAlert(on: vc, with: "Zero !", message: "Entrez une expression correcte !")
    }
    static func alertCanDivideWithZero(on vc: UIViewController) {
//        codeErreur == 3
        showAlert(on: vc, with: "Zero !", message: "Impossible de diviser par 0 !")
    }

}
