//
//  ConfigHelper.swift
//  FindCountry
//
//  Created by Annie Guest on 23/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import Foundation

enum ConfigEnv {
    case Debug
    case Release
}

final class ConfigHelper {
    
    static var configEnv: ConfigEnv {
        #if DEBUG
        return .Debug
        #elseif RELEASE
        return .Release
        #else
        fatalError("Config flag not found")
        #endif
    }
    
    static func getJsonFile(for configEnv: ConfigEnv) -> String? {
        var fileName: String? = nil
        
        switch configEnv {
        case .Debug:
            fileName = "Config-Debug"
        case .Release:
            fileName = "Config-Release"
        }
        
        return Bundle.main.path(forResource: fileName, ofType: "json")
    }
    
    static func getFileContent(for configEnv: ConfigEnv) -> String? {
        guard let file = getJsonFile(for: configEnv) else { return nil }
        do{
            let content = try String(contentsOfFile: file)
            return content
        }catch{
            fatalError("Content could not be loaded")
        }
        
    }
    
    
    
    
}
