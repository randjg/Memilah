//
//  CenterHorizontalView.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 07/11/23.
//

import SwiftUI

struct CenterHorizontalView<Content: View>: View {
    @ViewBuilder let centeredContent: Content
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                centeredContent
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    CenterHorizontalView {
        Text("test")
    }
}
