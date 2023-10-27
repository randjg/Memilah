//
//  ContentView.swift
//  Segrebox
//
//  Created by Randy Julian on 21/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Text("Hello, Custom Font!")
//                .font(.custom("PlusJakartaSans-Regular", size: 24))
            
        

            ScrollView() {
                VStack(spacing: 350) {
                    ForEach(0..<7) { _ in
                        CardComponent()
//                            .padding(.bottom, 10)
                    }
                }
                Spacer(minLength: 350)
            }
        }
    }
}

#Preview {
    ContentView()
}
