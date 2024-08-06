//
//  AddCoffeView.swift
//  MVPatern_CoffeOrder
//
//  Created by Phan Quốc Lập on 06/08/2024.
//

import SwiftUI

struct AddCoffeeErrors {
    var name: String = ""
    var coffeeName: String = ""
    var price: String = ""
}

struct AddCoffeView: View {
    @State private var name: String = ""
    @State private var coffeeName: String = ""
    @State private var price: String = ""
    @State private var coffeSize: CoffeeSize = .medium
    @State private var errors: AddCoffeeErrors = AddCoffeeErrors()
    
    @EnvironmentObject private var model : CoffeeModel
    
    private func placeOrder() async{
        let newOrder = Order(name: name, coffeeName: coffeeName, total: Double(price) ?? 0, size: coffeSize)
        
        do{
            try await model.placeOrder(newOrder)
        }catch{
            print(error)
        }
    }
    var isValid: Bool {
        
        errors = AddCoffeeErrors()
        
        // This is NOT a business rule
        // This is just UI validation
        if name.isEmpty {
            errors.name = "Name cannot be empty!"
        }
        
        if coffeeName.isEmpty {
            errors.coffeeName = "Coffee name cannot be empty"
        }
        
        if price.isEmpty {
            errors.price = "Price cannot be empty"
        } else if !price.isNumeric {
            errors.price = "Price needs to be a number"
        } else if price.isLessThan(1) {
            errors.price = "Price needs to be more than 0"
        }
        
        return errors.name.isEmpty && errors.price.isEmpty && errors.coffeeName.isEmpty
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
                .accessibilityIdentifier("name")
            Text(errors.name).visible(errors.name.isNotEmpty)
                .font(.caption)
            
            
            TextField("CoffeeName", text: $coffeeName)
                .accessibilityIdentifier("coffeName")
                .accessibilityIdentifier("coffeeName")
            Text(errors.coffeeName).visible(errors.coffeeName.isNotEmpty)
                .font(.caption)
            
            
            TextField("Price", text: $price)
                .accessibilityIdentifier("price")
            accessibilityIdentifier("price")
            Text(errors.price).visible(!errors.price.isEmpty)
                      .font(.caption)
    
            
            
            Picker("Size", selection: $coffeSize){
                ForEach(CoffeeSize.allCases, id: \.rawValue) {
                    size in
                    Text(size.rawValue).tag(size)
                }
            }.pickerStyle(.segmented)
            
            Button("PlaceOrder") {
                if isValid{
                    Task{
                        await placeOrder()
                    }
                }
            }.accessibilityIdentifier("buttonPlaceOrder")
                .viewCenterHorizontally()
        }
    }
}

#Preview {
    AddCoffeView()
}
