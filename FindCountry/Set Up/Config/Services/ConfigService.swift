//
//  ConfigService.swift
//  FindCountry
//
//  Created by Annie Guest on 23/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import ObjectMapper

protocol ConfigServiceProtocol {
    var apiUrl: String? {get}
}

final class ConfigService: ConfigServiceProtocol {
    let configEnv: ConfigEnv
    
    lazy var configModel: ConfigModel? = {
        guard let json = ConfigHelper.getFileContent(for: self.configEnv), let model = Mapper<ConfigModel>().map(JSONString: json) else {
                return nil
        }
        return model
}()

var apiUrl: String?{
    return configModel?.apiUrl
}

init(configEnv: ConfigEnv){
    self.configEnv = configEnv
}

}
