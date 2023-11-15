//
//  TrashbinDetailsView.swift
//  Memilah
//
//  Created by Kevin Christanto on 23/10/23.
//

import SwiftUI

struct TrashbinDetailsView: View {
    
    //ambil true and false nya di sensor
    @State private var isConnected = true
    @Binding var trashBin: TrashBinModel
    @StateObject var viewModel = TrashBinViewModel()
    @State var trashBinImage: UIImage?
    
    var body: some View {
//        NavigationView {
            VStack{
                
                Text(trashBin.name) // nama Lokasi
                    .font(.custom(Fonts.plusJakartaSansBold, size: 21))
//                    .foregroundStyle(Colors.adaptiveFontColor)
                    .padding(.bottom, 10)
                
                Text(trashBin.documentID!) //UUID
                    .font(.custom(Fonts.plusJakartaSansRegular, size: 13))
                    .padding(.bottom, 5)
                
                if isConnected {
                    BinStatusComponent()
                        .padding(.bottom, 5)
                }
                else {
                    BinStatusComponent()
                        .padding(.bottom, 5)

                }
                
                
                Text(trashBin.timeUpdated.formatDateLong()) //last updated dari firebase
                    .font(.custom("PlusJakartaSans-Italic", size: 13))
                    .padding(.bottom, 20)
                
                if let trashBinImage = trashBinImage {
                    Image(uiImage: trashBinImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 235, height: 170)
                        .cornerRadius(10)
                } else {
                    ProgressView {
                        Text("Image Unavailable")
                    }
                    .controlSize(.large)
                }
                
                Text(trashBin.detail) // diganti deskripsi
                    .font(.custom(Fonts.plusJakartaSansRegular, size: 13))
                    .padding(.top, 20)
                    .padding(.bottom, 22)
                    .frame(maxWidth: 300)
                    .multilineTextAlignment(.center)
                    .lineSpacing(2)
                
                FillLevelComponent(trashBin: $trashBin)
                
            }
            .onAppear {
                viewModel.getImage(imagePath: trashBin.imageUrl) { image in
                    trashBinImage = image
                }
            }
        }
//        .navigationBarTitle("Trash Bin Details", displayMode: .inline)
//    }
}

#Preview {
    TrashbinDetailsView(trashBin: .constant(
        TrashBinModel(documentID: "A0:B7:65:5A:DA:44", name: "Stadion Akuatik GBK", detail: "Trash bin ini terletak di dekan pintu masuk aquatic GBK", imageUrl: "trash-bins/E17639C0-0E31-407D-8CD7-C55CC5587E09.jpeg", latitude: 0.1, longitude: 0.1, levelOthers: 0.7, levelPlastic: 0.8, levelPaper: 0.5, objectDetected: false, event: nil, detectionResult: nil, timeUpdated: Date())
    ))
}
