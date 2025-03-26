//
//  ProductDetailView.swift
//  A2_iOS_MoHarry_101451857
//
//  Created by harry on 06/01/1404 AP.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        VStack(spacing: 20) {
            Text(product.name ?? "No Name")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text(product.desc ?? "No Description")
                .font(.body)
                .foregroundColor(.gray)
                .padding()
                .multilineTextAlignment(.center)

            HStack {
                Text("Price: $\(product.price, specifier: "%.2f")")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
                
                Spacer()
                
                Text("Provider: \(product.provider ?? "Unknown")")
                    .font(.headline)
                    .foregroundColor(.orange)
            }
            .padding()

            Spacer()

            .padding(.horizontal, 20)
        }
        .padding()
    }
}




