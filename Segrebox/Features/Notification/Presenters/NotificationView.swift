//
//  NotificationView.swift
//  Segrebox
//
//  Created by Clarabella Lius on 15/11/23.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            //MARK: Title
            HStack{
                Image(systemName: "chevron.left")
                    .bold()
                    .padding()
                
                Text("Notifications")
                    .font(
                        Font.custom(Fonts.plusJakartaSansBold, size: 31)
                            .weight(.bold)
                    )
            }.padding()
            
            
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .background(Color(red: 0.93, green: 0.95, blue: 0.96))
                    .cornerRadius(20.0)
                    .padding(.top, 50)
            }
            
        }
        .padding(.top, 55)
        .ignoresSafeArea()
        
        
    }
}
    
#Preview {        
    NotificationView()
}
    
    
    
    

