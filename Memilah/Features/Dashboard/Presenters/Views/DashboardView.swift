//
//  dashboardView.swift
//  Memilah
//
//  Created by Clarabella Lius on 24/10/23.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var viewModel: EventViewModel
    @State private var toAddEvent = false
    @State private var toEditEvent = false
    @Binding var isLoading: Bool
    @Binding var columnVisibility: NavigationSplitViewVisibility
    
    private func addEventAction(){
        toAddEvent = true
        columnVisibility = NavigationSplitViewVisibility.detailOnly
        print("Add Event tapped")
    }
    
    private func editEventAction(){
        toEditEvent = true
        columnVisibility = NavigationSplitViewVisibility.detailOnly
        print("Edit Event tappedd")
    }
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading){
                //MARK: Title
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
                
                ZStack{
                    //MARK: Background
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(Colors.blueLight)
                        .cornerRadius(20.0)
                    
                    //MARK: Event Card Component
                    if isLoading {
                        ProgressView()
                    } else {
                        if viewModel.events.isEmpty {
                            Text("No events available")
                        } else {
                            ScrollView {
                                LazyVGrid(columns: adaptiveColumns, spacing: 30) {
                                    ForEach(viewModel.events, id: \.documentID) { event in
                                        EventCardComponent(toEditEvent: $toEditEvent, event: event)
                                            .environmentObject(viewModel)
                                        
                                    }
                                }
                                .padding(.vertical, 1)
                            }
                            .padding(.vertical, 30)
                        }
                    }
                    
                    //On Edit mode
                    if toEditEvent{
                        Button(action:{
                            toEditEvent = false
                        }){
                            Text("Save Changes")
                        }
                    }
                    
                    
                }
            }
            .padding(.top, 77)
            .navigationDestination(isPresented: $toAddEvent) {
                AddEventView()
                    .environmentObject(viewModel)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    DashboardView(isLoading: .constant(false), columnVisibility: .constant(NavigationSplitViewVisibility.detailOnly))
        .environmentObject(EventViewModel())
}
