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
                VStack(alignment: .leading){
                    HStack{
                        Text("Event Name")
                            .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                            .padding(.bottom, 41)
                            
    //                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        
                        TextFieldComponent(text: $eventname, placeholder: "Add an event name", keyboardType: .default, returnKeyType: .next, width: 827, height: 40, axis: .vertical)
                            .padding(.bottom, 41)
                            .padding(.leading, 60)
    //                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    }
                    HStack{
                        Text("Event Description")
                            .font(.custom(Fonts.plusJakartaSansBold, size: 21))
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
                                    .font(.custom(Fonts.plusJakartaSansRegular, size: 14))
                                    .foregroundStyle(Color.gray)
                                Spacer()
                            }
                            .frame(width: 827)
                        }
                        .padding(.bottom, 12)
                        .padding(.leading, 11)
                    }
                    HStack{
                        VStack {
                            Text("Event Location")
                                .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                            .padding(.bottom, 41)
                        }
                        VStack {
                            MapComponent(isSearchFieldVisible: true, width: 827, height: 133)
                                .padding(.leading, 35)
                        }
                        .padding(.bottom, 41)
                    }
                    HStack {
                        VStack {
                            Text("Event Date")
                                .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                            Spacer()
                        }
                        
                        VStack{
                            CalendarPickerComponent()
                                .padding(.leading, 70)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddEventView()
}