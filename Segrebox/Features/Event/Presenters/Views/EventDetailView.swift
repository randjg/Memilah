//
//  EventDetailView.swift
//  Segrebox
//
//  Created by Clarabella Lius on 12/11/23.
//

import SwiftUI

struct EventDetailView: View {
    @StateObject var viewModel = TrashBinViewModel()
    @State var isButtonPressed: Bool = true
    @State var isMapViewShown: Bool = false
    @State var isListViewShown: Bool = true
    @State var showAddTrashBinModal = false
    @Binding var event: EventModel
    
//    @Binding var binStatus: binStatus
    
    var body: some View {
        
        NavigationStack{
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading){
                    //MARK: Title
                    HStack{
                        Image(systemName: "chevron.left")
                            .bold()
                        
                        Text(event.name)
                            .font(
                                Font.custom(Fonts.plusJakartaSansBold, size: 31)
                                    .weight(.bold)
                            )
                    }
                    .padding(.bottom, 3)
                    
                    Text(event.dateStart.formatDateLong() + " - " + event.dateEnd.formatDateLong())
                        .font(
                            Font.custom(Fonts.plusJakartaSansBold, size: 16)
                                .weight(.bold)
                        )
                        .fontWeight(.bold)
                        .foregroundColor(Colors.primaryInActive)
                        .padding(.bottom, 19)
                    
                    HStack{
                        
                        Button(action:{
                            showAddTrashBinModal.toggle()
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
                        
                        //MARK: Toggle button map and list view
                        HStack{
                            //Map view
                            ZStack{
                                Rectangle()
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
                            .frame(width: 30, height: 30)
                            
                            //List view
                            ZStack{
                                Rectangle()
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
                            .frame(width: 30, height: 30)
                        }
                    }
                    .padding(.bottom, 28)
                }
                .padding(.horizontal, 79)
               
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(Color(red: 0.93, green: 0.95, blue: 0.96))
                        .cornerRadius(20.0)
                    
                    if isListViewShown {
                        ScrollView {
                            VStack(spacing: 50){
                                ForEach(viewModel.trashBins, id: \.documentID) { bin in
                                    //ISI TRASH BIN DISINI
                                    BinCardComponent(trashbin: bin)
                                }
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showAddTrashBinModal, content: {
                AddTrashBinView(event: $event)
            })
        }
    }
}


#Preview {
    EventDetailView(
        event: .constant(EventModel(
            documentID: "ythi0zFLYayMh9d3fwGL",
            name: "t",
            description: "t",
            location: "t",
            dateEnd: Date(),
            dateStart: Date()
        )) 
//        binStatus: .constant(.connected)
    )
}
