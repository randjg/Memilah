//
//  AddEventView.swift
//  Segrebox
//
//  Created by Randy Julian on 24/10/23.
//

import SwiftUI

struct AddEventView: View {
    
    @State private var eventname = ""
    @State private var eventdesc = ""
    
    var body: some View {
        ScrollView {
            HStack {
                Grid(alignment: .leading, horizontalSpacing: 30, verticalSpacing: 41) {
                    GridRow {
                        Text("Event Name")
                            .font(.custom("PlusJakartaSans-Bold", size: 21))
                        
                        TextFieldComponent(text: $eventname, placeholder: "Add an event name", keyboardType: .default, returnKeyType: .next, width: 827, height: 40, axis: .vertical)
                    }
                    
                    GridRow {
                        Text("Event Description")
                            .font(.custom("PlusJakartaSans-Bold", size: 21))
                            .padding(.bottom, 41)
                        
                        VStack {
                            TextFieldComponent(text: $eventdesc, placeholder: "Add an event description", keyboardType: .default, returnKeyType: .next, width: 827, height: 80,axis: .vertical)
        //                        .multilineTextAlignment(.leading)
                                .onChange(of: eventdesc) {
                                    if eventdesc.count > 150 {
                                        eventdesc = String(eventdesc.prefix(150))
                                    }
                                }
                            
                            HStack {
                                Text("max. 150 characters")
                                    .font(.custom("PlusJakartaSans-Regular", size: 14))
                                    .foregroundStyle(Color.gray)
                                Spacer()
                            }
                            .frame(width: 827)
                        }
                    }
                    .padding(.bottom, 10)
                    
                    GridRow{
                        Text("Event Location")
                            .font(.custom("PlusJakartaSans-Bold", size: 21))
                        MapComponent(isSearchFieldVisible: true, width: 827, height: 133)
                    }
                    
                    GridRow {
                        VStack {
                            Text("Event Date")
                                .font(.custom("PlusJakartaSans-Bold", size: 21))
                            Spacer()
                        }
                        CalendarPickerComponent()
                    }
                }
            }
        }
    }
}

#Preview {
    AddEventView()
}
