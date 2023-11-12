//
//  TrashBinManager.swift
//  Segrebox
//
//  Created by Eric Prasetya Sentosa on 12/11/23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class TrashBinManager {
    static let shared = TrashBinManager()
    private let dbRef = Firestore.firestore().collection("trash-bins")
    
    
    func addTrashBin(trashBin: TrashBinModel) {
        do {
            try dbRef.document().setData(from: trashBin)
        } catch {
            print(error)
        }
    }
    
    func deleteTrashBin(documentID: String) {
        dbRef.document(documentID).delete { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    func getAllTrashBins() async throws -> [TrashBinModel] {
        var trashBins: [TrashBinModel] = []
        let snapshot = try await dbRef.getDocuments()
        for document in snapshot.documents {
            var trashBin = try document.data(as: TrashBinModel.self)
            trashBin.documentID = document.documentID
            trashBins.append(trashBin)
        }
        
        return trashBins
    }
    
    func getFreeTrashBins() async throws -> [TrashBinModel] {
        var trashBins: [TrashBinModel] = []
        let snapshot = try await dbRef.getDocuments()
        for document in snapshot.documents {
            var trashBin = try document.data(as: TrashBinModel.self)
            if trashBin.event == nil || trashBin.event?.isEmpty == true {
                trashBin.documentID = document.documentID
                trashBins.append(trashBin)
            }
        }
        
        return trashBins
    }
    
    func updateTrashBin(documentID: String, newTrashBin: TrashBinModel) {
        let trashBin = dbRef.document(documentID)
        
        do {
            try trashBin.setData(from: newTrashBin)
        } catch {
            print(error)
        }
    }
    
//    func updateTrashBinTrashBins(documentID: String, trashBins: [String]) {
//        let trashBin = dbRef.document(documentID)
//        
//        trashBin.updateData([
//            "trashBins": trashBins
//        ]) { err in
//            if let err = err {
//                print("Error updating document: \(err)")
//            } else {
//                print("Document successfully updated")
//            }
//        }
//    }
}
