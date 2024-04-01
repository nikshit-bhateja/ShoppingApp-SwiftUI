//
//  ContentView.swift
//  ShoppingDemo
//
//  Created by Nikk Bhateja on 30/03/24.
//

import SwiftUI

struct ProductsView: View {
    
    //MARK: - Properties
    @StateObject var viewModel = ProductsViewModel()
    //MARK: - body
    var body: some View {
        NavigationStack {
            List(viewModel.products) { product in
                ProductRowView(product: product)
            }
            .listStyle(.plain)
            .navigationTitle("Products")
        }
        .task {
            await viewModel.fetchProducts()
        }
        
    }
}   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}

