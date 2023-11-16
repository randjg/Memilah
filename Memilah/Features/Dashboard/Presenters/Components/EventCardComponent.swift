//
//  CardComponent.swift
//  Memilah
//
//  Created by Clarabella Lius on 24/10/23.
//

import SwiftUI

struct EventCardComponent: View {
    var event: EventModel
    @Binding var toEditEvent: Bool
//    @State private var isNavigationActive = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Colors.greyCardBorder, lineWidth: 1.5)
                )
            
            if toEditEvent == true{
                //MARK: Edit and Delete Buttons
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        
                        //Edit
                        Button(action:{
                            print("edit button clicked")
                        }){
                            Image(systemName: "pencil.line")
                            .frame(width: 22, height: 18)
                            .padding(5)
                            .foregroundColor(Colors.greyDark)
                        }
                        
                        //Delete
                        Button(action:{
                            print("delete button clicked")
                        }){
                            Image(systemName: "trash.fill")
                            .frame(width: 22, height: 27)
                            .padding(5)
                            .foregroundColor(Colors.redNormal)
                        }
                        
                    }
                    .padding(.trailing, 3)
                }
            }
            //MARK: Card as a button
            NavigationLink(destination: EventDetailView( event: event)){
                Button(action:{
                    EventDetailView(event: event)
                    print("card clicked")
                }){
                    eventBody()
                        .foregroundColor(.black)
                }
            }
            
        }
        .frame(width: 345, height: 226)
    }
    
    private func eventBody() -> some View {
        VStack(alignment: .leading){
            
            HStack{
                //MARK: Event name
                Text(event.name)
                    .font(.custom(Fonts.plusJakartaSansBold, size: 21))
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
        ),
         toEditEvent: .constant(false)
    )
}
