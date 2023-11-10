//
//  CalendarPickerComponent.swift
//  Segrebox
//
//  Created by Randy Julian on 01/11/23.
//

import SwiftUI

struct CalendarPickerComponent: View {
    @Binding var startDate:Date
    @Binding var endDate:Date
    
    var body: some View {
        VStack {
            DatePicker(selection: $startDate, displayedComponents: .date) {
                Text("Start Date")
            }
            .onChange(of: startDate) { oldValue, newValue in
                endDate = startDate
            }
            
            
            DatePicker(selection: $endDate, in: startDate... , displayedComponents: .date) {
                Text("End Date")
            }
        }
        .frame(width: 300)
        
    }
}

#Preview {
    CalendarPickerComponent(startDate: .constant(Date()), endDate: .constant(Date()))
}

