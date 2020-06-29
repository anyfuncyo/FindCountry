//
//  CountryManager.swift
//  FindCountry
//
//  Created by Annie Guest on 11/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import Foundation
import ObjectMapper

protocol CountryManagerDelegate {
    func getCountryInfo(_ countryManageer: CountryManager, countryModel: CountryModel)
    func requestError(error: Error, response: URLResponse?)
}

struct CountryManager {
    
    var countryManagerDelegate: CountryManagerDelegate?
    
    //Request Headers (for passing secret keys)
    let headers = [
        "x-rapidapi-host": "restcountries-v1.p.rapidapi.com",
        "x-rapidapi-key": "2fb8f07aa2msh0b838582a5e2254p1b19cbjsn1a9271794cb1"
    ]
    
    //Get environment URL
    var configService = ConfigService(configEnv: ConfigHelper.configEnv)
    
    
    func fetchCountry(countrySelected: String){
        
        guard let apiURL = configService.apiUrl else {
            let error = NSError(domain: "APIUrlNotSet", code: 0, userInfo: nil)
            print(error)
            fatalError("url not set")
        }
        
        let countryNameNoSpace = countrySelected.removeWhitespace()
        let url = "\(apiURL)\(countryNameNoSpace)"
        
        
        let urlString = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        
        fetchCountryRequest(request: urlString)
    }
    
    
    func fetchCountryRequest(request: NSMutableURLRequest)  {
        //Set request headers
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        //Create URLSession
        let session = URLSession.shared
        //Create task
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                
                self.countryManagerDelegate?.requestError(error: error!, response: response!)
                return
            }
            
            
            if let safeData = data {
                if let countryInfo = self.parseJson(data: safeData, response: response!){
                    self.countryManagerDelegate?.getCountryInfo(self, countryModel: countryInfo)
                }
            }
            
        })
        
        dataTask.resume()
    }
    
    
    func parseJson(data: Data, response: URLResponse) -> CountryModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(Country.self, from: data)
            let name = decodedData[0].translations.fr
            let capital = decodedData[0].capital
            let currency = decodedData[0].currencies[0]
            
            return CountryModel(countryName: name, countryCapital: capital, countryCurrency: currency)
            
        } catch {
            
            countryManagerDelegate?.requestError(error:error, response: response)
            print("Decoding error: \(error) and response \(response)")
            return nil
        }
        
    }
    
}

