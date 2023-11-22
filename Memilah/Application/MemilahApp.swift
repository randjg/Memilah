//
//  MemilahApp.swift
//  Memilah
//
//  Created by Randy Julian on 21/10/23.
//

import SwiftUI
import Firebase
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct MemilahApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var viewModel = AuthenticationViewModel()
    @AppStorage("isDarkMode") var isDarkMode = false
    @StateObject var languageManager = LanguageManager()
//    @Environment(\.colorScheme) var colorScheme
//    @State var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            VStack {
                if Auth.auth().currentUser == nil {
                    LoginView()
                        .environmentObject(viewModel)
                } else {
                    RootView()
                        .preferredColorScheme(isDarkMode ? .dark : .light)
                        .onChange(of: isDarkMode) { oldValue, newValue in
                            print(oldValue)
                            print(newValue)
                        }
                }
            }
            .environmentObject(languageManager)
            .environment(\.locale, languageManager.selectedLanguage)
        }
    }
}
