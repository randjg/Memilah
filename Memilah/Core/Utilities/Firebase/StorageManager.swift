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
    
//    func saveTrashBinImage(data: Data) async throws -> (path: String, name: String) {
//        let meta = StorageMetadata()
//        meta.contentType = "image/jpeg"
//        
//        let path = "\(UUID().uuidString).jpeg"
//        let returnedMetaData = try await trashBinReference.child(path).putDataAsync(data, metadata: meta)
//        
//        guard let returnedPath = returnedMetaData.path, let returnedName = returnedMetaData.name else {
//            throw URLError(.badServerResponse)
//        }
//        return (returnedPath, returnedName)
//    }
    func saveTrashBinImage(data: Data) async throws -> URL {
        let meta = StorageMetadata()
        meta.contentType = "image/jpeg"
        
        let imageName = "\(UUID().uuidString).jpeg"
        let imagePath = trashBinReference.child(imageName)
        
        do {
            // Upload image data to Firebase Storage
            _ = try await imagePath.putDataAsync(data, metadata: meta)
            
            // Fetch the download URL for the uploaded image
            let downloadURL = try await imagePath.downloadURL()
            
            // Return the download URL
            return downloadURL
        } catch {
            throw error
        }
    }
    
//    func getImage(imagePath: String, completion: @escaping (Data?) -> Void) {
//        let imageRef = storage.child(imagePath)
//        
//        imageRef.getData(maxSize: Int64(5) * 1024 * 1024) { data, error in
//            if let error = error {
//                print(error)
//                completion(nil) // Notify the completion handler with nil in case of an error
//            } else {
////                if let imageData = data {
//                    completion(data) // Notify the completion handler with the UIImage
////                } else {
////                    completion(nil) // Notify the completion handler with nil if data is nil
////                }
//            }
//        }
//    }
    
//    func getImageDownloadURL(imagePath: String, completion: @escaping (URL?) -> Void) {
//        let imageRef = storage.child(imagePath)
//        
//        imageRef.downloadURL { url, err in
//            if let err = err {
//                print(err)
//                completion(nil)
//            } else {
//                completion(url)
//            }
//        }
//    }
//    func getImage(imagePath: String) async throws -> Data {
//        return try await storage.child(imagePath).data(maxSize: Int64(5) * 1024 * 1024)
//    }
}
