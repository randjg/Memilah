//
//  NotificationView.swift
//  Memilah
//
//  Created by Clarabella Lius on 15/11/23.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                //MARK:Title
                Image(systemName: "chevron.left")
                    .bold()
                    .padding()
                
                Text("Notifications")
                    .font(
                        Font.custom(Fonts.plusJakartaSansBold, size: 31)
                            .weight(.bold)
                    )
            }
            .padding(.horizontal, 63)
            
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .background(Colors.blueLight)
                    .cornerRadius(20.0)
                    .padding(.top, 50)
                
                //Notification Card Component
                VStack{
                    NotificationCardComponent()
                }
                
            }
        
        }
        .padding(.top, 55)
        .ignoresSafeArea()
    }
}

#Preview {
    NotificationView()
}
