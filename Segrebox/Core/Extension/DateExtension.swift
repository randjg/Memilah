//
//  DateExtension.swift
//  Segrebox
//
//  Created by Clarabella Lius on 11/11/23.
//

import Foundation

extension Date {
    func formatDate() -> String {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "d MMM yyyy"
        return outputFormatter.string(from: self)
    }
}
