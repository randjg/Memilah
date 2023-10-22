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
    
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack{
                
                Text(category) //category trash
                    
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 13)
                        .foregroundColor(Color.gray) // Set the background color
                    
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: CGFloat(fillPercentage) / 100.0 * geometry.size.width, height: 13)
                        .foregroundColor(Color.green) // Set the fill color
                }
                
                Text("\(Int(fillPercentage))%")

            }
        }
    }
}

#Preview {
    PillShapeFillLevel(fillPercentage: 70, category: "Paper")
}
