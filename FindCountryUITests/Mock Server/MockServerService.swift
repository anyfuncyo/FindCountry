//
//  MockServerService.swift
//  FindCountryUITests
//
//  Created by Annie Guest on 24/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import Foundation

protocol MockServerService {}

extension MockServerService {
    
    func setMockServerResponse(for endpoint: MockServer.Endpoint, on method: MockServer.Method, return response: MockServer.Response ){
        MockServer.shared.makeReuqest(for: endpoint, on: method, with: response)
    }
}
