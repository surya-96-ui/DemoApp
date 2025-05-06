//
//  CartViewModel.swift
//  CartShoppingAppDemo
//
//  Created by Aniket Suryawanshi on 11/04/25.
//

import Foundation
class CartViewModel : ObservableObject{
    @Published var cartList = [CartItem]()
    
    func fetchProducts() {
        self.cartList.append(CartItem(id: 1, name: "Pizza", description: "Delicious cheese pizza", price: 10, quantity: 1, unitPrice: 10))
        self.cartList.append(CartItem(id: 2, name: "Burger", description: "Juicy beef burger", price: 20, quantity: 1, unitPrice: 20))
        self.cartList.append(CartItem(id: 1, name: "Burg", description: "Juicy beef burg", price: 30, quantity: 1, unitPrice: 30))
    }
    
    func totalProducts() -> Int {
        return cartList.count
    }
    
    func showTotalPrice() -> String{
        return "\(cartList.reduce(0) {$0 + Int($1.unitPrice) * $1.quantity})"
    }
    
    func resetProducts() {
        cartList.removeAll()
        fetchProducts()
    }
    
    func showTotalProdQtys() -> String {
        return "\(cartList.reduce(0) {$0 + $1.quantity})"
    }
    
    func totalCartAddedProducts() -> Int {
        let quanitities = cartList.filter {$0.quantity > 1}
        return quanitities.count
    }
    
}
