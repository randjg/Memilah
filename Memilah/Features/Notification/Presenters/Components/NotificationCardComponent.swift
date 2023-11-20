//
//  NotificationCardView.swift
//  Segrebox
//
//  Created by Kevin Christanto on 25/10/23.
//

import SwiftUI

struct NotificationCardComponent: View {
    
    @State private var fillLevelCategory1: Float = 0.0
    @State private var fillLevelCategory2: Float = 0.0
    @State private var fillLevelCategory3: Float = 0.0
    
    @State private var binLocation: String = "Pintu Selatan 2"
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.adaptiveFontColorCard)
                .shadow(radius: 5)
            
            if (fillLevelCategory1 >= 80.0 && fillLevelCategory1 < 100) || (fillLevelCategory2 >= 80.0 && fillLevelCategory2 < 100) || (fillLevelCategory3 >= 80.0 && fillLevelCategory3 < 100){
                VStack (alignment: .leading) {
                    HStack{
                        Text("⚠️")
                            .padding(.leading, 13)
                        //emoji
                        Text("Fill Level Alert") //header alert
                            .font(.custom(Fonts.plusJakartaSansRegular, size: 21))
                            .fontWeight(.bold)
                        
                        Spacer()
                        Text("20 september 2023 19:08")//time for notification
                            .padding(.trailing, 18)
                    }
                    
                    Text("The bins at \(binLocation) have reached ≥80% fill level. Please pick up the trash.")
                        .font(.custom(Fonts.plusJakartaSansRegular, size: 21))
                        .padding(.top, -5)
                        .padding(.leading, 45)
                        .frame(width: 816, alignment: .topLeading)
                }
                
            }
            
            else if (1==1) //condition klo ga update bin nya
            {
                VStack (alignment: .leading) {
                    HStack{
                        Text("❗️")
                            .padding(.leading, 13)
                        //emoji
                        Text("Trash Bin Alert") //header alert
                            .font(.custom(Fonts.plusJakartaSansRegular, size: 21))
                            .fontWeight(.bold)
                        
                        Spacer()
                        Text("20 september 2023 19:08")//time for notification
                            .padding(.trailing, 18)
                    }
                    
                    Text("The bins at \(binLocation) has not received an update for more than 30 minutes. Please check up the trash. ")
                        .font(.custom(Fonts.plusJakartaSansRegular, size: 21))
                        .padding(.top, -5)
                        .padding(.leading, 45)
                        .frame(width: 816, alignment: .topLeading)
                }
                
            }
            
        }
        .frame(width: 960, height: 110)
    }
}

#Preview {
    NotificationCardComponent()
}
