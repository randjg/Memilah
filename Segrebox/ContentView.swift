//
//  ContentView.swift
//  Segrebox
//
//  Created by Randy Julian on 21/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isExpanded = false
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .leading){
                List{
                    DisclosureGroup(isExpanded: $isExpanded){
                        
                        //MARK: Upload events from firebase here
                        Label("Event name 1", systemImage: "calendar")
                    }label: {
                        Label("Event", systemImage: "ticket")
                    }
                    
                    Label("Profile", systemImage: "person.fill")
                    Label("Notification", systemImage: "bell.fill")
                    Label("Settings", systemImage: "gearshape.fill")
                    
                }
                .navigationTitle("Segrebox")
                .listStyle(SidebarListStyle())
                
            }
            DashboardView()
        }
    }
}

#Preview {
    ContentView()
}
