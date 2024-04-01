//
//  ProductsViewModel.swift
//  ShoppingDemo
//
//  Created by Nikk Bhateja on 31/03/24.
//

import Foundation

class ProductsViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var products: [ProductModel] = []
    private let networkManager = NetworkManager()
    
    //MARK: - methods
    // This method is fetching produtcs from API.
    @MainActor func fetchProducts() async {
        do {
             products = try await networkManager.requestForAPIData(BaseUrl.URL)
        } catch {
            print("Error fetching products ", products)
        }
    }
    
}
