//
//  ContentView.swift
//  GitHubClient
//
//  Created by 桂川 祐介 on 2023/06/10.
//

import SwiftUI

struct RepoListView: View {
    private let mockRepos = [
        Repo(id: 1, name: "REPO NAME1", user: User(name: "USER NAME1")),
        Repo(id: 2, name: "REPO NAME2", user: User(name: "USER NAME2")),
        Repo(id: 3, name: "REPO NAME3", user: User(name: "USER NAME3")),
        Repo(id: 4, name: "REPO NAME4", user: User(name: "USER NAME4")),
        Repo(id: 5, name: "REPO NAME5", user: User(name: "USER NAME5")),
        Repo(id: 6, name: "REPO NAME6", user: User(name: "USER NAME6")),
        Repo(id: 7, name: "REPO NAME7", user: User(name: "USER NAME7"))
    ]
    
    var body: some View {
        List(mockRepos) { repo in
            ExtractedView(repo: repo)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}

struct ExtractedView: View {
    let repo: Repo
    var body: some View {
        HStack(alignment: .center) {
            Image("github-mark")
                .resizable()
                .frame(width: 44.0, height: 44.0)
            
            VStack(alignment: .leading) {
                Text(repo.user.name)
                    .font(.caption)
                
                Text(repo.name)
                    .font(.body)
                    .fontWeight(.semibold)
            }
        }
    }
}
