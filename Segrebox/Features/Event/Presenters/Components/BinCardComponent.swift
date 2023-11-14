//
//  CardComponent.swift
//  Segrebox
//
//  Created by Randy Julian on 23/10/23.
//

import SwiftUI

struct BinCardComponent: View {
    
    var trashbin: TrashBinModel
//    @Binding var binStatus: binStatus
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color.white)
                    .frame(width: 819, height: 321)
                
                HStack{
                    Image(trashbin.imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 224, height: 241)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack {
                        HStack {
                            VStack(alignment: .leading){
                                HStack {
                                    Text(trashbin.name)
                                        .font(.custom("PlusJakartaSans-Bold", size: 21))
                                        .foregroundStyle(Colors.adaptiveFontColorCard)

                                    BinStatusComponent()
                                        .frame(maxWidth: 140)
                                }
                                .padding(.top, 20)
                                .padding(.bottom, 8)
                                
                                    Text(trashbin.documentID ?? "No UUID")
                                            .font(.custom("PlusJakartaSans-Regular", size: 13))
                                            .foregroundStyle(Colors.adaptiveFontColorCard)
                                            .padding(.bottom, 8)
                                
                                Text(trashbin.detail)
                                        .lineLimit(3)
                                        .multilineTextAlignment(.leading)
                                        .lineSpacing(2)
                                        .font(.custom("PlusJakartaSans-Regular", size: 13))
                                        .foregroundStyle(Colors.adaptiveFontColorCard)
                                        .frame(width: 199, alignment: .leading)
                                }
                            .padding(.bottom, 10)
                            Spacer()
                                .frame(maxWidth: 100)
                        }
                        
                        Divider()
                            .frame(width: 500)
                            .overlay(Color(Colors.orangeLight))

                        
                        VStack{
                            HStack {
                                Text("Fill Level")
                                    .font(.custom("PlusJakartaSans-Bold", size: 21))
                                    .foregroundStyle(Colors.adaptiveFontColorCard)
                                  
                                Spacer()
                                Text("Last updated 20.05")
                                    .font(.custom("PlusJakartaSans-Italic", size: 13))
                                    .foregroundStyle(Colors.adaptiveFontColorCard)
                            }
                            .padding(.top, 8)
                            .padding(.bottom, -5)
                            .frame(maxWidth: 480)
                            
                            ZStack{
                                VStack{
                                    
                                    HStack{
                                        PillShapeFillLevel(fillPercentage: 50, category: "Paper", color: Color.red)
                                        PillShapeFillLevel(fillPercentage: 60, category: "Plastic", color: Color.yellow)
                                        PillShapeFillLevel(fillPercentage: 90, category: "Others", color: Color.green)
                                    }
                                }.frame(width: 488, height: 100) //dibikin responsive
                            }
                        }
                    }

                }
            }

    }
}

#Preview {
    BinCardComponent(
        trashbin: TrashBinModel(
            documentID: "xBcxEgxNYwsWAmeu9w7q",
            name: "test",
            detail: "test",
            imageUrl: "trash-bins/F8BCEE43-E009-4CCE-BB23-9B89A14BF39A.jpeg", 
            latitude: 0,
            levelOthers: 1,
            levelPlastic: 1,
            levelPaper: 1,
            objectDetected: false, 
            event: "ythi0zFLYayMh9d3fwGL"
        )
//        binStatus: .constant(.connected)
    )
}
