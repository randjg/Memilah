//
//  MainButtonComponent.swift
//  Segrebox
//
//  Created by Randy Julian on 22/10/23.
//

import SwiftUI

struct MainButtonComponent: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("PlusJakartaSans-Bold", size: 21))
                .foregroundColor(.white)
                .frame(width: 625, height: 50)
                .background((Color(red: 0.25, green: 0.47, blue: 0.55)))
                .cornerRadius(8)
        }
    }
}

#Preview {
    MainButtonComponent(title: "Login"){
        LoginView()
    }
}
