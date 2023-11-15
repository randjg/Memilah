//
//  StorageManager.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 12/11/23.
//

import Foundation
import FirebaseStorage
import UIKit

final class StorageManager {
    
    static let shared = StorageManager()
    private init() { }
    
    private let storage = Storage.storage().reference()
    
    private var trashBinReference: StorageReference {
        storage.child("trash-bins")
    }
    
    func saveTrashBinImage(data: Data) async throws -> (path: String, name: String) {
        let meta = StorageMetadata()
        meta.contentType = "image/jpeg"
        
        let path = "\(UUID().uuidString).jpeg"
        let returnedMetaData = try await trashBinReference.child(path).putDataAsync(data, metadata: meta)
        
        guard let returnedPath = returnedMetaData.path, let returnedName = returnedMetaData.name else {
            throw URLError(.badServerResponse)
        }
        return (returnedPath, returnedName)
    }
    
    func getImage(imagePath: String, completion: @escaping (UIImage?) -> Void) {
        let imageRef = storage.child(imagePath)
        
        imageRef.getData(maxSize: Int64(5) * 1024 * 1024) { data, error in
            if let error = error {
                print(error)
                completion(nil) // Notify the completion handler with nil in case of an error
            } else {
                if let imageData = data {
                    completion(UIImage(data: imageData)) // Notify the completion handler with the UIImage
                } else {
                    completion(nil) // Notify the completion handler with nil if data is nil
                }
            }
        }
    }
}
