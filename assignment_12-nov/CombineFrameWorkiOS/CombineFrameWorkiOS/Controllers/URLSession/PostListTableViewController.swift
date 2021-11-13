//
//  PostListTableViewController.swift
//  CombineFrameWorkiOS
//
//  Created by Mohammad Talha on 12/11/21.
//

import UIKit
import Combine

class PostListTableViewController: UITableViewController {
    
    private var webService = Webservice()
    private var cancellable: AnyCancellable?
    private var posts = [Post]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cancellable =  self.webService.getPost()
            .catch { _ in Just([Post]())}
            .assign(to: \.posts, on: self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath)
        cell.textLabel?.text = "Title : " + self.posts[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
//        cell.textLabel?.text = "Body : " + self.posts[indexPath.row].body
        return cell
    }
    
}
