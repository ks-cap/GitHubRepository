//
//  ViewController.swift
//  GitHubRepository
//
//  Created by 佐藤 賢 on 2019/08/11.
//  Copyright © 2019 佐藤 賢. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var manager: GitHubRepositoryManager!

    @IBOutlet private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager = GitHubRepositoryManager()
        self.manager.load(user: "apple") { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.manager.majorRepositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let repository = self.manager.majorRepositories[indexPath.row]
        cell.textLabel?.text = repository.name
        return cell
    }
}
