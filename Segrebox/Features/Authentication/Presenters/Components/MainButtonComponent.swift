//
//  MainButtonComponent.swift
//  Segrebox
//
//  Created by Randy Julian on 22/10/23.
//

import SwiftUI

struct MainButtonComponent: View {
    var title: String
    var disable: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                .foregroundColor(.white)
                .frame(width: 625, height: 50)
                .background(disable ? Colors.primaryInActive : Colors.primaryActive)
                .cornerRadius(8)
        }
        .disabled(disable)
    }
}

#Preview {
    MainButtonComponent(title: "Login", disable: true) {
        
    }
}
