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
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 96, height: 27)
                .foregroundColor(binStatusColor())
                .cornerRadius(50)
            
            switch binStatus {
            case .needsChecking:
                Text("Needs Checking")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 13))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 16)
                    .foregroundColor(.white)
                   
            case .connected:
                Text("Connected")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 13))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 16)
                    .foregroundColor(.white)
                
            }
            
        }
    }
    
    private func binStatusColor() -> Color{
        switch binStatus {
        case .needsChecking:
            return Color(Colors.orangeNormal)
        case .connected:
            return Color(Colors.greenOngoing)
        }
    }
}

#Preview {
    BinStatusComponent()
}
