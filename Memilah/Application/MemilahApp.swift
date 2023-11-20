//
//  MemilahApp.swift
//  Memilah
//
//  Created by Randy Julian on 21/10/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseMessaging



class AppDelegate: NSObject, UIApplicationDelegate {
    
    let gcmMessageIDKey = "gcm.message_id"
    
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
      FirebaseApp.configure()
      
      
      Messaging.messaging().delegate = self
      
      //Setting up notifications
      UNUserNotificationCenter.current().delegate = self

      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
      UNUserNotificationCenter.current().requestAuthorization(
        options: authOptions,
        completionHandler: { _, _ in }
      )

      application.registerForRemoteNotifications()
    return true
  }
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async
      -> UIBackgroundFetchResult {
          
      //Do something with message data
      if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
      }

      // Print full message.
      print(userInfo)

      return UIBackgroundFetchResult.newData
    }
}

//Cloud Messaging
extension AppDelegate: MessagingDelegate{
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {

      let dataDict: [String: String] = ["token": fcmToken ?? ""]
        
        //Store token in Firestore for sending notifications from server in future
        print(dataDict)
    }
}

//User Notifications
extension AppDelegate: UNUserNotificationCenterDelegate {
  // Receive displayed notifications for iOS 10 devices.
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification) async
    -> UNNotificationPresentationOptions {
    let userInfo = notification.request.content.userInfo

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)

    // ...

    // Print full message.
    print(userInfo)

    // Change this to your preferred presentation option
    return [[.alert, .sound]]
  }

  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse) async {
    let userInfo = response.notification.request.content.userInfo

    // ...

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)

    // Print full message.
    print(userInfo)
  }
}

@main
struct MemilahApp: App {
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
