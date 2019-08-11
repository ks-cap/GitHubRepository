//
//  GitHubRepository.swift
//  GitHubRepository
//
//  Created by 佐藤 賢 on 2019/08/11.
//  Copyright © 2019 佐藤 賢. All rights reserved.
//

struct GitHubRepository: Codable, Equatable {
    let id: Int
    let star: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case star = "stargazers_count"
        case name
    }
}
