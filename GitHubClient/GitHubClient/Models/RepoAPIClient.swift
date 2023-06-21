import Foundation

class RepoAPIClient {
    private let url = URL(string: "https://api.github.com/orgs/mixigroup/repos")!
    
    func getRepos() async throws -> [Repo] {
        let urlRequest = createUrlRequest()
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([Repo].self, from: data)
    }
    
    private func createUrlRequest() -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = ["Accept" : "application/vnd.github+json"]
        urlRequest.cachePolicy = .returnCacheDataElseLoad
        return urlRequest
    }
}
