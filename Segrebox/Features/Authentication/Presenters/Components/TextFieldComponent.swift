//
//  TextFieldComponent.swift
//  Segrebox
//
//  Created by Randy Julian on 24/10/23.
//

import SwiftUI

struct TextFieldComponent: View {
    @Binding var text: String
    var placeholder: String
    var keyboardType: UIKeyboardType
    var returnKeyType: UIReturnKeyType
    var width: CGFloat
    var height: CGFloat
    var axis: Axis

    var body: some View {
        TextField(placeholder, text: $text, axis: axis)
            .padding(.leading, 10)
            .font(.custom(Fonts.plusJakartaSansRegular, size: 21))
            .keyboardType(keyboardType)
            .textContentType(.none)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .frame(width: width, height: height)
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 0.78, green: 0.88, blue: 0.82), lineWidth: 2))
            .returnKeyType(returnKeyType)

    }
}

extension View {
    func returnKeyType(_ type: UIReturnKeyType) -> some View {
        return self
    }
}
