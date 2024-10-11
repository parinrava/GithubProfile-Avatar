//
//  ContentView.swift
//  profile&Avatar
//
//  Created by Parin Ravanbakhsh on 2024-10-11.
//

import SwiftUI

struct ContentView: View {
    // Observing the GitHubUserView to get the user data and update the UI when it changes
    @ObservedObject var viewModel = GithubUserView()
    var body: some View {
        VStack {
            if let user = viewModel.user {
                // Display the localized string for "Name"
                Text("\(NSLocalizedString("name_label", comment: "")) \(user.name ?? NSLocalizedString("no_name_available", comment: ""))")
                    .font(.headline)
                
                // Display the localized string for "Login Name"
                Text("\(NSLocalizedString("login_label", comment: "")) \(user.login)")
                    .font(.subheadline)
                
                // Display the localized string for "Company"
                Text("\(NSLocalizedString("company_label", comment: "")) \(user.company ?? NSLocalizedString("no_company_available", comment: ""))")
                    .font(.subheadline)
                
                // Display the localized string for "Number of Public Repos"
                Text("\(NSLocalizedString("repos_label", comment: "")) \(user.public_repos)")
                    .font(.body)
                
                AsyncImage(url: URL(string: user.avatar_url)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView()
                }
            } else {
                Text(NSLocalizedString("fetching_data", comment: ""))
            }
        }
            .onAppear {
                // Call the fetchGitHubUser method when the view appears to trigger the data fetching
                viewModel.fetchGithubUser()
            }
            .padding() // Add padding around the content
        }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

