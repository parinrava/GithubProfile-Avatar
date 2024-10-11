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
                // Check if the user data has been fetched
                if let user = viewModel.user {
                    // Display the user's name (if available, otherwise show a default message)
                    Text("Name: \(user.name ?? "No name available")")
                        .font(.headline) 
                    
                    // Display the login name from the API
                    Text("Login Name: \(user.login)")
                        .font(.subheadline)
                    //display the company name from API
                    Text("Company : \(user.company ?? "no company available")")
                        .font(.subheadline)
                    
                    // Display the number of public repositories
                    Text("Number of Public Repos: \(user.public_repos)")
                        .font(.body) // Apply a body font style
                    
                    // Load and display the avatar image using AsyncImage
                    AsyncImage(url: URL(string: user.avatar_url)) { image in
                    //once the image is loaded display it
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100) // Set the size of the avatar image
                    } placeholder: {
                        // Show a progress indicator while the image is loading
                        ProgressView()
                    }
                } else {
                    // Display a message while the API data is being fetched
                    Text("Fetching GitHub user data...")
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

