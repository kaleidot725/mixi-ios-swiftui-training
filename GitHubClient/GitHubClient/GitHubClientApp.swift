//
//  GitHubClientApp.swift
//  GitHubClient
//
//  Created by 桂川 祐介 on 2023/06/10.
//

import SwiftUI

@main
struct GitHubClientApp: App {
    var body: some Scene {
        WindowGroup {
            RepoListView(
                repos: [
                    Repo(id: 1, name: "NAME", owner: User(name: "USER"),description: "DESCRIPTION", stargazersCount: 0)
                ]
            )
        }
    }
}
