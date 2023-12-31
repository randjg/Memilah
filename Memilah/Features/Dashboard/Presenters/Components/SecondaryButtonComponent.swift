//
//  SecondaryButtonComponent.swift
//  Memilah
//
//  Created by Clarabella Lius on 25/10/23.
//

import SwiftUI
import Foundation

struct PrimaryButtonStyle: ButtonStyle{
    var textPlaceholder: String
    var action: () -> Void
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            action()
        }){
            configuration.label
                .font(
                    Font.custom(Fonts.plusJakartaSansBold, size: 20)
                        .weight(.bold)
                )
                .padding(.horizontal, 49)
                .padding(.vertical, 10)
                .foregroundColor(.white)
                .background(Colors.primaryActive)
                .cornerRadius(8.0)
                .brightness(configuration.isPressed ? 0.05 : 0.0)
        }
        
    }
}

struct SecondaryButtonStyle: ButtonStyle{
    var textPlaceholder: String
    var action: () -> Void
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            action()
        }){
            configuration.label
                .font(
                    Font.custom(Fonts.plusJakartaSansBold, size: 20)
                        .weight(.bold)
                )
                .padding(.horizontal, 49)
                .padding(.vertical, 10)
                .foregroundColor(Colors.greyDarker)
                .background(Colors.blueLightActive)
                .cornerRadius(8.0)
                .brightness(configuration.isPressed ? 0.05 : 0.0)
        }
        
    }
}


struct SecondaryButtonComponent: View{
    var disable: Bool
    var textPlaceholder: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(textPlaceholder)
                .font(
                    Font.custom(Fonts.plusJakartaSansBold, size: 20)
                        .weight(.bold)
                )
                .padding(.horizontal, 49)
                .padding(.vertical, 10)
                .foregroundColor(disable ? Colors.greyLightActive : Colors.greyDarker)
                .background(disable ? Colors.primaryInActive : Colors.blueLightActive)
                .cornerRadius(8.0)
        })
        .disabled(disable)
    }
}


struct EditEventButtonComponent: View{
    var onEdit: Bool
    var textPlaceholder: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(textPlaceholder)
                .font(
                    Font.custom(Fonts.plusJakartaSansBold, size: 20)
                        .weight(.bold)
                )
                .padding(.horizontal, 49)
                .padding(.vertical, 10)
                .foregroundColor(onEdit ? Colors.adaptiveFontColorCard : Colors.greyDarker)
                .background(onEdit ? Colors.redNormal : Colors.blueLightActive)
                .cornerRadius(8.0)
        })
    }
}
