//
//  ContentView.swift
//  A2_iOS_MoHarry_101451857
//
//  Created by harry on 06/01/1404 AP.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ProductViewModel()

    var body: some View {
        TabView {
            ProductListView(viewModel: viewModel)
                .tabItem {
                    Label("Products", systemImage: "list.bullet")
                }

            AddProductView(viewModel: viewModel)
                .tabItem {
                    Label("Add", systemImage: "plus.circle")
                }
        }
    }
}


private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
