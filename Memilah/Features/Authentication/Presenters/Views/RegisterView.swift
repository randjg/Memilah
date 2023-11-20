//
//  RegisterView.swift
//  Memilah
//
//  Created by Randy Julian on 22/10/23.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var passwordConfirm = ""
    @State private var isPasswordVisible = false
    @State private var isPasswordConfirmVisible = false
    @State private var showingAlert = false
    @State private var alert = Alerts.incorrectPassword
    @State private var isLoading = false
    var body: some View {
        NavigationStack{
            ZStack {
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
                            .frame(maxWidth: 615)
                            TextFieldComponent(text: $viewModel.email, placeholder: "Enter your email address", keyboardType: .default, returnKeyType: .next, width: 615, height: 50, axis: .vertical)
                        }
                        .padding(.vertical, 15)
                        
                        VStack{
                            HStack{
                                Text("Password")
                                    .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                                Spacer()
                            }
                            .frame(maxWidth: 615)
                            if isPasswordVisible {
                                TextFieldComponent(text: $viewModel.password, placeholder: "Enter your password", keyboardType: .default, returnKeyType: .next, width: 615, height: 50, axis: .vertical)
                            } else{
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
                        .padding(.bottom, 15)
                        
                        VStack{
                            HStack{
                                Text("Password Confirmation")
                                    .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                                Spacer()
                            }
                            .frame(maxWidth: 615)
                            if isPasswordConfirmVisible {
                                TextFieldComponent(text: $passwordConfirm, placeholder: "Enter your password confirmation", keyboardType: .default, returnKeyType: .next, width: 615, height: 50, axis: .vertical)
                            } else {
                                SecureField("Enter your password confirmation", text: $passwordConfirm)
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
                                    isPasswordConfirmVisible.toggle()
                                }) {
                                    Image(systemName: isPasswordConfirmVisible ? "eye.slash" : "eye")
                                        .foregroundColor(isPasswordConfirmVisible ? .secondary : .primary)
                                }
                                .padding(.leading, 550)
                                .padding(.top, -42)
                            }
                        }
                        .padding(.bottom, 15)
                        
                        MainButtonComponent(title: "Register", disable: viewModel.validateFieldsAreEmpty()){
                            if viewModel.validatePassword(passwordConfirm) {
                                Task {
                                    do {
                                        isLoading = true
                                        try await viewModel.register()
                                        showingAlert = false
                                        viewModel.registered = true
                                        isLoading = false
                                    } catch {
                                        print(error)
                                        showingAlert = true
                                        alert = Alerts.errorRegister
                                        viewModel.registered = false
                                    }
                                }
                            } else {
                                showingAlert = true
                                alert = Alerts.incorrectPassword
                            }
                        }
                        .padding(.bottom, 15)
                        
                        HStack {
                            Text("Already have an account?")
                                .font(.custom(Fonts.plusJakartaSansRegular, size: 16))
                            NavigationLink("Login now", destination: LoginView())
                                .foregroundColor(Colors.adaptiveFontColor)
                                .font(.custom(Fonts.plusJakartaSansBold, size: 16))
                        }
                    }
                }
                .navigationDestination(isPresented: $viewModel.registered) {
                    LoginView()
                        .environmentObject(viewModel)
                }
                
                if isLoading {
                    Rectangle()
                        .fill(Colors.adaptiveFontColorCard.opacity(0.5))
                    ProgressView {
                        Text("Registering")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Colors.adaptiveFontColorCard)
                            .stroke(Colors.greyDarker, lineWidth: 1)
                    )
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $showingAlert) {
            alert
        }
        
    }
}

#Preview {
    RegisterView()
        .environmentObject(AuthenticationViewModel())
}

