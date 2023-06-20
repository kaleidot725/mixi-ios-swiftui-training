import SwiftUI

struct RepoListView: View {
    @StateObject private var reposStore = RepoStore()
    
    var body: some View {
        NavigationView {
            Group {
                switch reposStore.state {
                case .loading:
                    ProgressView("loading...")
                case let .success(repos):
                    List(repos) { repo in
                        NavigationLink(destination: RepoDetailView(repo: repo)) {
                            RepoRow(repo: repo)
                        }
                    }
                case .failed:
                    VStack {
                        Text("Failed to load repositories")
                        Button(
                            action: {
                                Task {
                                    await reposStore.loadRepos()
                                }
                            },
                            label: {
                                Text("Retry")
                            }
                        )
                        .padding()
                    }
                }
            }
            .navigationTitle("Repositories")
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
