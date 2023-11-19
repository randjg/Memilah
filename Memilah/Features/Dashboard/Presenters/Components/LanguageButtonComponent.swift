//
//  LanguageButtonComponent.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 19/11/23.
//

import SwiftUI

struct LanguageButtonComponent: View {
    var action: () -> Void
    var language: String
    var region: String
    @Binding var isOn: Bool
    var body: some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                Group {
                    Text(language)
                        .font(
                            Font.custom(Fonts.plusJakartaSansBold, size: 16)
                        )
                    Text(region)
                        .font(
                            Font.custom(Fonts.plusJakartaSansRegular, size: 13)
                        )
                }
                .frame(width: 137, alignment: .leading)
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 22)
            .foregroundStyle(Colors.adaptiveFontColor)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: 1)
                    .stroke(isOn ? Colors.blue4 : .clear, lineWidth: 4)
                    .fill(isOn ? Colors.blue1 : .clear)
            }
        }
    }
}

#Preview {
    LanguageButtonComponent(action: {}, language: "English", region: "United Kingdom", isOn: .constant(true))
}
