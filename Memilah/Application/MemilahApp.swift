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
//    @Environment(\.colorScheme) var colorScheme
//    @State var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            if Auth.auth().currentUser == nil {
                LoginView()
                    .environmentObject(viewModel)
            } else {
                RootView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
//                    .preferredColorScheme(.dark)
                    .onChange(of: isDarkMode) { oldValue, newValue in
                        print(oldValue)
                        print(newValue)
                    }
            }
//            AddEventView()
//            AddTrashBinView(event: .constant(EventModel(documentID: "ythi0zFLYayMh9d3fwGL", name: "", description: "", location: "", dateEnd: Date(), dateStart: Date())))
            
//            RootView()
        }
    }
}
