//
//  TrashBinViewModel.swift
//  Segrebox
//
//  Created by Eric Prasetya Sentosa on 12/11/23.
//

import Foundation
import UIKit


class TrashBinViewModel: ObservableObject {
    @Published var trashBin: TrashBinModel = TrashBinModel()
    @Published var inputImage: UIImage?
    @Published var trashBins: [TrashBinModel] = []
    @Published var selectedTrashBin: TrashBinModel?
    
    func addTrashBin() {
        TrashBinManager.shared.updateTrashBin(documentID: selectedTrashBin?.documentID ?? "", newTrashBin: trashBin)
    }
    
    func validateEmptyFields() -> Bool {
        return trashBin.name.isEmpty || trashBin.detail.isEmpty
    }
    
    
    func getTrashBins() async throws {
        trashBins = try await TrashBinManager.shared.getTrashBins()
        selectedTrashBin = trashBins.first
    }
}
