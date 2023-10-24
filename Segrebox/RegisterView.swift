//
//  RegisterView.swift
//  Segrebox
//
//  Created by Randy Julian on 22/10/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var isPasswordVisible = false
    @State private var isPasswordConfirmVisible = false
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                VStack{
                    Text("SegreBox")
                        .font(.custom("PlusJakartaSans-Bold", size: 31))
                        .position(x: geometry.size.width / 2)
                    
                    VStack{
                        HStack{
                            Text("E-mail")
                                .font(.custom("PlusJakartaSans-Bold", size: 21))
                            Spacer()
                        }
                        .frame(maxWidth: 615)
                        TextFieldComponent(text: $email, placeholder: "Enter your email address", keyboardType: .default, returnKeyType: .next, width: 615, height: 50)
                    }
                    .padding(29)
                    
                    VStack{
                        HStack{
                            Text("Password")
                                .font(.custom("PlusJakartaSans-Bold", size: 21))
                            Spacer()
                        }
                        .frame(maxWidth: 615)
                        if isPasswordVisible {
                            TextFieldComponent(text: $password, placeholder: "Enter your password", keyboardType: .default, returnKeyType: .next, width: 615, height: 50)
                        } else{
                            SecureField("Enter your password", text: $password)
                                .frame(width: 615, height: 50)
                                .padding(.leading, 10)
                                .font(.custom("PlusJakartaSans-Regular", size: 21))
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
                        HStack{
                            Text("Password Confirmation")
                                .font(.custom("PlusJakartaSans-Bold", size: 21))
                            Spacer()
                        }
                        .frame(maxWidth: 615)
                        if isPasswordConfirmVisible {
                            TextFieldComponent(text: $passwordConfirm, placeholder: "Enter your password confirmation", keyboardType: .default, returnKeyType: .next, width: 615, height: 50)
                        } else {
                            SecureField("Enter your password confirmation", text: $passwordConfirm)
                                .frame(width: 615, height: 50)
                                .padding(.leading, 10)
                                .font(.custom("PlusJakartaSans-Regular", size: 21))
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
                    .padding(29)
                    
                    MainButtonComponent(title: "Register"){
                        
                    }
                    .padding(.bottom, 15)
                    
                    HStack {
                        Text("Already have an account?")
                            .font(.custom("PlusJakartaSans-Regular", size: 16))
                        NavigationLink("Login now", destination: LoginView())
                            .foregroundColor(Color("AdaptiveFontColor"))
                            .font(.custom("PlusJakartaSans-Bold", size: 16))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RegisterView()
}

