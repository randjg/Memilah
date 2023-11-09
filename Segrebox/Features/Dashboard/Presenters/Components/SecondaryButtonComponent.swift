//
//  SecondaryButtonComponent.swift
//  Segrebox
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


