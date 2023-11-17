//
//  AddTrashBinView.swift
//  Memilah
//
//  Created by Clarabella Lius on 26/10/23.
//

import SwiftUI

struct AddTrashBinView: View {
    @StateObject var viewModel = TrashBinViewModel()
    @State var trashBins = [TrashBinModel]()
    @State var selectedTrashBin = TrashBinModel()
    var event: EventModel
    @State var showingImagePicker = false
    @State var inputImage: UIImage?
    
//    let context = CIContext()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                
                HStack {
                    Spacer()
                    Text("Add Trash Bin")
                        .font(.custom(Fonts.plusJakartaSansBold, size: 31))
                        .padding(.bottom, 39)
                    Spacer()
                }
                .frame(width: 600)
                
                //MARK: Select UUID
                HStack{
                    Text("UUID")
                        .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                    Picker("UUID", selection: $selectedTrashBin) {
                        ForEach(trashBins, id: \.self) { trashBin in
                            Text(trashBin.documentID ?? "")
                        }
                        
                    }
                    .padding(.leading, 150)
                }
                .padding(.bottom, 41)
                
                //MARK: Add trash bin name
                HStack{
                    Text("Trash Bin Name")
                        .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                        .padding(.bottom, 41)
                    
                    TextFieldComponent(text: $viewModel.trashBin.name, placeholder: "Add trash bin name", keyboardType: .default, returnKeyType: .next, width: 400, height: 40,axis: .vertical)
                        .padding(.bottom, 48)
                        .padding(.leading, 62)
                        .onChange(of: viewModel.trashBin.name) {
                            if viewModel.trashBin.name.count > 150 {
                                viewModel.trashBin.name = String(viewModel.trashBin.name.prefix(150))
                            }
                        }
                }
                
                //MARK: Add trash bin details
                HStack{
                    Text("Trash Bin Details")
                        .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                        .padding(.bottom, 41)
                    
                    VStack {
                        TextFieldComponent(text: $viewModel.trashBin.detail, placeholder: "Add trash bin details", keyboardType: .default, returnKeyType: .next, width: 400, height: 40,axis: .vertical)
                            .onChange(of: viewModel.trashBin.detail) {
                                if viewModel.trashBin.detail.count > 150 {
                                    viewModel.trashBin.detail = String(viewModel.trashBin.detail.prefix(150))
                                }
                            }
                        
                        
                        HStack {
                            Text("max. 150 characters")
                                .font(.custom(Fonts.plusJakartaSansRegular, size: 14))
                                .foregroundStyle(Color.gray)
                            Spacer()
                        }
                        
                        .frame(width: 400)
                    }
                    .padding(.bottom, 12)
                    .padding(.leading, 50)
                }
                
                //MARK: Add Trash bin Image
                HStack {
                    Text("Trash Bin Image")
                        .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                        .padding(.top, 10)
                    
                    //Upload an image
                    VStack{
                        if inputImage != nil {
                            Image(uiImage: inputImage!)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 8.0)
                                .frame(width: 176, height: 31)
                                .foregroundColor(Colors.greyLightActive)
                            Text("Upload an image")
                                .font(.custom(Fonts.plusJakartaSansSemiBold, size: 16))
                                .frame(width: 130, height: 20)
                        }
                    }
                    .padding(.leading, 57)
                    .padding(.top, 10)
                    .onTapGesture {
                        showingImagePicker = true
                    }
                    
                }
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: $inputImage)
                }
                //MARK: Add Trash Bin Button
                HStack {
                    Spacer()
                    Button("Add Trash Bin"){
                        viewModel.addTrashBin(event: event, imageData: inputImage?.jpegData(compressionQuality: 0.8), trashBinID: selectedTrashBin.documentID)
                    }.buttonStyle(SecondaryButtonStyle(textPlaceholder: "Add Trash Bin", action: {
                        viewModel.addTrashBin(event: event, imageData: inputImage?.jpegData(compressionQuality: 0.8), trashBinID: selectedTrashBin.documentID)
                    }))
                }
                .frame(width: 630)
                .padding(.top, 87)
                
            }
        }
        .onAppear {
            Task {
                do {
                    trashBins = try await viewModel.getTrashBins()
                    guard let selectedTrashBin = trashBins.first else {return}
                    self.selectedTrashBin = selectedTrashBin
                } catch {
                    print(error)
                }
            }
        }
    }
    
}

#Preview {
    AddTrashBinView(event: EventModel(documentID: "ythi0zFLYayMh9d3fwGL", name: "", description: "", location: "", dateEnd: Date(), dateStart: Date()))
}
