//
//  SearchPageController.swift
//  FindCountry
//
//  Created by Annie Guest on 10/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import UIKit

class SearchPageController: UIViewController {
    
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    var countryDataReceived = [""]
    var countryManager = CountryManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTextField.delegate = self
        countryManager.countryManagerDelegate = self
        self.navigationItem.setHidesBackButton(true, animated: true);
        view.accessibilityIdentifier = SearchScreen.view
        countryTextField.accessibilityIdentifier = SearchScreen.textField.input
        searchButton.accessibilityIdentifier = SearchScreen.button.search
    }
    
}

//MARK: - Country TextField

extension SearchPageController: UITextFieldDelegate {
    
    @IBAction func goToResult(_ sender: UIButton) {
        countryTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        countryTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            guard checkInputText(textField.text!) else {
                textField.text = ""
                textField.placeholder = "Please put down a valid country name"
                return false
            }
            return true
            
        }else{
            textField.placeholder = "Please put down a country name"
            return false
        }
    }
    
    func checkInputText(_ text: String) -> Bool{
        let textInputRegEx = "^[A-Za-z0-9]{1,20}$"
        let trimmedString = text.trimmed()
        let validateTextInput = NSPredicate(format: "SELF MATCHES %@", textInputRegEx)
        let isValideTextInput = validateTextInput.evaluate(with: trimmedString)
        return isValideTextInput
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let country = countryTextField.text {
            countryManager.fetchCountry(countrySelected: country)
        }
        countryTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultPageController
        destinationVC.countryDataDisplayed = countryDataReceived
        
    }
}

//MARK: - CountryManagerDelegate

extension SearchPageController: CountryManagerDelegate {
    
    func getCountryInfo(_ countryManageer: CountryManager, countryModel: CountryModel) {
        countryDataReceived = [countryModel.countryName, countryModel.countryCapital, countryModel.countryCurrency]
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "showResult", sender: self)
        }
    }
    
    func requestError(error: Error, response: URLResponse?) {
        
        if let httpResponse = response as? HTTPURLResponse {
            let responseCode = httpResponse.statusCode
            print(responseCode)
            
            if responseCode == 401 {
                showAlert(alertTitle: "Unauthorized Request", buttonTitle: "Close")
            }else{
                showAlert(alertTitle: "Result not found", buttonTitle: "Close")
            }
            
        }
        
    }
    
    func showAlert(alertTitle: String, buttonTitle: String){
        let alert = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: buttonTitle, style: .cancel, handler: nil)
        DispatchQueue.main.async {
            alert.addAction(alertAction)
            self.present(alert, animated: true)
        }
    }
    
}
