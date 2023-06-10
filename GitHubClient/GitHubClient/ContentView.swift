//
//  ContentView.swift
//  GitHubClient
//
//  Created by 桂川 祐介 on 2023/06/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                
                Text("Hello, world!")
                    .font(Font.title)
                    .fontWeight(Font.Weight.bold)
                    .foregroundColor(Color.red)
            }
            Text("Good evening, world!")
                .font(Font.title2)
                .fontWeight(Font.Weight.heavy)
                .foregroundColor(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
