//
//  AddProductView.swift
//  A2_iOS_MoHarry_101451857
//
//  Created by harry on 06/01/1404 AP.
//

import SwiftUI

struct AddProductView: View {
    @ObservedObject var viewModel: ProductViewModel
    @State private var name = ""
    @State private var desc = ""
    @State private var price = ""
    @State private var provider = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Product Name", text: $name)
                TextField("Description", text: $desc)
                TextField("Price", text: $price)
                    .keyboardType(.decimalPad)
                TextField("Provider", text: $provider)

                Button("Add Product") {
                    if let priceDouble = Double(price) {
                        viewModel.addProduct(name: name, desc: desc, price: priceDouble, provider: provider)
                    }
                }
            }
            .navigationTitle("Add Product")
        }
    }
}


