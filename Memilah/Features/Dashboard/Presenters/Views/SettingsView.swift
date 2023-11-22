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
    var body: some View {
//        NavigationStack {
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
                    }, language: "English", region: "United Kingdom", isOn: $isEnglish)
                    
                    LanguageButtonComponent(action: {
                        isEnglish = false
                        isBahasaIndonesia = true
                    }, language: "Bahasa Indonesia", region: "Indonesia", isOn: $isBahasaIndonesia)
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.horizontal, 79)
            .padding(.top, 77)
            .ignoresSafeArea()
//        }
    }
}

#Preview {
    SettingsView()
//    SettingsView(isDarkMode: .constant(false))
}
