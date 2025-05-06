//
//  CartItem.swift
//  CartShoppingAppDemo
//
//  Created by Aniket Suryawanshi on 11/04/25.
//

import Foundation
struct CartItem {
    var id : Int
    var name : String
    var description : String
    var price : Double
    var quantity : Int
    var unitPrice: Double
    
    init(id: Int, name: String, description: String, price: Double, quantity: Int, unitPrice: Double) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.quantity = quantity
        self.unitPrice = unitPrice
    }
}
