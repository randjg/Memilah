//
//  SettingsView.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 17/11/23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
//    @Binding var isDarkMode: Bool
    @State var isEnglish = true
    @State var isBahasaIndonesia = false
    @EnvironmentObject var languageManager: LanguageManager
    var body: some View {
        NavigationStack {
            VStack() {
                HStack{
                    Text("Settings")
                        .font(
                            Font.custom(Fonts.plusJakartaSansBold, size: 31)
                        )
                    Spacer()
                }
                .padding(.bottom, 60)
                
                HStack{
                    Text("Display")
                        .font(
                            Font.custom(Fonts.plusJakartaSansBold, size: 21)
                        )
                    Spacer()
                }
                .padding(.bottom, 31)
                
                HStack{
                    Toggle(isOn: $isDarkMode, label: {
                        Text("Dark Mode")
                            .font(
                                Font.custom(Fonts.plusJakartaSansRegular, size: 16)
                                    .weight(.medium)
                            )
                    })
                    .tint(.blueNormal)
                }
                .padding(.bottom, 60)
                
                HStack{
                    Text("Choose a language and region")
                        .font(
                            Font.custom(Fonts.plusJakartaSansBold, size: 21)
                        )
                    Spacer()
                }
                .padding(.bottom, 25)
                
                HStack(spacing: 53) {
                    LanguageButtonComponent(action: {
                        isEnglish = true
                        isBahasaIndonesia = false
                        languageManager.selectedLanguage = Locale(identifier: "en_US")
                    }, language: "English", region: "United States", isOn: $isEnglish)
                    
                    
                    LanguageButtonComponent(action: {
                        isEnglish = false
                        isBahasaIndonesia = true
                        languageManager.selectedLanguage = Locale(identifier: "id_ID")
                    }, language: "Bahasa Indonesia", region: "Indonesia", isOn: $isBahasaIndonesia)
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.horizontal, 79)
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(LanguageManager())
//    SettingsView(isDarkMode: .constant(false))
}
