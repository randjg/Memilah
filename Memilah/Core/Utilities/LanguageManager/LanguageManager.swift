//
//  LanguageManager.swift
//  Memilah
//
//  Created by Randy Julian on 22/11/23.
//

import Foundation

class LanguageManager: ObservableObject {
    @Published var selectedLanguage = Locale(identifier: "en_US")
}
