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
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Add New Product")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 10)
                
                VStack(spacing: 15) {
                    CustomTextField(title: "Product Name", text: $name)
                    CustomTextField(title: "Description", text: $desc)
                    CustomTextField(title: "Price", text: $price, keyboardType: .decimalPad)
                    CustomTextField(title: "Provider", text: $provider)
                }
                .padding()
                
                Button(action: {
                    if let priceDouble = Double(price), !name.isEmpty {
                        viewModel.addProduct(name: name, desc: desc, price: priceDouble, provider: provider)
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Add Product")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .navigationTitle("Add Product")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CustomTextField: View {
    let title: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        TextField(title, text: $text)
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(12)
            .shadow(radius: 3)
            .keyboardType(keyboardType)
    }
}


