//
//  GithubUserView.swift
//  profile&Avatar
//
//  Created by Parin Ravanbakhsh on 2024-10-11.
//

import SwiftUI

//this class fethes and stores the user data from github API
class GithubUserView: ObservableObject {
    //will hold the github user model and when it's updated it will update the UI as well
    @Published var user: GithubUser?
    
    //func to fetch the github user data
    
    func fetchGithubUser() {
        //the API URL
        guard let url = URL (string:"https://api.github.com/users/parinrava") else {
            return
        }

    
    //start task using the url session to fetch
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data { // if the data successfully fetched
            do {
                //use the json decoder to decode the json response
                let decoder = JSONDecoder()
                let user = try decoder.decode(GithubUser.self, from:data)
                //update the user property on the main thread to refresh the UI
                DispatchQueue.main.async{
                    self.user = user
                }
            }catch{
                //parint error message
                print("error decoding json:", error)
            }
        }
        }.resume() //resume the data task to start
    }
}

