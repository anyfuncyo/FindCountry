//
//  SearchCountryTests.swift
//  FindCountryUITests
//
//  Created by Annie Guest on 19/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import XCTest

final class SearchCountryTests: UITestSetUp, InteractionContext, MockServerService {
    
    let searchScreen = SearchScreen()
    let resultScreen = ResultScreen()
    let badRequestAlert = Alert(id: "Result not found", dismissButton: "Close")
    let unauthRequestAlert = Alert(id: "Unauthorized Request", dismissButton: "Close")
    
    func test_getSearchResult(){
        setMockServerResponse(for: .countryData, on: .get, return: .success)
        onView(searchScreen.view)
        type(text: "Norway", into: searchScreen.textFields)
        tap(searchScreen.button)
        onView(resultScreen.view)
        assertMatch(text: "Norvège", in: resultScreen.countryNameLabel)
        assertMatch(text: "Oslo", in: resultScreen.capitalLabel)
        assertMatch(text: "NOK", in: resultScreen.currencyLabel)
    }
    
    func test_searchResultNotFound(){
        setMockServerResponse(for: .countryData, on: .get, return: .failure)
        onView(searchScreen.view)
        type(text: "on99", into: searchScreen.textFields)
        tap(searchScreen.button)
        alertShows(badRequestAlert.id, closeAlert: badRequestAlert.dismissButton)
    }
    
    func test_searchUnauthorized(){
        setMockServerResponse(for: .countryData, on: .get, return: .unauthorized)
        onView(searchScreen.view)
        type(text: "gag", into: searchScreen.textFields)
        tap(searchScreen.button)
        alertShows(unauthRequestAlert.id, closeAlert: unauthRequestAlert.dismissButton)
    }
}
