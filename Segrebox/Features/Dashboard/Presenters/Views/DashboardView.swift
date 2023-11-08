//
//  dashboardView.swift
//  Segrebox
//
//  Created by Clarabella Lius on 24/10/23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        
        GeometryReader{ geometry in
            
            VStack(alignment: .leading){
                //MARK: Title
                Text("Dashboard")
                    .font(
                        Font.custom("PlusJakartaSans-Bold", size: 31)
                            .weight(.bold)
                    )
                    .padding(.bottom, 23)
                
                
                HStack(spacing: 25){
                    
                    //MARK: Add Event button
                    Button("Add Event"){
                        
                    }
                    .buttonStyle(PrimaryButtonStyle(textPlaceholder: "Click me"))
                    .padding(.bottom, 657)
                    
                    //MARK: Edit events
                    Button("Edit Event"){
                        
                    }
                    .buttonStyle(SecondaryButtonStyle(textPlaceholder: "Edit Event"))
                    .padding(.bottom, 657)

                    
                }
            }
            .padding(.top, 5)
            .padding(.leading, 79)

            
            //MARK: Background
            Rectangle()
                .foregroundColor(.clear)
                .background(Color(red: 0.93, green: 0.95, blue: 0.96))
                .cornerRadius(20.0)
                .frame(width: 1194, height: 631)
                .padding(.top, 185)
                
            
        }
        
    }
}

#Preview {
    DashboardView()
}
