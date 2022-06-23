//
//  ContentView.swift
//  Demo
//
//  Created by Callum Boddy on 22/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 200, height: 200)
            .previewLayout(.sizeThatFits)
    }
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Color.red
                .previewDisplayName("Red")
            Color.orange
                .previewDisplayName("orange")
            Color.green
                .previewDisplayName("green")
            Color.blue
                .previewDisplayName("blue")
            Color.yellow
                .previewDisplayName("yellow")
            Color.indigo
                .previewDisplayName("indigo")
        }
        .frame(width: 200, height: 200)
        .previewLayout(.sizeThatFits)
    }
}

struct AysncImage_Previews: PreviewProvider {
    static let url = URL(string: "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3243&q=80")!
    static var previews: some View {
        AsyncImage(url: url, content: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }) {
            Color.indigo
        }
    }
}

struct Text_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Text("Hello, World!")
                .font(.title)
            Text("Hello, World!")
                .font(.subheadline)
            Text("Hello, World!")
                .font(.headline)
            Text("Hello, World!")
                .font(.caption)
            Text("Hello, World!")
                .font(.caption2)
        }
    }
}
