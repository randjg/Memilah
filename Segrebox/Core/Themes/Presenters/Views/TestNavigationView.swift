//
//  TestNavigationView.swift
//  Segrebox
//
//  Created by Clarabella Lius on 11/11/23.
//

import SwiftUI

struct TestNavigationView: View {
    
//    @State private var sidebarWidth: CGFloat = 0
    @State private var scale = 1.0
    @State private var columnVisibility = NavigationSplitViewVisibility.detailOnly
    
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            
        } detail: {
//            VStack {÷
                VStack {
                    NavigationLink {
                        Text("testt")
                            .toolbar(.hidden, for: .navigationBar)
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 1200, height: 200)
                    }
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 600, height: 200)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 200)
                }
                .scaleEffect(scale)
                .onChange(of: columnVisibility) { oldValue, newValue in
                    print(oldValue)
                    print(newValue)
                    if newValue == NavigationSplitViewVisibility.detailOnly {
                        withAnimation {
                            scale = 1.0
                        }
                    } else {
                        withAnimation {
                            scale = 0.5
                        }
                    }
//                    print(NavigationSplitViewVisibility.Type)
                }
//            }
        }

    }
}

#Preview {
    TestNavigationView()
}
