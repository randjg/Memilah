//
//  MapComponent.swift
//  Segrebox
//
//  Created by Randy Julian on 01/11/23.
//

import SwiftUI
import CoreLocation
import MapKit
struct MapComponent: View {
    
    @EnvironmentObject var mapData: MapViewModel
    
    @State var locationManager = CLLocationManager()
    
    @State var isSearchFieldVisible: Bool
    var width: CGFloat
    var height: CGFloat
    //    var search: Bool
    
    var body: some View {
        VStack {
            if isSearchFieldVisible == true {
                ZStack {
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.gray)
                        
                        TextField("Search", text: $mapData.searchTxt)
                            .font(.custom(Fonts.plusJakartaSansRegular, size: 21))
                            .textContentType(.none)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .frame(height: 40)
                    .frame(maxWidth: width)
                    .padding(.leading, 10)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 0.78, green: 0.88, blue: 0.82), lineWidth: 2))
                }
            }
            
            ZStack{
                MapView()
                    .environmentObject(mapData)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
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
                if !mapData.places.isEmpty && mapData.searchTxt != ""{
                    VStack{
                        ScrollView{
                            VStack(spacing: 0){
                                ForEach(mapData.places){ place in
                                    Text(place.place.name ?? "")
                                        .foregroundStyle(Color.black)
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                        .padding(.leading)
                                        .onTapGesture{
                                            mapData.selectPlace(place: place)
                                        }
                                        .padding(.vertical, 5)
                                    Divider()
                                }
                            }
                        }
                        .frame(height: 100)
                        .background(Color.white)
                        .shadow(radius: 4, x: 0, y: 4)
                        Spacer()
                    }
//                    .frame(height: 200)
//                    .padding(.top, 140)
                }
            }
            .frame(width: width, height: 133)
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
        .environmentObject(MapViewModel())
}
