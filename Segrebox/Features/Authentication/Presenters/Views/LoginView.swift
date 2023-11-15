//
//  LoginView.swift
//  Segrebox
//
//  Created by Randy Julian on 21/10/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var viewModel: AuthenticationViewModel
    @State private var isPasswordVisible = false
    @State private var showingAlert = false
    @State private var alert = Alerts.invalidCredentials
    
    var body: some View {
        NavigationStack{
            CenterHorizontalView {
                VStack{
                    Images.logoTextImageVertical
                        .resizable()
                        .scaledToFit()
                        .frame(height: 280)
                    
                    VStack{
                        HStack{
                            Text("E-mail")
                                .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                            Spacer()
                        }
                        .frame(maxWidth: 625)
                        TextFieldComponent(text: $viewModel.email, placeholder: "Enter your email address", keyboardType: .default, returnKeyType: .next, width: 615, height: 50, axis: .vertical)
                    }
                    .padding(.vertical, 29)
                    
                    VStack{
                        HStack{
                            Text("Password")
                                .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                            Spacer()
                        }
                        .frame(maxWidth: 615)
                        if isPasswordVisible {
                            TextFieldComponent(text: $viewModel.password, placeholder: "Enter your password", keyboardType: .default, returnKeyType: .next, width: 615, height: 50, axis: .vertical)
                        }
                        else {
                            SecureField("Enter your password", text: $viewModel.password)
                                .frame(width: 615, height: 50)
                                .padding(.leading, 10)
                                .font(.custom(Fonts.plusJakartaSansRegular, size: 18))
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 0.78, green: 0.88, blue: 0.82), lineWidth: 2))
                                .textContentType(.none)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        
                        ZStack {
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(isPasswordVisible ? .secondary : .primary)
                            }
                            .padding(.leading, 550)
                            .padding(.top, -42)
                        }
                    }
                    
                    VStack{
//                        HStack{
//                            Text("Forgot Password?")
//                                .font(.custom("PlusJakartaSans-Regular", size: 16))
//                            Spacer()
//                        }
//                        .frame(maxWidth: 625)
                    }
                    .padding(.top, 6)
                    .padding(.bottom, 38)
                    
                    MainButtonComponent(title: "Login", disable: viewModel.validateFieldsAreEmpty()){
                        // do login
                        Task {
                            do {
                                try await viewModel.login()
                                viewModel.authenticated = true
                            } catch {
                                print(error)
                                showingAlert = true
                                viewModel.authenticated = false
                            }
                        }
                    }
                    .padding(.bottom, 15)
                    
                    HStack {
                        Text("Don't have an account yet?")
                            .font(.custom(Fonts.plusJakartaSansRegular, size: 16))
                        NavigationLink("Register now", destination: RegisterView().environmentObject(viewModel))
                            .foregroundColor(Colors.adaptiveFontColor)
                            .font(.custom(Fonts.plusJakartaSansBold, size: 16))
                    }
                }
            }
            .navigationDestination(isPresented: $viewModel.authenticated) {
                RootView()
            }
        }
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $showingAlert) {
            alert
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthenticationViewModel())
}
