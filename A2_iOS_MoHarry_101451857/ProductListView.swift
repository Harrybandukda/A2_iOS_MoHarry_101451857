//
//  ProductListView.swift
//  A2_iOS_MoHarry_101451857
//
//  Created by harry on 06/01/1404 AP.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("Product List")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 10)

                if viewModel.products.isEmpty {
                    VStack {
                        Image(systemName: "cart.badge.plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)

                        Text("No Products Available")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding(.top, 5)

                        Text("Tap the + button to add new products.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(viewModel.products) { product in
                            NavigationLink(destination: ProductDetailView(product: product)) {
                                ProductRow(product: product)
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                let productToDelete = viewModel.products[index]
                                viewModel.deleteProduct(productToDelete)
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProductRow: View {
    let product: Product

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name ?? "Unknown")
                    .font(.headline)

                Text(product.desc ?? "No description available")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)

                HStack {
                    Text("💰 $\(product.price, specifier: "%.2f")")
                        .font(.caption)
                        .foregroundColor(.blue)

                    Spacer()

                    Text("🏭 \(product.provider ?? "Unknown")")
                        .font(.caption)
                        .foregroundColor(.orange)
                }
            }
            .padding(.vertical, 8)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    ProductListView()
}
