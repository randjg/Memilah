//
//  PillShape.swift
//  Memilah
//
//  Created by Kevin Christanto on 23/10/23.
//

import SwiftUI

enum binStatus{
    case needsChecking
    case connected
}


struct BinStatusComponent: View {
    
    @State var binStatus: binStatus = .connected
    var timeUpdated: Date
    var body: some View {
        
        
        Text(isIntervalNotMoreThan5Minutes() ? "Connected" : "Needs Checking")
            .font(.custom("PlusJakartaSans-SemiBold", size: 13))
            .padding(.vertical, 6)
            .padding(.horizontal, 16)
            .foregroundColor(.white)
            .background(
                Rectangle()
                    .foregroundColor(isIntervalNotMoreThan5Minutes() ? Colors.greenOngoing : Colors.orangeNormal)
                    .cornerRadius(50)
            )
        
    }
    
    private func isIntervalNotMoreThan5Minutes() -> Bool {
        let interval = Date().timeIntervalSince(timeUpdated)
        let minutesInInterval = interval / 60
        
        return abs(minutesInInterval) <= 30
    }
}

#Preview {
    BinStatusComponent(timeUpdated: Date().addingTimeInterval(-1700))
}
