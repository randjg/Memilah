//
//  RootView.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 08/11/23.
//

import SwiftUI

struct RootView: View {
    @State private var isExpanded = false
    @StateObject var viewModel = EventViewModel()
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @State var isLoading = true
    @State private var defaultView = true
//    @Binding var isDarkMode: Bool
    var body: some View {
        
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List{
                DisclosureGroup(isExpanded: $isExpanded){
                    
                    //MARK: Upload events from firebase here
                    
                    ForEach(viewModel.events, id: \.documentID) { event in
                        NavigationLink {
                            EventDetailView(event: event)
                        } label: {
                            Label(event.name, systemImage: "calendar")
                        }
                    }
                }label: {
                    NavigationLink {
                        DashboardView(isLoading: $isLoading, columnVisibility: $columnVisibility)
                                .environmentObject(viewModel)
                    } label: {
                        Label("Event", systemImage: "ticket")
                    }
                }
                
                NavigationLink {
                    ProfileView()
                } label: {
                    Label("Profile", systemImage: "person.fill")
                }
                
                NavigationLink {
                    NotificationView() // has not fully functional
                } label: {
                    Label("Notification", systemImage: "bell.fill")
                }
                
                NavigationLink {
                    SettingsView()
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
            DashboardView(isLoading: $isLoading, columnVisibility: $columnVisibility)
                    .environmentObject(viewModel)
        }
        .ignoresSafeArea()
        .onAppear {
            Task {
                try! await viewModel.getEvents()
                isLoading = false
            }
        }
        .navigationBarBackButtonHidden(true)
//        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
    
}

#Preview {
    RootView()
//    RootView(isDarkMode: .constant(true))
}
