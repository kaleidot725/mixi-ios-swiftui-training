//
//  ContentView.swift
//  GitHubClient
//
//  Created by 桂川 祐介 on 2023/06/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("github-mark")
                .resizable()
                .frame(width: 44.0, height: 44.0)
            
            VStack(alignment: .leading) {
                Text("Owner Name")
                    .font(.caption)
                
                Text("Repository Name")
                    .font(.body)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
