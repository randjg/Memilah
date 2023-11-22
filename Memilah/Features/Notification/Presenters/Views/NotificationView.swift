//
//  NotificationView.swift
//  Memilah
//
//  Created by Clarabella Lius on 15/11/23.
//

import SwiftUI

struct NotificationView: View {
    @StateObject var viewModel = NotificationViewModel()
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Notifications")
                    .font(
                        Font.custom(Fonts.plusJakartaSansBold, size: 31)
                            .weight(.bold)
                    )
            }
            .padding(.horizontal, 79)
            
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .background(Colors.blueLight)
                    .cornerRadius(20.0)
                
                //Notification Card Component
                ScrollView {
                    ForEach(viewModel.notifications, id: \.documentID) { notification in
                        NotificationCardComponent(notification: notification)
                            .padding(.bottom, 30)
                    }
                    .padding(.top, 8)
                }
                .padding(.top, 70)
            }
            .padding(.top, 50)
        }
        .padding(.top, 77)
        .ignoresSafeArea()
        .task {
            try? await viewModel.getNotifications()
        }
    }
}

#Preview {
    NotificationView()
}
