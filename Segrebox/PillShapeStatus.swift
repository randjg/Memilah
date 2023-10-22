//
//  PillShape.swift
//  Segrebox
//
//  Created by Kevin Christanto on 23/10/23.
//

import SwiftUI

struct PillShapeStatus: View {
    
    var color: Color
    var text: String
    
    var body: some View {
            Text(text)
            .bold()
            .padding(.vertical, 6)
            .padding(.horizontal, 16)
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 20).fill(color))
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    PillShapeStatus(color: Color.green, text: "Connected")
}
