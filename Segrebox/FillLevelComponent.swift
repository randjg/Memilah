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
                .fill(Color(red: 0.93, green: 0.95, blue: 0.96)) //ganti warna nya
                .frame(width: 375, height: 175) //dibikin responsive
            
            VStack{
                Text("Fill Level")
                    .font(.custom("PlusJakartaSans-Regular", size: 24))
                    .bold()
                    .foregroundColor(.black)
                    .padding(.vertical, 10)
                
                HStack{
                    PillShapeFillLevel(fillPercentage: 50, category: "Paper", color: Color.red)
                    PillShapeFillLevel(fillPercentage: 60, category: "Plastic", color: Color.yellow)
                    PillShapeFillLevel(fillPercentage: 90, category: "Others", color: Color.green)
                }
                .padding(.bottom, 20)

                Spacer()
                
            }.frame(width: 375, height: 175) //dibikin responsive
        }
    }
}

#Preview {
    FillLevelComponent()
}
