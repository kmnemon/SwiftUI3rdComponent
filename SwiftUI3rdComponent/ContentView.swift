//
//  ContentView.swift
//  SwiftUI3rdComponent
//
//  Created by ke on 2024/6/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack{
                List{
                    NavigationLink("WebViewComponent") {
                        WebViewComponent()
                    }
                    NavigationLink("ConfigView") {
                        ConfigView()
                    }
                }
                .navigationTitle("Choose Component")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
