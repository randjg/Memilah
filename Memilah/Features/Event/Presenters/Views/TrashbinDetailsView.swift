//
//  TrashbinDetailsView.swift
//  Memilah
//
//  Created by Kevin Christanto on 23/10/23.
//

import SwiftUI
import Kingfisher

struct TrashbinDetailsView: View {
    
    //ambil true and false nya di sensor
    @State private var isConnected = true
    @Binding var trashBin: TrashBinModel?
    @StateObject var viewModel = TrashBinViewModel()
//    @State var trashBinImage: Data?
    @State var trashBinImageURL: URL?
    var body: some View {
//        NavigationView {
            VStack{
                
                Text(trashBin!.name) // nama Lokasi
                    .font(.custom(Fonts.plusJakartaSansBold, size: 21))
//                    .foregroundStyle(Colors.adaptiveFontColor)
                    .padding(.bottom, 10)
                
                Text(trashBin!.documentID!) //UUID
                    .font(.custom(Fonts.plusJakartaSansRegular, size: 13))
                    .padding(.bottom, 5)
                
                if isConnected {
                    BinStatusComponent(timeUpdated: trashBin!.timeUpdated?.convertFromFirestoreToDate() ?? Date())
                        .padding(.bottom, 5)
                }
                else {
                    BinStatusComponent(timeUpdated: trashBin!.timeUpdated?.convertFromFirestoreToDate() ?? Date())
                        .padding(.bottom, 5)

                }
                
                
                Text(trashBin!.getTimeUpdatedDate()?.formatDateLong() ?? "") //last updated dari firebase
                    .font(.custom("PlusJakartaSans-Italic", size: 13))
                    .padding(.bottom, 20)
                
//                if let trashBinImage, let image = UIImage(data: trashBinImage) {
//                    Image(uiImage: image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 235, height: 170)
//                        .cornerRadius(10)
//                } else {
//                    ProgressView {
//                        Text("Image Unavailable")
//                    }
//                    .controlSize(.large)
//                }
                
                KFImage(URL(string: trashBin!.imageUrl))
                    .placeholder({
                        ProgressView {
                            Text("Image Unavailable")
                        }
                        .controlSize(.large)
                    })
                    .resizable()
                    .scaledToFit()
                    .frame(width: 235, height: 170)
                    .cornerRadius(10)
                
                Text(trashBin!.detail) // diganti deskripsi
                    .font(.custom(Fonts.plusJakartaSansRegular, size: 13))
                    .padding(.top, 20)
                    .padding(.bottom, 22)
                    .frame(maxWidth: 300)
                    .multilineTextAlignment(.center)
                    .lineSpacing(2)
                
                FillLevelComponent(trashBin: $trashBin)
                
            }
            .onAppear {
//                Task {
//                    let imageData = try? await viewModel.getImage(imagePath: trashBin.imageUrl)
//                    trashBinImage = imageData
//                }
//                viewModel.getImage(imagePath: trashBin!.imageUrl) { data in
//                    trashBinImage=data
//                viewModel.getImageDownloadURL(imagePath: trashBin!.imageUrl) { url in
//                        trashBinImageURL = url
//                }
            }
        }
//        .navigationBarTitle("Trash Bin Details", displayMode: .inline)
//    }
}

#Preview {
    TrashbinDetailsView(trashBin: .constant(
        .dummy
    ))
}
