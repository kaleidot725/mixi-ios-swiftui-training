import SwiftUI

struct RepoListView: View {
    @StateObject private var repoListViewModel = RepoListViewModel(
        repoApiClient: RepoAPIClient()
    )
    
    var body: some View {
        NavigationView {
            Group {
                switch repoListViewModel.state {
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
                                    await repoListViewModel.fetch()
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
            await repoListViewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}
