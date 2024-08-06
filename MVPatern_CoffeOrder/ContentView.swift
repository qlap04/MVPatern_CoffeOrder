//
//  ContentView.swift
//  MVPatern_CoffeOrder
//
//  Created by Phan Quốc Lập on 06/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    @EnvironmentObject private var model: CoffeeModel
    
    private func populateOrders() async {
        do {
            try await model.populateOrders()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if model.orders.isEmpty {
                    Text("No orders available").accessibilityLabel("noOrderText")
                        .foregroundColor(.gray)
                } else {
                    List(model.orders) { order in
                        OrderCellView(order: order)
                        }
                    }
                }
            }
            .task {
                await populateOrders()
            }
            .sheet(isPresented: $isPresented, content: {
                AddCoffeView()
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add new order"){
                        isPresented = true
                    }.accessibilityIdentifier("addNewOrder")
                }
            }
        }
    }
//Oh God's sake, fucking of #Preview, I have erased that, and now Programs has been repeatly informed report  :))), no preview to the last of lesson. Sign : PQL 

