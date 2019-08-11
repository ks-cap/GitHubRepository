//
//  GitHubAPIClient.swift
//  GitHubRepository
//
//  Created by 佐藤 賢 on 2019/08/11.
//  Copyright © 2019 佐藤 賢. All rights reserved.
//

import Foundation

class GitHubAPIClient {
    func fetchRepositories(user: String, handler: @escaping ([GitHubRepository]?) -> Void) {
        let url = URL(string: "https://api.github.com/users/\(user)/repos")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                handler(nil)
                return
            }
            let repos = try! JSONDecoder().decode([GitHubRepository].self, from: data)
            DispatchQueue.main.async {
                handler(repos)
            }
        }
        task.resume()
    }
}
