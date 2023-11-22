//
//  EditEventView.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 11/11/23.
//

import SwiftUI

struct EditEventView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var eventViewModel: EventViewModel
    @StateObject var mapViewModel = MapViewModel()
    @Binding var eventToEdit: EventModel
    
    var body: some View {
       
        NavigationStack{
            VStack(alignment: .leading){
                //Header Add Event
                HStack{
                    Button(action:{
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        HStack{
                            Image(systemName: "chevron.left")
                                .bold()
                                .padding(.trailing, 5)

                            
                            Text("Edit Event")
                                .font(
                                    Font.custom(Fonts.plusJakartaSansBold, size: 31)
                                        .weight(.bold)
                                )
                        }
                        .padding(.bottom, 32)
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                }.padding(.leading, 63)
            }
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    if eventViewModel.nameIsExist {
                        Text("⚠️ Event with the same name already exists. Please enter a new event")
                            .foregroundStyle(.red)
                            .bold()
                    }
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
                            
                            SaveChangesButtonComponent(title: "Edit Event", disable: checkFields()){
                                Task {
                                    await eventViewModel.updateEvent(eventToEditName: eventToEdit.name, location: mapViewModel.searchTxt)
                                    eventToEdit = eventViewModel.event
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            }
                            
                        }
                    }
                }
            }
            .onAppear {
                eventViewModel.event = eventToEdit
                mapViewModel.searchTxt = eventToEdit.location
            }
            .onDisappear() {
//                Task {
//                    try! await eventViewModel.getEvents()
//                    eventToEdit = eventViewModel.event
//                }
            }

        }.navigationBarBackButtonHidden(true)
    }
    
    func checkFields() -> Bool {
        return eventViewModel.validateEmptyFields() || mapViewModel.searchTxt.isEmpty
    }
}

#Preview {
    EditEventView(eventToEdit: .constant(.dummy))
        .environmentObject(EventViewModel())
}
