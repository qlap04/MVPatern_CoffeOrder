//
//  OrderCellView.swift
//  MVPatern_CoffeOrder
//
//  Created by Phan Quốc Lập on 06/08/2024.
//

import SwiftUI

struct OrderCellView: View {
    let order : Order
    var body: some View {
        
        HStack {
            VStack (alignment: .leading){
                Text(order.name)
                    .bold()
                .accessibilityIdentifier("nameCustomer")
                Text("\(order.coffeeName) (\(order.size.rawValue))")
                    .opacity(0.5)
                    .accessibilityIdentifier("nameCoffe_and_Size")
            }
            Spacer()
            Text("\(order.getTotal)$")
                .bold()
        }
        
    }
}

