//
//  MapComponent.swift
//  Segrebox
//
//  Created by Randy Julian on 01/11/23.
//

import SwiftUI
import CoreLocation

struct MapComponent: View {
    
    @StateObject var mapData = MapViewModel()
    
    
    @State var locationManager = CLLocationManager()
    
    @State var isSearchFieldVisible: Bool
    
    var width: CGFloat
    var height: CGFloat
//    var search: Bool
    
    var body: some View {
        ZStack{
            MapView()
                .environmentObject(mapData)
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            if isSearchFieldVisible == true {
                VStack{
                    VStack(spacing: 0){
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(Color.gray)
                            
                            TextField("Search", text: $mapData.searchTxt)
                                .font(.custom(Fonts.plusJakartaSansRegular, size: 15))
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.8).cornerRadius(10))
                        .padding(.top, -70)
                        Spacer()
                        
                        if !mapData.places.isEmpty && mapData.searchTxt != ""{
                            ScrollView{
                                VStack(spacing: 15){
                                    ForEach(mapData.places){ place in
                                        Text(place.place.name ?? "")
                                            .foregroundStyle(Color.black)
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            .padding(.leading)
                                            .onTapGesture{
                                                mapData.selectPlace(place: place)
                                            }
                                        
                                        Divider()
                                    }
                                }
                                .padding(.top)
                            }
                            .background(Color.white)
                            .frame(height: 200)
                        }
                    }
                }
                .padding()
                
            }
            VStack{
                Spacer()
                VStack{
                    Button(action: mapData.focusLocation, label: {
                        Image(systemName: "location.fill")
                            .font(.system(size: 15))
                            .padding(5)
                            .background(Color.white)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    })
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            }
        }

        .frame(maxWidth: width)
        .frame(maxHeight: height)
        .onAppear(perform: {
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        })
        .alert(isPresented: $mapData.permissionDenied, content: {
            Alert(title: Text("Permission Denied"), message: Text("Please enable the permission in settings"),dismissButton: .default(Text("Go to settings"), action: {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }))
        })
        .onChange(of: mapData.searchTxt, perform: { value in
            let delay = 0.3
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay){
                if value == mapData.searchTxt{
                    self.mapData.searchQuery()
                }
            }
        })
    }
}



#Preview {
    MapComponent(isSearchFieldVisible: true, width: 900, height: 300)
}
