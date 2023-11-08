//
//  TrashbinDetailsView.swift
//  Segrebox
//
//  Created by Kevin Christanto on 23/10/23.
//

import SwiftUI

struct TrashbinDetailsView: View {
    
    //ambil true and false nya di sensor
    @State private var isConnected = true
    
    var body: some View {
//        NavigationView {
            VStack{
                
                Text("Stadion Akuatik GBK") // nama Lokasi
                    .font(.custom("PlusJakartaSans-Bold", size: 21))
//                    .foregroundStyle(Colors.adaptiveFontColor)
                    .padding(.bottom, 10)
                
                Text("111-222-333-444") //UUID
                    .font(.custom("PlusJakartaSans-Regular", size: 13))
                    .padding(.bottom, 5)
                
                if isConnected {
                    PillShapeStatus(color: Color(red: 0.09, green: 0.7, blue: 0.39), text: "Connected")
                        .padding(.bottom, 5)
                }
                else {
                    PillShapeStatus(color: Color(red: 0.86, green: 0.49, blue: 0.19), text: "Needs Checking")
                        .padding(.bottom, 5)

                }
                
                
                Text("Last Updated: 20.05") //last updated dari firebase
                    .font(.custom("PlusJakartaSans-Italic", size: 13))
                    .padding(.bottom, 20)
                
                Image("image 4") //diganti image user input
                    .resizable()
                    .scaledToFit()
                    .frame(width: 235, height: 170)
                    .cornerRadius(10)
                
                Text("Trash bin ini terletak di dekan pintu masuk aquatic GBK") // diganti deskripsi
                    .font(.custom("PlusJakartaSans-Regular", size: 13))
                    .padding(.top, 20)
                    .padding(.bottom, 22)
                    .frame(maxWidth: 300)
                    .multilineTextAlignment(.center)
                    .lineSpacing(2)
                
                FillLevelComponent()
                
            }
        }
//        .navigationBarTitle("Trash Bin Details", displayMode: .inline)
//    }
}

#Preview {
    TrashbinDetailsView()
}
