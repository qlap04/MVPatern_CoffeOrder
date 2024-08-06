//
//  CoffeModel.swift
//  MVPatern_CoffeOrder
//
//  Created by Phan Quốc Lập on 06/08/2024.
//

import Foundation

@MainActor
class CoffeModel: ObservableObject {
    
    let websrvice: Webservice
    @Published private(set) var orders: [Order] = []
    
    init(websrvice: Webservice) {
        self.websrvice = websrvice
    }
    
    func populateOrders() async throws {
        orders = try await websrvice.getOrders()
    }
}
