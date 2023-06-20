import SwiftUI

struct RepoListView: View {
    @StateObject private var reposStore = RepoStore()

    var body: some View {
        NavigationView {
            if reposStore.repos.isEmpty {
                ProgressView("loading...")
            } else {
                List(reposStore.repos) { repo in
                    NavigationLink(destination: RepoDetailView(repo: repo)) {
                        RepoRow(repo: repo)
                    }
                }
                .navigationTitle("Repositories")
            }
        }.task {
            await reposStore.loadRepos()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}
