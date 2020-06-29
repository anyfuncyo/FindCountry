//
//  CountryModel.swift
//  FindCountry
//
//  Created by Annie Guest on 15/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import Foundation

struct CountryData: Codable {
    
    let translations: Name
    let capital: String
    let currencies: [String]
    
}

struct Name: Codable {
    let fr: String
}

typealias Country = [CountryData]




/*
[
    {
        "name": "Norway",
        "topLevelDomain": [
            ".no"
        ],
        "alpha2Code": "NO",
        "alpha3Code": "NOR",
        "callingCodes": [
            "47"
        ],
        "capital": "Oslo",
        "altSpellings": [
            "NO",
            "Norge",
            "Noreg",
            "Kingdom of Norway",
            "Kongeriket Norge",
            "Kongeriket Noreg"
        ],
        "region": "Europe",
        "subregion": "Northern Europe",
        "population": 5176998,
        "latlng": [
            62.0,
            10.0
        ],
        "demonym": "Norwegian",
        "area": 323802.0,
        "gini": 25.8,
        "timezones": [
            "UTC+01:00"
        ],
        "borders": [
            "FIN",
            "SWE",
            "RUS"
        ],
        "nativeName": "Norge",
        "numericCode": "578",
        "currencies": [
            "NOK"
        ],
        "languages": [
            "no",
            "nb",
            "nn"
        ],
        "translations": {
            "de": "Norwegen",
            "es": "Noruega",
            "fr": "Norvège",
            "ja": "ノルウェー",
            "it": "Norvegia"
        },
        "relevance": "1.5"
    }
]
 
 */
