//
//  ViewController.swift
//  Tipsy
//
//  Created by Jakub Korkosz on 19/06/2021.
//  Copyright © 2021 Jakub Korkosz. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
    var calculatorBrain = CalculatorBrain()

    @IBAction func tipChanged(_ sender: UIButton) {
        
        //deselecting all of the buttons
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        //selecting propper button
        sender.isSelected = true
        
        //extracting the tip value
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Float(buttonTitleMinusPercentSign)!
        calculatorBrain.tip = buttonTitleAsANumber / 100
        
        //taking total bill typed by user as string
        let billAmount = billTextField.text!
        calculatorBrain.totalBill = Float(billAmount) ?? 0
        
        //hiding the keyboard
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        //getting number of people to split from stepper
        calculatorBrain.peopleToSplit = Int(sender.value)
        
        //changing the text near the stepper
        splitNumberLabel.text = String(calculatorBrain.peopleToSplit)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(calculatorBrain.calculateResult())
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = calculatorBrain.calculateResult()
            destinationVC.tip = calculatorBrain.tip
            destinationVC.numberOfPeople = calculatorBrain.peopleToSplit
        }
    }
    
}

