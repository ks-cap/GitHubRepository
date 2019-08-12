//
//  GitHubRepositoryManager.swift
//  GitHubRepository
//
//  Created by 佐藤 賢 on 2019/08/11.
//  Copyright © 2019 佐藤 賢. All rights reserved.
//

class GitHubRepositoryManager {
    private let client: GitHubAPIClientProtocol
    private var repos: [GitHubRepository]?
    
    var majorRepositories: [GitHubRepository] {
        guard let repositories = self.repos else { return [] }
        return repositories.filter { $0.star >= 10 }
    }
    
    init(client: GitHubAPIClientProtocol = GitHubAPIClient()) {
        self.client = client
    }
    
    func load(user: String, completion: @escaping () -> Void) {
        client.fetchRepositories(user: user) { repositories in
            self.repos = repositories
            completion()
        }
    }
}
