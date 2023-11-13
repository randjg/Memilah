//
//  SegreboxApp.swift
//  Segrebox
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
struct SegreboxApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var viewModel = AuthenticationViewModel()
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(viewModel)
//            AddEventView()
//            AddTrashBinView(event: .constant(EventModel(documentID: "ythi0zFLYayMh9d3fwGL", name: "", description: "", location: "", dateEnd: Date(), dateStart: Date())))
        }
    }
}
