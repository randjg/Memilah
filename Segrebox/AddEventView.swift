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
        HStack {
            VStack(alignment: .leading){
                HStack{
                    Text("Event Name")
                        .font(.custom("PlusJakartaSans-Bold", size: 21))
                        .padding(.bottom, 41)
                        
//                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    
                    TextFieldComponent(text: $eventname, placeholder: "Add an event name", keyboardType: .default, returnKeyType: .next, width: 827, height: 40, axis: .vertical)
                        .padding(.bottom, 41)
                        .padding(.leading, 70)
//                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                }
                HStack{
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
                    .padding(.bottom, 12)
                    .padding(.leading, 11)
                }
                HStack{
                    Text("Event Location")
                        .font(.custom("PlusJakartaSans-Bold", size: 21))
                        .padding(.bottom, 41)
                }
                HStack {
                    Text("Event Date")
                        .font(.custom("PlusJakartaSans-Bold", size: 21))
                        .padding(.bottom, 41)
                }
            }
            
//            VStack(alignment: .leading){
//                HStack{
//
//                    
//                }
//                HStack{
//                    TextFieldComponent(text: $eventdesc, placeholder: "Add an event description", keyboardType: .default, returnKeyType: .next, width: 827, height: 40)
//                        .padding(.bottom, 30)
//                }
//                HStack{
//                    Text("Event Location")
//                        .padding(.bottom, 41)
//                }
//                HStack {
//                    Text("Event Date")
//                        .padding(.bottom, 41)
//                }
//            }
//            .padding(.leading, 24)
        }
    }
}

#Preview {
    AddEventView()
}
