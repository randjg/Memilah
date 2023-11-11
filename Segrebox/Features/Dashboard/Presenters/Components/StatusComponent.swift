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
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 96, height: 27)
                .foregroundColor(statusColor())
                .cornerRadius(50)
            
            switch self.eventStatus {
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
    StatusComponent(eventStatus: .onGoing)
}
