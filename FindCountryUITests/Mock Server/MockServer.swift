//
//  MockServer.swift
//  FindCountryUITests
//
//  Created by Annie Guest on 22/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import Swifter

final class MockServer {
    
    private let server = HttpServer()
    private let port = UInt16(8888)
    static let shared = MockServer()
    
    //MARK: - Custom Types
    
    func start(){
        try! server.start(port)
    }
    
    func stop(){
        server.stop()
    }
    
    //MARK: - Configurations
    
    enum Response {
        case success
        case failure
        case unauthorized
    }
    
    enum Method  {
        case get
    }
    
    enum Endpoint: String {
        case countryData
    }
    
    func makeReuqest(for endpoint: Endpoint, on method: Method, with response: Response) {
        switch method {
        case .get:
            server.GET[endpoint.path]  = { _ in return response.setResponse(for: endpoint)}
        }
    }
    
}

//MARK: - Set endpoint

extension MockServer.Endpoint {
    
    var path: String {
        switch self {
        case .countryData: return "/Norway"
        }
    }
}


//MARK: - Customize response

extension MockServer.Response {
    
    func setResponse(for endpoint: MockServer.Endpoint) -> HttpResponse {
        switch (endpoint, self) {
        case(.countryData, .success):
            return .ok(.data(MockServer.shared.getDummyData(resource: "countryData", fileFormat: "json")))
        case(.countryData, .failure):
            return .internalServerError
        case(.countryData, .unauthorized):
            let data = MockServer.shared.getDummyData(resource: "unauthorizedResponse", fileFormat: "json")
            return HttpResponse.customizedResponseBody(body: data, errorCode: 401, errorMsg: "Unauthorized")
        }
    }
    
}

extension HttpResponse {
    static func customizedResponseBody(body: Data, errorCode: Int, errorMsg: String) -> HttpResponse {
        
        let data = try! JSONSerialization.data(withJSONObject: body)
        return HttpResponse.raw(errorCode, errorMsg, nil, { (writer) in
            try writer.write(data)
        })
    }
}

extension MockServer {
    
    //MARK: - Get dummy country data
    func getDummyData(resource: String, fileFormat: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        
        guard let filePath = bundle.url(forResource:resource, withExtension: fileFormat) else {
            fatalError("Json file not found")
        }
        
        guard let mockData = try? Data(contentsOf: filePath) else {
            fatalError("Cannot decode the json file")
        }
        
        return mockData
        
    }
    
}


