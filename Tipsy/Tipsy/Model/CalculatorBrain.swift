//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Jakub Korkosz on 19/06/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain{
    var tip : Float = 0.1
    var peopleToSplit : Int = 2
    var totalBill : Float = 0
    var result: Float = 0.0
    
    func calculateResult()->Float{
        return (totalBill + totalBill*tip)/Float(peopleToSplit)
    }
}
