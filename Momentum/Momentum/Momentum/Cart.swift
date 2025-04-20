//
//  Cart.swift
//  Momentum


import UIKit

class Cart {
    
    static let shared = Cart()
    
    private init(){}
    
    var products: [Product] = []
    
    func addProduct(_ product: Product) {
        products.append(product)
        print("\(product.name) добавлен в корзину")
    }
    
    func clearCart(){
        products.removeAll()
    }
}
