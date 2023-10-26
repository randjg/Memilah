//
//  CardComponent.swift
//  Segrebox
//
//  Created by Randy Julian on 23/10/23.
//

import SwiftUI

struct CardComponent: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 811, height: 192)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.25), radius: 2.5, x: 5, y: 5)
                
                HStack{
                    Image("image 4")
                        .offset(x: -60)
                    
                    VStack(alignment: .leading){
                        Text("Nama Tempat Trashbin")
                            .font(.custom("PlusJakartaSans-Bold", size: 21))
                            .padding(.bottom, 8)
                        Text("UUID")
                            .font(.custom("PlusJakartaSans-Regular", size: 13))
                            .padding(.bottom, 8)
                        Text("Deskripsi trash bin")
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(2)
                            .font(.custom("PlusJakartaSans-Regular", size: 13))
                            .frame(width: 199, alignment: .leading)
                    }
                    .offset(x: -33)
                    .frame(maxHeight: 147)
                    
                    VStack{
                        Text("Komponen fill level")
                    }
                }
            }
            .frame(width: geometry.size.width)
        }
    }
}

#Preview {
    CardComponent()
}
