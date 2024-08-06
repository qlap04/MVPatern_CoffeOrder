//
//  centerHorizontally.swift
//  MVPatern_CoffeOrder
//
//  Created by Phan Quốc Lập on 06/08/2024.
//

import Foundation

import SwiftUI

extension View{
    func viewCenterHorizontally() -> some View {
        HStack{
            Spacer()
            self
            Spacer()
        }
    }
    
    @ViewBuilder
    func visible(_ value: Bool) -> some View {
        // you can use if-else also
        switch value {
            case true:
                self
            case false:
                EmptyView()
        }
    }
}
