//
//  GitHubRepositoryManagerTests.swift
//  GitHubRepositoryTests
//
//  Created by 佐藤 賢 on 2019/08/11.
//  Copyright © 2019 佐藤 賢. All rights reserved.
//

import XCTest
@testable import GitHubRepository

class GitHubRepositoryManagerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMajorRepositories() {
        let testRepositories: [GitHubRepository] = [
        GitHubRepository(id: 0, star: 9, name: ""),
        GitHubRepository(id: 1, star: 10, name: ""),
        GitHubRepository(id: 2, star: 11, name: "")
        ]
        
        let mockClient = MockGitHubAPIClient(repositories: testRepositories)
        
        let manager = GitHubRepositoryManager(client: mockClient)
        
        manager.load(user: "apple") {
            XCTAssertEqual(mockClient.argsUser, "apple")
            
            XCTAssertEqual(manager.majorRepositories.count, 2)

            XCTAssertEqual(manager.majorRepositories[0].id, 1)
            XCTAssertEqual(manager.majorRepositories[1].id, 2)
        }
    }
}

class MockGitHubAPIClient: GitHubAPIClientProtocol {
    var returnRepositories: [GitHubRepository]
    var argsUser: String?
    
    init(repositories: [GitHubRepository]) {
        self.returnRepositories = repositories
    }

    func fetchRepositories(user: String, handler: @escaping ([GitHubRepository]?) -> Void) {
        self.argsUser = user
        handler(self.returnRepositories)
    }
}
