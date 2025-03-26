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
        VStack(alignment: .leading, spacing: 20) {
            Text(product.name ?? "Unknown")
                .font(.largeTitle)
                .bold()

            Text("Description: \(product.desc ?? "No description")")
                .font(.body)

            Text("Price: $\(product.price, specifier: "%.2f")")
                .font(.title2)
                .bold()

            Text("Provider: \(product.provider ?? "Unknown")")
                .font(.subheadline)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .navigationTitle(product.name ?? "Product")
    }
}





