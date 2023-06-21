import SwiftUI

struct RepoListView: View {
    @StateObject private var viewModel: RepoListViewModel
    
    init(repoAPIClient: RepoAPIClientProtocol) {
        self._viewModel = StateObject(
            wrappedValue: RepoListViewModel(repoApiClient: repoAPIClient)
        )
    }
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
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
                                    await viewModel.fetch()
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
            await viewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    struct DummyError: Error {}
    
    static var previews: some View {
        RepoListView(
            repoAPIClient: MockRepoApiClient(
                repos: [
                    .mock1, .mock2, .mock3, .mock4, .mock5
                ],
                error: nil
            )
        )
        .previewDisplayName("Default")
        
        RepoListView(
            repoAPIClient: MockRepoApiClient(
                repos: [],
                error: DummyError()
            )
        )
        .previewDisplayName("Error")
    }
}
