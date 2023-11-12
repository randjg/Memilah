//
//  dashboardView.swift
//  Segrebox
//
//  Created by Clarabella Lius on 24/10/23.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var viewModel = DashboardViewModel()
    @State private var toAddEvent = false
    @State private var toEditEvent = false
    
    private func addEventAction(){
        toAddEvent = true
        print("Add Event tapped")
    }
    
    private func editEventAction(){
        toEditEvent = true
        print("Edit Event tapped")
    }
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    var body: some View {
        
        NavigationStack {
            GeometryReader{ geometry in
                VStack(alignment: .leading){
                    //MARK: Title
                    
                    Text("Test print")
                    
                    Group {
                        Text("Dashboard")
                            .font(
                                Font.custom(Fonts.plusJakartaSansBold, size: 31)
                                    .weight(.bold)
                            )
                            .padding(.bottom, 23)
                        
                        HStack(spacing: 25){
                            //MARK: Add Event button
                            Button("Add Event"){
                                addEventAction()
                            }
                            .buttonStyle(PrimaryButtonStyle(textPlaceholder: "Click me", action: addEventAction))
                            
                            //MARK: Edit events
                            Button("Edit Event"){
                                editEventAction()
                            }
                            .buttonStyle(SecondaryButtonStyle(textPlaceholder: "Edit Event", action: editEventAction))
                        }
                        .padding(.bottom, 26)
                    }
                    .padding(.leading, 79)
                    
                    ZStack() {
                        //MARK: Background
                        Rectangle()
                            .foregroundColor(.clear)
                            .background(Colors.blueLightActive)
                            .cornerRadius(20.0)
                        
                        //MARK: Event Card Component
                        ScrollView {
                            LazyVGrid(columns: adaptiveColumns, spacing: 30) {
                                ForEach(viewModel.events, id: \.documentID) { event in
                                    EventCardComponent(event: event)
                                }
                            }
                        
                        }
                        .padding(.vertical, 30)
                    }
                }
                .padding(.top, 55)
                .navigationDestination(isPresented: $toAddEvent) {
                    AddEventView()
                }
            }
            .ignoresSafeArea()
        }
        .task {
            try? await viewModel.getEvents()
        }
    }
}

#Preview {
    DashboardView()
}
