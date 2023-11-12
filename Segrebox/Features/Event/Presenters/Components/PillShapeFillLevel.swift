//
//  PillShapeFillLevel.swift
//  Segrebox
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
            Text(category) //category trash
                .font(.custom("PlusJakartaSans-Regular", size: 16))
                .foregroundStyle(Colors.adaptiveFontColorCard)
                .fontWeight(.medium)
            
            Text("\(Int(fillPercentage))%")
                .font(.custom("PlusJakartaSans-Regular", size: 31))
                .foregroundStyle(Colors.adaptiveFontColorCard)
                .fontWeight(.bold)
                .padding(.bottom, 1)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 70, height: 13)
                    .foregroundColor(Color.gray) //background color
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: fillPercentage/100 * 70, height: 13)
                    .foregroundColor(color) //fill color
            }

        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    PillShapeFillLevel(fillPercentage: 50, category: "Paper", color: Color.green)
}
