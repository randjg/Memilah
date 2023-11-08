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
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            
        }){
            configuration.label
                .font(
                    Font.custom("PlusJakartaSans-Bold", size: 20)
                        .weight(.bold)
                )
                .padding(.horizontal, 49)
                .padding(.vertical, 10)
                .foregroundColor(.white)
                .background(Color("blue"))
                .cornerRadius(8.0)
                .brightness(configuration.isPressed ? 0.05 : 0.0)
        }
        
    }
}

struct SecondaryButtonStyle: ButtonStyle{
    var textPlaceholder: String
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            
        }){
            configuration.label
                .font(
                    Font.custom("PlusJakartaSans-Bold", size: 20)
                        .weight(.bold)
                )
                .padding(.horizontal, 49)
                .padding(.vertical, 10)
                .foregroundColor(Color("grey-darker"))
                .background(Color("blue-light-active"))
                .cornerRadius(8.0)
                .brightness(configuration.isPressed ? 0.05 : 0.0)
        }
        
    }
}


