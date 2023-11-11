//
//  Status.swift
//  Segrebox
//
//  Created by Clarabella Lius on 11/11/23.
//

import SwiftUI

enum eventStatus{
    case onGoing
    case upcoming
}

struct StatusComponent: View {
    
    @State var eventStatus: eventStatus = .onGoing
    var eventDate: Date
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 96, height: 27)
                .foregroundColor(statusColor())
                .cornerRadius(50)
            
            switch eventStatus {
            case .onGoing:
                Text("Ongoing")
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                
            case .upcoming:
                Text("Upcoming")
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }
        }
        .onAppear(perform: {
            compareDate()
        })
        
    }
    
    private func compareDate() {
        let sameDay = Calendar.current.isDate(Date(), equalTo: eventDate, toGranularity: .day)
        if sameDay {
            eventStatus = .onGoing
        } else {
            eventStatus = .upcoming
        }
    }
    
    private func statusColor() -> Color {
        switch eventStatus {
        case .onGoing:
            return Color.green
        case .upcoming:
            return Color.gray
        }
    }
 
}

#Preview {
    StatusComponent(eventDate: Date())
}
