import SwiftUI

struct RepoListView: View {
    let repos: [Repo]
    var body: some View {
        NavigationView {
             List(repos) { repo in
                 NavigationLink(destination: RepoDetailView(repo: repo)) {
                     RepoRow(repo: repo)
                 }
             }
             .navigationTitle("Repositories")
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView(
            repos: [.mock1, .mock2, .mock3, .mock4, .mock5]
        )
    }
}
