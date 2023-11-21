//
//  FillLevelComponent.swift
//  Memilah
//
//  Created by Kevin Christanto on 23/10/23.
//

import SwiftUI

struct FillLevelComponent: View {
    @Binding var trashBin: TrashBinModel?
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Colors.blue1) //ganti warna nya
                .frame(width: 488, height: 175) //dibikin responsive
            
            VStack{
                Text("Fill Level")
                    .font(.custom(Fonts.plusJakartaSansRegular, size: 24))
                    .foregroundStyle(Colors.adaptiveFontColor)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.vertical, 15)
                
                HStack{
                    PillShapeFillLevel(fillPercentage: trashBin!.levelPaper , category: "Paper", color: Color.red)
                    PillShapeFillLevel(fillPercentage: trashBin!.levelPlastic , category: "Plastic", color: Color.yellow)
                    PillShapeFillLevel(fillPercentage: trashBin!.levelOthers , category: "Others", color: Color.green)
                }
                .padding(.bottom, 20)

                Spacer()
            
            }.frame(width: 488, height: 175) //dibikin responsive
        }
    }
}

#Preview {
    FillLevelComponent(trashBin: .constant(.dummy))
}
