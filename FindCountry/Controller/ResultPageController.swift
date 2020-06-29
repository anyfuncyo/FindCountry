//
//  ResultPageController.swift
//  FindCountry
//
//  Created by Annie Guest on 11/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import UIKit

class ResultPageController: UIViewController {
    
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var capitalName: UILabel!
    @IBOutlet weak var currencyName: UILabel!
    
    var countryManager = CountryManager()
    var countryDataDisplayed = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryName.text = countryDataDisplayed[0]
        capitalName.text = countryDataDisplayed[1]
        currencyName.text = countryDataDisplayed[2]
        view.accessibilityIdentifier = ResultScreen.view
        countryName.accessibilityIdentifier = ResultScreen.label.countryName
        capitalName.accessibilityIdentifier = ResultScreen.label.capital
        currencyName.accessibilityIdentifier = ResultScreen.label.currency
    }
    
}

    

