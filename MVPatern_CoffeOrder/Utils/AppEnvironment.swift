//
//  AppEnvironment.swift
//  MVPatern_CoffeOrder
//
//  Created by Phan Quốc Lập on 06/08/2024.
//

import Foundation

enum AppEnvironment: String{
    case dev
    case test
    
    var baseURL : URL {
        switch self{
        case .dev:
            return URL(string: "https://light-military-count.glitch.me")!
        case .test:
            return URL(string: "https://light-military-count.glitch.me")!
        }
    }
}

enum Endpoints {
    case allOrders
    
    var path: String{
        switch self {
        case.allOrders:
            return "orders"
        }
    }
}

struct Configuration {
    lazy var environment: AppEnvironment = {
        // read value from environment variable
        guard let env = ProcessInfo.processInfo.environment["ENV"] else {
            return AppEnvironment.dev
        }
        
        if  env == "TEST" {
            return AppEnvironment.test
        }
        
        return AppEnvironment.dev
    }()
}
