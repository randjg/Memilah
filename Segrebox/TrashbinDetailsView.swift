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
        VStack{
            
            Text("Stadion Akuatik GBK") // nama Lokasi
                .bold()
                .font(.system(size: 21))
                .padding(5)
            
            Text("111-222-333-444") //UUID
                .font(.system(size: 13))
            
            if isConnected {
                PillShapeStatus(color: .green, text: "Connected")
            }
            else {
                PillShapeStatus(color: .orange, text: "Needs Checking")

            }
            
            Text("Last Updated: 20.05") //last updated dari firebase
                .italic()
                .padding(.top, 5)
            
            Image("stadion akuatik") //diganti image user input
                .resizable()
                .scaledToFit()
                .frame(width: 325, height: 170)
                .cornerRadius(10)
            
            Text("Trash bin ini terletak di dekan pintu masuk aquatic GBK") // diganti deskripsi
                .padding(.top, 5)
            
            FillLevelComponent()
            
        }
    }
}

#Preview {
    TrashbinDetailsView()
}
