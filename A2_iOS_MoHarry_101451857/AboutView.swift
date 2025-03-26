//
//  AboutView.swift
//  A2_iOS_MoHarry_101451857
//
//  Created by harry on 06/01/1404 AP.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            // Title
            Text("Lab Test Assignment One")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(.blue)
                .padding(.bottom, 4)

            // Subtle Divider
            Divider()
                .background(Color.gray.opacity(0.3))
                .padding(.horizontal, 50)

            // Name and ID
            VStack(spacing: 6) {
                Text("Created by")
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.gray)

                Text("Mo Harry Bandukda")
                    .font(.system(size: 22, weight: .semibold, design: .rounded))
                    .foregroundColor(.primary)

                Text("Student ID: 101451857")
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.gray)
            }
            .padding(.top, 8)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemBackground)) // Clean background
        .ignoresSafeArea()
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline) // Keeps title small
    }
}

#Preview {
    AboutView()
}



