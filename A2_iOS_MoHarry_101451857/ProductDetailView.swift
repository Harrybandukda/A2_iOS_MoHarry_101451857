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
        ScrollView {
            VStack(spacing: 20) {
                Text(product.name ?? "No Name")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(15)
                    .shadow(radius: 10)

                Text(product.desc ?? "No Description Available")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding()
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(12)
                    .shadow(radius: 5)

                VStack(spacing: 15) {
                    HStack {
                        Text("Price")
                            .font(.title2)
                            .bold()
                        Spacer()
                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.green)
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(12)

                    HStack {
                        Text("Prvider:")
                            .font(.title2)
                            .bold()
                        Spacer()
                        Text(product.provider ?? "Unknown")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
        .background(Color(UIColor.systemBackground))
        .navigationBarTitle("Product Details", displayMode: .inline)
    }
}





