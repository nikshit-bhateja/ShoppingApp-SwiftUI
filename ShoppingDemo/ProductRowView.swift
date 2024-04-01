//
//  ProductRowView.swift
//  ShoppingDemo
//
//  Created by Nikk Bhateja on 31/03/24.
//

import SwiftUI

struct ProductRowView: View {
    
    let product: ProductModel
    
    var body: some View {
        HStack(spacing: 8) {
            if let url = URL(string: product.image) {
                fetchProductImage(url: url)
            }
            
            // Right side content container.
            VStack(alignment: .leading, spacing: 8) {
                // Product Title
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                
                // product category and rating
                HStack {
                    Text(product.category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                        
                        Text(product.rating.rate.toString())
                            
                    }
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.yellow)
                }
                
                // description
                Text(product.description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
                
                // Price and buy button
                HStack{
                    Text(product.price.currencyFormat())
                        .font(.title3)
                        .foregroundStyle(.indigo)
                    
                    Spacer()
                        
                    buyButton
                }
            }
        } .padding()
    }
    
    func fetchProductImage(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 100, height: 100)

    }
    
    var buyButton: some View {
        Button {
            
        } label: {
            Text("Buy")
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(.indigo)
                .clipShape(Capsule())
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: ProductModel.dummyProduct)
    }
}
