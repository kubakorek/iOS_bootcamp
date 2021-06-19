//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jakub Korkosz on 19/06/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tip : Float?
    var numberOfPeople : Int?
    var result : Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(result != nil){
        totalLabel.text = String(format: "%.2f", result!)
        }
        if tip != nil && numberOfPeople != nil {
            settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tip!*100)% tip."
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
