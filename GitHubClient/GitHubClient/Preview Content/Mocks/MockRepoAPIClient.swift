import Foundation

struct MockRepoApiClient: RepoAPIClientProtocol {
    let repos: [Repo]
    let error: Error?
    
    func getRepos() async throws -> [Repo] {
        if let error = error {
            throw error
        }
        
        return repos
    }
}
