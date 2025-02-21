//
//  ProfileScreen.swift
//  Runner
//
//  Created by Amr Koritem on 21/02/2025.
//

import SwiftUI

struct ProfileScreen: View {
    var name: String
    var email: String
    var imageName: String

    var body: some View {
        VStack {
            Text(name)
                .font(.largeTitle)
                .padding()

            Text(email)
                .font(.subheadline)
                .padding()

            if let uiImage = UIImage(named: imageName) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .cornerRadius(75)
            } else {
                Text("Image not found")
                    .foregroundColor(.red)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .padding()
    }
}
