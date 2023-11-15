//
//  RootView.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 08/11/23.
//

import SwiftUI

struct RootView: View {
    @State private var isExpanded = false
    @StateObject var dashboardViewModel = DashboardViewModel()
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @State var isLoading = true
    @State var events = [EventModel]()
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List{
                DisclosureGroup(isExpanded: $isExpanded){
                    
                    //MARK: Upload events from firebase here
                    
                    ForEach(events, id: \.documentID) { event in
                        NavigationLink {
                            EventDetailView(event: event)
                        } label: {
                            Label(event.name, systemImage: "calendar")
                        }
                    }
                }label: {
                    NavigationLink {
                        DashboardView(events: $events, isLoading: $isLoading, columnVisibility: $columnVisibility)
                                .environmentObject(dashboardViewModel)
                    } label: {
                        Label("Event", systemImage: "ticket")
                    }
                }
                
                NavigationLink {
                    
                } label: {
                    Label("Profile", systemImage: "person.fill")
                }
                
                NavigationLink {
                    
                } label: {
                    Label("Notification", systemImage: "bell.fill")
                }
                
                NavigationLink {
                    
                } label: {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                
            }
            .onAppear{
                isExpanded = false
            }

            .navigationTitle("Memilah")
            .listStyle(SidebarListStyle())
        } detail: {
            DashboardView(events: $events, isLoading: $isLoading, columnVisibility: $columnVisibility)
                    .environmentObject(dashboardViewModel)
        }
        .ignoresSafeArea()
        .task {
            events = try! await dashboardViewModel.getEvents()
            isLoading = false
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}

#Preview {
    RootView()
}