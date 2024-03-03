//
//  ContentView.swift
//  Navigation
//
//  Created by Ahmet on 3.03.2024.
//

import Observation
import SwiftUI

struct ContentView: View {
    @State private  var title = "SwiftUI"
    var body: some View {
        NavigationStack {
            Text("Hello World!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        
        }
    }
}

#Preview {
    ContentView()
}
