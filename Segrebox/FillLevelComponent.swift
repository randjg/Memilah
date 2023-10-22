//
//  FillLevelComponent.swift
//  Segrebox
//
//  Created by Kevin Christanto on 23/10/23.
//

import SwiftUI

struct FillLevelComponent: View {
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue) //ganti warna nya
                .frame(width: 375, height: 175) //dibikin responsive
                
            
            VStack{
                Text("Fill Level")
                    .font(.custom("PlusJakartaSans-Regular", size: 24))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                PillShapeFillLevel(fillPercentage: 50, category: "Paper")
                PillShapeFillLevel(fillPercentage: 60, category: "Plastic")
                PillShapeFillLevel(fillPercentage: 90, category: "Others")
                
                Spacer()
            }.frame(width: 375, height: 175) //dibikin responsive

            
        }
    }
}

#Preview {
    FillLevelComponent()
}
