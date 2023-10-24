//
//  CardComponent.swift
//  Segrebox
//
//  Created by Clarabella Lius on 24/10/23.
//

import SwiftUI

struct EventCardComponent: View {
    
    var body: some View {
        GeometryReader{ geometry in
            
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 345, height: 226)
              .cornerRadius(10)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(Color("Card-border"), lineWidth: 1.5)
              )
            
            VStack(alignment: .leading){
                
                HStack{
                    //MARK: Event name
                    Text("Konser Pestapora")
                        .font(.custom("PlusJakartaSans-Bold", size: 21))
                    
                    //MARK: Status
                    Text("Status")
                        .padding(.trailing, 13)
                }
                .padding(.top, 16)
                .padding(.bottom, 9)
                
                //MARK: Description

                    Text("Pestapora merupakan event musik besar nasional yang digelar secara tahunan")
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: 299, alignment: .topLeading)
                        .lineLimit(5)
                        .padding(.bottom, 1)
                
                
                //MARK: Location
                HStack(alignment: .center, spacing: 5){
                    Text("📍")

                    Text("Location")
                }.padding(.bottom, 1)
                
                //MARK: Bins
                HStack(alignment: .center, spacing: 5){
                    Text("🗑️")
                    
                    Text("10 bins")
                }.padding(.bottom, 1)
                
                //MARK: Date range
                HStack(alignment: .center, spacing: 5){
                    Text("📆")
                    
                    Text("20 Sept 2023 - 22 Sept 2023")
                       
                } .padding(.bottom, 27)
                
                
            }.padding(.leading, 13)
            
        }
    }
}

#Preview {
    EventCardComponent()
}
