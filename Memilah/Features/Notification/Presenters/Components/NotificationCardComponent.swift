//
//  NotificationCardView.swift
//  Segrebox
//
//  Created by Kevin Christanto on 25/10/23.
//

import SwiftUI

struct NotificationCardComponent: View {
    
    var notification: NotificationModel
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.adaptiveFontColorCard)
                .shadow(radius: 5)
            VStack (alignment: .leading) {
                HStack{
                    Text(notification.title == "Fill Level Alert" ? "⚠️" : "❗")
                        .padding(.leading, 13)
                    //emoji
                    Text(notification.title) //header alert
                        .font(.custom(Fonts.plusJakartaSansRegular, size: 21))
                        .fontWeight(.bold)
                    
                    Spacer()
                    Text(notification.dateCreated.formatDateForNotif())//time for notification
                        .padding(.trailing, 18)
                }
                
                Text(notification.description)
                    .font(.custom(Fonts.plusJakartaSansRegular, size: 21))
                    .padding(.top, -5)
                    .padding(.leading, 45)
                    .frame(alignment: .topLeading)
            }
        }
        .frame(height: 110)
        .padding(.horizontal, 100)
    }
}

#Preview {
    NotificationCardComponent(notification: .dummy)
}
