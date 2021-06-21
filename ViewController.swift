//
//  ViewController.swift
//  Skærmtimer app
//
//  Created by Elev GF2 on 07/06/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slutTidTextField: UITextField!
    
    @IBOutlet weak var startTidTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var loginTextButton: UIButton!
    
    @IBAction func loginToggleButton(_ sender: UIButton) {
        let start = startTidTextField.text!
        let stop = slutTidTextField.text!
        
        if (!Functions.sanitizeInput(start, stop)) {
            resultLabel.text = "Type a valid time (example: 13:30)"
            return
        }
        let startMinutes = Functions.getMinutesFromTimeString(timeString: start)
        let stopMinutes = Functions.getMinutesFromTimeString(timeString: stop)
        
        // laver 2 konstanter med functionen getMinutesFromTimeString. Functionen splitter to tal med et kolon. Dette vil så være den tid brugeren skriver ind.
        
        let pauseStartMinutes = Functions.getMinutesFromTimeString(timeString: "18:00")
        let pauseStopMinutes = Functions.getMinutesFromTimeString(timeString: "18:30")
        
        // laver igen 2 konstanter med functionen getMinutesFromTimeString. Dette er det der bliver betegnet som pausen
        
        let pauseStart = Functions.clamp(pauseStartMinutes, startMinutes, stopMinutes)
        let pauseStop = Functions.clamp(pauseStopMinutes, startMinutes, stopMinutes)
        
        // laver 2 konstanter
        
        let duration = abs(startMinutes - stopMinutes) - abs(pauseStart - pauseStop)
        
        
        resultLabel.text = Functions.getFormattedStringFromMinutes(minutes: duration)
        
        //bruger getFormattedStringFromMinutes til at definere resultLabel text
    }
    
    
    
    
    
}

