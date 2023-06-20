import Foundation

class RepoStore : ObservableObject {
    @Published private (set) var state = Stateful<[Repo]>.loading
    
    @MainActor
    func loadRepos() async {
        let url = URL(string: "https://api.github.com/orgs/mixigroup/repos")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Accept" : "application/vnd.github+json"
        ]
        urlRequest.cachePolicy = .returnCacheDataElseLoad
        
        state = .loading
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let repos = try decoder.decode([Repo].self, from: data)
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
