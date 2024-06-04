//
//  ConfigView.swift
//  SwiftUI3rdComponent
//
//  Created by ke on 2024/6/4.
//

import SwiftUI

struct ConfigView: View {
    let url = URL(string: "./Development.xcconfig", relativeTo: API.baseURL)!
    
    var body: some View {
        Text(url.absoluteString)
    }
    
    
}

#Preview {
    ConfigView()
}
