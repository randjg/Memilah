//
//  SaveButtonComponent.swift
//  Segrebox
//
//  Created by Eric Prasetya Sentosa on 11/11/23.
//

import SwiftUI

struct SaveChangesButtonComponent: View {
    var title: String
    var disable: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom(Fonts.plusJakartaSansBold, size: 20))
                .foregroundColor(disable ? .white : Colors.greyDarker)
                .frame(width: 202, height: 40)
                .background(disable ? Colors.primaryInActive : Colors.blueSave)
                .cornerRadius(8)
        }
        .disabled(disable)
    }
}

#Preview {
    SaveChangesButtonComponent(title: "Add Trash Bin", disable: true) {
        
    }
}

