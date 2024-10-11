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
    }

}

