//
//  SettingsView.swift
//  Segrebox
//
//  Created by Eric Prasetya Sentosa on 05/11/23.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    func logOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    var body: some View {
        List {
            Button("Log Out") {
                Task {
                    do {
                        try viewModel.logOut()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView(showSignInView: .constant(true))
}
