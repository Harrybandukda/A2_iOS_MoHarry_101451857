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
            List(viewModel.products, id: \.id) { product in
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
            .navigationTitle("Products")
        }
    }
}


#Preview {
    ProductListView()
}
