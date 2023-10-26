//
//  LoginView.swift
//  Segrebox
//
//  Created by Randy Julian on 21/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    
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
                        .frame(maxWidth: 625)
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
                        }
                        else {
                            SecureField("Enter your password", text: $password)
                                .frame(width: 615, height: 50)
                                .padding(.leading, 10)
                                .font(.custom("PlusJakartaSans-Regular", size: 18))
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
                    
                    MainButtonComponent(title: "Login"){
                        LoginView()
                    }
                    .padding(.bottom, 15)
                    
                    HStack {
                        Text("Don't have an account yet?")
                            .font(.custom("PlusJakartaSans-Regular", size: 16))
                        NavigationLink("Register now", destination: RegisterView())
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
    LoginView()
}
