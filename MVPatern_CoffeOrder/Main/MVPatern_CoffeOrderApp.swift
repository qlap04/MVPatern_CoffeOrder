//
//  MVPatern_CoffeOrderApp.swift
//  MVPatern_CoffeOrder
//
//  Created by Phan Quốc Lập on 06/08/2024.
//

import SwiftUI

@main
struct MVPatern_CoffeOrderApp: App {
    @StateObject private var model: CoffeeModel
    
    init() {
        var config = Configuration()
        let webservice = Webservice(baseURL: config.environment.baseURL)
        _model = StateObject(wrappedValue: CoffeeModel(webservice: webservice))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
