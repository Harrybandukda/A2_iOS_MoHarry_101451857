//
//  ProductViewModel.swift
//  A2_iOS_MoHarry_101451857
//
//  Created by harry on 06/01/1404 AP.
//

import Foundation
import CoreData

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    let context = CoreDataManager.shared.container.viewContext

    init() {
        fetchProducts()
    }

    func fetchProducts() {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        do {
            products = try context.fetch(request)
        } catch {
            print("Failed to fetch products: \(error)")
        }
    }
    
    func deleteProduct(_ product: Product) {
        context.delete(product)

        do {
            try context.save()
            fetchProducts()
        } catch {
            print("❌ Error deleting product: \(error.localizedDescription)")
        }
    }

    func addProduct(name: String, desc: String, price: Double, provider: String) {
        let newProduct = Product(context: context)
        newProduct.id = UUID()
        newProduct.name = name
        newProduct.desc = desc
        newProduct.price = price
        newProduct.provider = provider

        saveContext()
        fetchProducts()
    }

    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save product: \(error)")
        }
    }
}

