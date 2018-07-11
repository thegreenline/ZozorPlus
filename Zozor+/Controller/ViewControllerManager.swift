//
//  ViewControllerManager.swift
//  CountOnMe
//
//  Created by Nicolas on 11/07/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewControllerManager {
    
    var isTapNumber = false
    var sender: UIButton?
    private let calcul = CalculManager() // instance of class CalculModel
    private var _displayNumber: String = ""

    var needToClear: Bool {
        // refactor check if operator is present at the end of calcul
        
        if calcul.getOperator == "" && calcul.isEnded {
            return true
        } else {
            return false
        }
    }
    
    func tapBtn() {
        if needToClear {
            calcul.clear()
        }
        calcul.isEnded = false
        _displayNumber = _displayNumber + String(sender!.tag)
        calcul.addCurrentNumber(sender!.tag)
//        updateDisplay()
        isTapNumber = false
    }
    
}
