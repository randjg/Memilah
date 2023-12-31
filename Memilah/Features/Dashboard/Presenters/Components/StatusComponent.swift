//
//  Status.swift
//  Memilah
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
    var dateStart: Date
    var dateEnd: Date
    
    
    var body: some View {
        ZStack{
            Rectangle()
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
        .frame(width: 116, height: 27)
        .onAppear(perform: {
            compareDate()
        })
        
    }
    
    func isDateInRange() -> Bool {
        return Date() >= dateStart && Date() <= dateEnd
    }
    
    private func compareDate() {
        let sameDay = Calendar.current.isDate(Date(), equalTo: dateStart, toGranularity: .day)
        if sameDay || isDateInRange() {
            eventStatus = .onGoing
        } else {
            eventStatus = .upcoming
        }
    }
    
    private func statusColor() -> Color {
        switch eventStatus {
        case .onGoing:
            return Colors.greenOngoing
        case .upcoming:
            return Colors.greyNormal
        }
    }
 
}

#Preview {
    StatusComponent(dateStart: Date(), dateEnd: Date())
}
