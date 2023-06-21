import Foundation

class RepoListViewModel: ObservableObject {
    private let repoApiClient: RepoAPIClient
    @Published private (set) var state = Stateful<[Repo]>.loading

    init(repoApiClient: RepoAPIClient) {
        self.repoApiClient = repoApiClient
    }
    
    func fetch() async {
        state = .loading
        do {
            let repos = try await repoApiClient.getRepos()
            state = .success(repos)
        } catch {
            state = .failed(error)
        }
    }
}

enum Stateful<Value> {
    case loading
    case failed(Error)
    case success(Value)
}
