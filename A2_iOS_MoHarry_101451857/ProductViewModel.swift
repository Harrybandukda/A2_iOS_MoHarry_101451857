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
            if products.isEmpty { seedData() } 
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

    func seedData() {
        let sampleProducts = [
            ("iPhone 16 Pro", "Latest Apple iPhone", 999.99, "Apple"),
            ("Galaxy S25 +", "Samsung latest phone", 1299.99, "Samsung"),
            ("MacBook Air", "Apple M4 laptop", 2599.99, "Apple"),
        ]

        for product in sampleProducts {
            addProduct(name: product.0, desc: product.1, price: product.2, provider: product.3)
        }
    }

    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save product: \(error)")
        }
    }
}

