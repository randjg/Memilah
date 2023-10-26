//
//  ContentView.swift
//  Segrebox
//
//  Created by Randy Julian on 21/10/23.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    
    @StateObject var mapData = MapViewModel()
    
    @State var locationManager = CLLocationManager()
    
    var body: some View {
        Text("Hello, Custom Font!")
            .font(.custom("PlusJakartaSans-Regular", size: 24))
        
        ZStack{
            MapView()
                .environmentObject(mapData)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack{
                VStack(spacing: 0){
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.gray)
                        
                        TextField("Search", text: $mapData.searchTxt)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.white)
                    
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
                    }
                }
                
                .padding()
                
                Spacer()
                
                VStack{
                    Button(action: mapData.focusLocation, label: {
                        Image(systemName: "location.fill")
                            .font(.title2)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    })
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            }
        }
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
    ContentView()
}
