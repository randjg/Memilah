//
//  dashboardView.swift
//  Segrebox
//
//  Created by Clarabella Lius on 24/10/23.
//

import SwiftUI

struct DashboardView: View {
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
    
    
    var body: some View {
        
        NavigationStack {
            GeometryReader{ geometry in
                
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
                            .background(Colors.blueLightActive)
                            .cornerRadius(20.0)
                        
                        //MARK: Event Card Component
                        
                        Grid(){
                            GridRow{
                                EventCardComponent()
                                EventCardComponent()
                                EventCardComponent()
                            }
                            GridRow{
                                EventCardComponent()
                                EventCardComponent()
                                EventCardComponent()
                            }
                        }
                        .frame(height: 631)
                    }
                }
                .padding(.top, 55)
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $toAddEvent) {
                AddEventView()
            }
        }
    }
}

#Preview {
    DashboardView()
}
