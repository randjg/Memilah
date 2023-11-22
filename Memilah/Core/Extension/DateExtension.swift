//
//  DateExtension.swift
//  Memilah
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
    
    func formatDateLong() -> String {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "d MMMM yyyy"
        return outputFormatter.string(from: self)
    }
    
    func formatDateForNotif() -> String {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "d MMMM yyyy HH:mm"
        return outputFormatter.string(from: self)
    }
    
    func formatDateHourMinute() -> String {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "hh.mm"
        return outputFormatter.string(from: self)
    }
    
    func formatDateFirestore() -> String {
        let outputFormatter = DateFormatter.firestoreDateFormat
        return outputFormatter.string(from: self)
    }
}


extension DateFormatter {
    static let firestoreDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy, HH:mm"
        return formatter
    }()
}

extension String {
    func convertFromFirestoreToDate() -> Date? {
        let formatter = DateFormatter.firestoreDateFormat
        return formatter.date(from: self)
    }
}
