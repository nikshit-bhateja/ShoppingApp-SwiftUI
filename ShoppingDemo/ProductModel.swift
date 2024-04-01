//
//  ProductModel.swift
//  ShoppingDemo
//
//  Created by Nikk Bhateja on 31/03/24.
//

import Foundation

struct ProductModel: Decodable, Identifiable {
    let id : Int
    let title, description, category, image : String
    let price : Double
    let rating : Rating
    
    static var dummyProduct: ProductModel {
        return ProductModel(id: 1,
                            title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                            description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                            category: "men's clothing",
                            image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                            price: 109.95,
                            rating: Rating(rate: 3.9,
                                           count: 120))
    }
}


struct Rating: Decodable {
    let rate : Double
    let count : Int

}
