//
//  CalendarPickerComponent.swift
//  Segrebox
//
//  Created by Randy Julian on 01/11/23.
//

import SwiftUI

struct CalendarPickerComponent: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 13)
                .frame(width: 320, height: 310)
                .foregroundColor(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 30)
            
            DatePicker(
                "Pick a date",
                selection: $selectedDate,
                displayedComponents: .date
            )
            .frame(width: 305, height: 305)
            .datePickerStyle(GraphicalDatePickerStyle())
        }
    }
}

#Preview {
    CalendarPickerComponent()
}

