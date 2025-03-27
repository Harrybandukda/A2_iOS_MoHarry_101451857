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
                                VStack(alignment: .leading) {
                                    Text(product.name ?? "Unknown")
                                        .font(.headline)
                                    Text(product.desc ?? "No description")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
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

#Preview {
    ProductListView()
}
