import Foundation

class RepoStore : ObservableObject {
    @Published private (set) var repos = [Repo]()
    
    @MainActor
    func loadRepos() async {
        let url = URL(string: "https://api.github.com/orgs/mixigroup/repos")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Accept" : "application/vnd.github+json"
        ]
        urlRequest.cachePolicy = .returnCacheDataElseLoad
        
        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        self.repos = try! decoder.decode([Repo].self, from: data)
    }
}
