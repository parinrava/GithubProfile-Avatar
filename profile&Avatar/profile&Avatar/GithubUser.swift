//
//  GithubUser.swift
//  profile&Avatar
//
//  Created by Parin Ravanbakhsh on 2024-10-11.
//

import Foundation
import SwiftUI

struct GithubUser : Codable{
    let login :  String
    let name : String?
    let public_repos : Int
    let avatar_url : String
}
