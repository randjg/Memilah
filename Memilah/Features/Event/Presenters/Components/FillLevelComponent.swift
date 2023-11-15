//
//  FillLevelComponent.swift
//  Memilah
//
//  Created by Kevin Christanto on 23/10/23.
//

import SwiftUI

struct FillLevelComponent: View {
    @Binding var trashBin: TrashBinModel
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.93, green: 0.95, blue: 0.96)) //ganti warna nya
                .frame(width: 488, height: 175) //dibikin responsive
            
            VStack{
                Text("Fill Level")
                    .font(.custom(Fonts.plusJakartaSansRegular, size: 24))
                    .foregroundStyle(Colors.adaptiveFontColorCard)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.vertical, 15)
                
                HStack{
                    PillShapeFillLevel(fillPercentage: trashBin.levelPaper ?? 0, category: "Paper", color: Color.red)
                    PillShapeFillLevel(fillPercentage: trashBin.levelPlastic ?? 0, category: "Plastic", color: Color.yellow)
                    PillShapeFillLevel(fillPercentage: trashBin.levelOthers ?? 0, category: "Others", color: Color.green)
                }
                .padding(.bottom, 20)

                Spacer()
            
            }.frame(width: 488, height: 175) //dibikin responsive
        }
    }
}

#Preview {
    FillLevelComponent(trashBin: .constant(TrashBinModel(documentID: "A0:B7:65:5A:DA:44", name: "Stadion Akuatik GBK", detail: "Trash bin ini terletak di dekan pintu masuk aquatic GBK", imageUrl: "trash-bins/E17639C0-0E31-407D-8CD7-C55CC5587E09.jpeg", latitude: 0.1, longitude: 0.1, levelOthers: 0.7, levelPlastic: 0.8, levelPaper: 0.5, objectDetected: false, event: nil, detectionResult: nil, timeUpdated: Date())))
}
