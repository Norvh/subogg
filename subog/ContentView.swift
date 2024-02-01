//
//  ContentView.swift
//  subog
//
//  Created by Norah W on 17/07/1445 AH.
//

import SwiftUI
import CloudKit

struct ContentView: View {
    let container = CKContainer(identifier: "iCloud.subog")
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
