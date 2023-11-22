//
//  PillShapeFillLevel.swift
//  Memilah
//
//  Created by Kevin Christanto on 23/10/23.
//

import SwiftUI

struct PillShapeFillLevel: View {
    var fillPercentage: Double //dimasukin sesuai sensor fill level
    var category: String // paper/plastics/others
    var color: Color
    
    var body: some View {
        
        VStack{
            Text(LocalizedStringKey(category)) //category trash
                .font(.custom(Fonts.plusJakartaSansRegular, size: 16))
                .foregroundStyle(Colors.adaptiveFontColor)
                .fontWeight(.medium)
            
            Text("\(Int(fillPercentage * 100))%")
                .font(.custom(Fonts.plusJakartaSansRegular, size: 31))
                .foregroundStyle(Colors.adaptiveFontColor)
                .fontWeight(.bold)
                .padding(.bottom, 1)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 70, height: 13)
                    .foregroundColor(Color.gray) //background color
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 70 * fillPercentage , height: 13)
                    .foregroundColor(color) //fill color
            }

        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    PillShapeFillLevel(fillPercentage: 0.5, category: "Paper", color: Color.green)
}
