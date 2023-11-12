//
//  EventDetailView.swift
//  Segrebox
//
//  Created by Clarabella Lius on 12/11/23.
//

import SwiftUI

struct EventDetailView: View {
    
    @State var isButtonPressed: Bool = false
    @State var isMapViewShown: Bool = false
    @State var isListViewShown: Bool = false
    
    var body: some View {
        
        NavigationStack{
            GeometryReader{ geometry in
                
                VStack(alignment: .leading) {
                    //MARK: Title
                    Text("Konser Pestapora")
                        .font(
                            Font.custom(Fonts.plusJakartaSansBold, size: 31)
                                .weight(.bold)
                        )
                        .padding(.bottom, 3)
                    
                    Text("20 September 2023 - 23 September 2023")
                        .font(
                            Font.custom(Fonts.plusJakartaSansBold, size: 16)
                                .weight(.bold)
                        )
                        .fontWeight(.bold)
                        .foregroundColor(Colors.primaryInActive)
                        .padding(.bottom, 19)
                    
                    HStack{
                    
                        Button(action:{
                            EmptyView()
                        }){
                            Text("Add Trash Bin")
                                .font(
                                    Font.custom(Fonts.plusJakartaSansBold, size: 20)
                                        .weight(.bold)
                                )
                                .padding(.horizontal, 49)
                                .padding(.vertical, 10)
                                .foregroundColor(Colors.greyDarker)
                                .background(Colors.blueLightActive)
                                .cornerRadius(8.0)
                                .brightness(isButtonPressed ? 0.05 : 0.0)
                        }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        //MARK: Toggle button map and list view
                        HStack{
                            //Map view
                            ZStack{
                                Rectangle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Colors.greyLight)
                                    .padding(.trailing, 21)
                                    .cornerRadius(5)
                                    .opacity(isMapViewShown ? 100 : 0)
                                
                                Button(action: {
                                    isMapViewShown = true
                                    isListViewShown = false
                                    print("map icon clicked")
                                }){
                                    Images.mapIcon
                                        .padding(.trailing, 21)
                                }
                                
                            }
                            
                            //List view
                            ZStack{
                                Rectangle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Colors.greyLight)
                                    .cornerRadius(5)
                                    .opacity(isListViewShown ? 100 : 0)
                               
                                Button(action: {
                                    isListViewShown = true
                                    isMapViewShown = false
                                    print("list icon clicked")
                                }){
                                    Images.listIcon
                                }
                            }
                        }
                    
                        Spacer()
                        
                    }
                    
                    
                }
                .padding(.top, 5)
                .padding(.bottom, 28)
                .padding(.leading, 79)
                
                
                //MARK: Background
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(Color(red: 0.93, green: 0.95, blue: 0.96))
                        .cornerRadius(20.0)
                        .frame(width: 1194, height: 631)
                        .padding(.top, 204)
                    
                    
                }
            }
            
            
        }
        
        
        
    }
}

#Preview {
    EventDetailView()
}