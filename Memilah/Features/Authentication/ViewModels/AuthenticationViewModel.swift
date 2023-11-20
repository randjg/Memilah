//
//  AuthenticationViewModel.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 07/11/23.
//

import Foundation

@MainActor
final class AuthenticationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var user: UserModel?
    @Published var authenticated = false
    @Published var registered = false
    func register() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("Email or password cannot be empty.")
            return
        }
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    
    func login() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        user = try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
    
    func logout() throws{
        try AuthenticationManager.shared.signOut()
        user = nil
    }
    
    func validatePassword(_ confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
    
    func validateFieldsAreEmpty() -> Bool {
        return email.isEmpty || password.isEmpty
    }
}
