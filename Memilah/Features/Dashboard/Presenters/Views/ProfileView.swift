//
//  ProfileView.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 17/11/23.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {

        VStack(alignment: .leading){
            //MARK: Header Profile
            HStack{
                Text("Profile")
                    .font(
                        Font.custom(Fonts.plusJakartaSansBold, size: 31)
                            .weight(.bold)
                    )
                Spacer()
            }
            .padding(.bottom, 58)
            .padding(.horizontal, 79)
            
            Spacer()
            
            ZStack(alignment: .topLeading) {
                //MARK: Background
                Rectangle()
                    .foregroundColor(.clear)
                    .background(Colors.blueLight)
                    .cornerRadius(20.0)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("E-mail")
                            .font(
                                Font.custom(Fonts.plusJakartaSansBold, size: 21)
                                    .weight(.bold)
                            )
                            .padding(.bottom, 6)
                        
                        Text(Auth.auth().currentUser?.email?.description ?? "No email registered")
                            .font(
                                Font.custom(Fonts.plusJakartaSansRegular, size: 21)
                            )
                    }
                    .padding(.bottom, 35)

                    Button(action:{
                        do {
                            try viewModel.logout()
                            viewModel.authenticated = false
//                            dismiss()
                        } catch {
                            print(error)
                        }
                    }){
                        Text("Logout")
                            .font(
                                Font.custom(Fonts.plusJakartaSansBold, size: 21)
                                    .weight(.bold)
                            )
                            .foregroundColor(Color.redNormal)
                            .underline()
                    }
                }
                .padding(.top, 80)
                .padding(.horizontal, 79)
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthenticationViewModel())
}
