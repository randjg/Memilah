//
//  CardComponent.swift
//  Segrebox
//
//  Created by Clarabella Lius on 24/10/23.
//

import SwiftUI

struct EventCardComponent: View {
    
    var event: EventModel
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Colors.greyCardBorder, lineWidth: 1.5)
                )
            
            VStack(alignment: .leading){
                
                HStack{
                    //MARK: Event name
                    Text(event.name)
                        .font(.custom("PlusJakartaSans-Bold", size: 21))
                    Spacer()
                    
                    //MARK: Status
                    StatusComponent(eventDate: event.dateStart)
                        .padding(.trailing, 13)
                }
                .padding(.top, 16)
                .padding(.bottom, 9)
                
                //MARK: Description
                
                Text(event.description)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 299, alignment: .topLeading)
                    .lineLimit(5)
                    .padding(.bottom, 1)
                
                
                //MARK: Location
                HStack(alignment: .center, spacing: 5){
                    Text("📍")
                    
                    Text(event.location)
                }.padding(.bottom, 1)
                
                //MARK: Bins
                HStack(alignment: .center, spacing: 5){
                    Text("🗑️")
                    
                    Text("10 bins")
                }.padding(.bottom, 1)
                
                //MARK: Date range
                HStack(alignment: .center, spacing: 5){
                    Text("📆")
                    
                    HStack{
                        Text(event.dateStart.formatDate()) +
                        Text(" - ") +
                        Text(event.dateEnd.formatDate())
                    }
                    
                } .padding(.bottom, 27)
                
                
            }.padding(.horizontal, 13)
        }
        .frame(width: 345, height: 226)
    }
}

#Preview {
    EventCardComponent(
        event: EventModel(
            documentID: "ythi0zFLYayMh9d3fwGL",
            name: "t",
            description: "t",
            location: "t",
            dateEnd: Date(),
            dateStart: Date()
        )
    )
}
