//
//  ArticleTableViewController.swift
//  NYT-Articles
//
//  Created by Kyrylo Hanichev on 24.03.2021.
//

import UIKit

class ArticleTableViewController: UIViewController {
  
  // MARK: - Private Outlets
  
  @IBOutlet private weak var tableView: UITableView!
  
  // MARK: - Private Properties
  
  private let reusableIdentifier = "tableViewCell"
  
  var responseModel: ResponseModel? = nil {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  // MARK: - ViewController Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: reusableIdentifier)
    tableView.rowHeight = UITableView.automaticDimension
  }
}

// MARK: - Extensions

extension ArticleTableViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return responseModel?.response.docs.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier,
                                                   for: indexPath) as? TableViewCell,
          let responseModel = responseModel?.response.docs[indexPath.row] else { return TableViewCell() }
    cell.updateCell(responseModel: responseModel)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let viewController = storyboard?.instantiateViewController(identifier: "DiscriptionArticleViewController")
    guard let discriptionArticleViewController = viewController as? DiscriptionArticleViewController else { return }
    discriptionArticleViewController.articleModel = responseModel?.response.docs[indexPath.row]
    navigationController?.pushViewController(discriptionArticleViewController, animated: true)
  }
}
