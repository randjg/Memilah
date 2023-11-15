//
//  AddEventView.swift
//  Memilah
//
//  Created by Randy Julian on 24/10/23.
//

import SwiftUI

struct AddEventView: View {
    
    @StateObject var eventViewModel = EventViewModel()
    @StateObject var mapViewModel = MapViewModel()
    
    
    var body: some View {
        ScrollView {
                Grid(alignment: .topLeading, horizontalSpacing: 30, verticalSpacing: 41) {
                    GridRow {
                        Text("Event Name")
                            .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                        
                        TextFieldComponent(text: $eventViewModel.event.name, placeholder: "Add an event name", keyboardType: .default, returnKeyType: .next, width: 827, height: 40, axis: .vertical)
                    }
                    
                    GridRow {
                        Text("Event Description")
                            .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                            .padding(.bottom, 41)
                        
                        VStack {
                            TextFieldComponent(text: $eventViewModel.event.description, placeholder: "Add an event description", keyboardType: .default, returnKeyType: .next, width: 827, height: 80,axis: .vertical)
                                .onChange(of: eventViewModel.event.description) {
                                    if eventViewModel.event.description.count > 150 {
                                        eventViewModel.event.description = String(eventViewModel.event.description.prefix(150))
                                    }
                                }
                            
                            HStack {
                                Text("max. 150 characters")
                                    .font(.custom(Fonts.plusJakartaSansRegular, size: 14))
                                    .foregroundStyle(Color.gray)
                                Spacer()
                            }
                            .frame(maxWidth: 827)
                        }
                    }
                    
                    GridRow{
                        Text("Event Location")
                            .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                        MapComponent(isSearchFieldVisible: true, width: 827, height: 250)
                            .environmentObject(mapViewModel)
                    }
                    
                    GridRow {
                        Text("Event Date")
                            .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                        CalendarPickerComponent(startDate: $eventViewModel.event.dateStart, endDate: $eventViewModel.event.dateEnd)
                    }
                    
                    GridRow {
                        
                        SaveChangesButtonComponent(title: "Add Event", disable: checkFields()){
                            eventViewModel.addEvent(location: mapViewModel.searchTxt)
                        }
                        
                    }
                }
//            }
        }
        .toolbar(removing: .sidebarToggle)
    }
    
    func checkFields() -> Bool {
        return eventViewModel.validateEmptyFields() || mapViewModel.searchTxt.isEmpty
    }
}

#Preview {
    AddEventView()
}
