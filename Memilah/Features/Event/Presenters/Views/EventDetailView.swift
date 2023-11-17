//
//  EventDetailView.swift
//  Memilah
//
//  Created by Clarabella Lius on 12/11/23.
//

import MapKit
import SwiftUI

struct EventDetailView: View {
    @StateObject var viewModel = TrashBinViewModel()
    @State var isButtonPressed: Bool = true
    @State var isListViewShown: Bool = false
    @State var showAddTrashBinModal = false
    @State var trashBins = [TrashBinModel]()
    var event: EventModel
    
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
                                    .opacity(!isListViewShown ? 100 : 0)
                                
                                Button(action: {
//                                    isMapViewShown = true
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
//                                    isMapViewShown = false
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
                    
                    Text("No trashbins")
                    
                    if isListViewShown {
                        ScrollView {
                            VStack(spacing: 50){
                                ForEach(trashBins, id: \.documentID) { bin in
                                    //ISI TRASH BIN DISINI
                                    BinCardComponent(trashBin: bin)
                                        .environmentObject(viewModel)
                                }
                            }
                        }
                    } else {
//                        MapView()
                        Map(){
                            ForEach(trashBins, id: \.documentID) { bin in
                                Marker(bin.name, systemImage: "trash.fill", coordinate: CLLocationCoordinate2D(latitude: bin.latitude ?? 106.802117, longitude: bin.longitude ?? -6.217588))
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.vertical, 45)
                        .padding(.horizontal, 104)
                    }
                }
            }
            .padding(.top, 55)
            .ignoresSafeArea()
            .sheet(isPresented: $showAddTrashBinModal, content: {
                AddTrashBinView(event: event)
            })
            .task {
                do {
                    trashBins = try await viewModel.getEvenTrashBins(eventID: event.documentID!)
                } catch {
                    print(error)
                }
            }
        }
    }
}


#Preview {
    EventDetailView(
        event: .dummy
    )
}
