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
    @State private var isLoggedOut = false
    
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
            .padding(.leading, 63)
            .padding(.vertical, 58)
            
            Spacer()
            
            ZStack{
                //MARK: Background
                Rectangle()
                    .foregroundColor(.clear)
                    .background(Color(red: 0.93, green: 0.95, blue: 0.96))
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
                    }.padding(.bottom, 35)

                    Button(action:{
                        do {
                            try viewModel.logout()
                            isLoggedOut = true
                        } catch {
                            
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
                
            }
            
        }
        
        
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthenticationViewModel())
}
