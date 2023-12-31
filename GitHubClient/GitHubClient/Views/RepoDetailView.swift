import SwiftUI

struct RepoDetailView: View {
    let repo: Repo
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("github-mark")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text(repo.owner.name)
                        .font(.caption)
                }
                
                Text(repo.name)
                    .font(.body)
                    .fontWeight(.bold)
                
                if let description = repo.description {
                    Text(description).padding(.top, 4)
                }
                
                HStack {
                    Image(systemName: "star")
                    Text("\(repo.stargazersCount) stars")
                }.padding(.top, 8)
                Spacer()
            }
            Spacer()
        }
        .padding(8)
        .navigationTitle("Repository Detail")
    }
}

struct RepoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RepoDetailView(repo: .mock1)
    }
}
