//
//  DiscriptionArticleViewController.swift
//  NYT-Articles
//
//  Created by Kyrylo Hanichev on 26.03.2021.
//

import UIKit

class DiscriptionArticleViewController: UIViewController {
  
  // MARK: - Private Outlets
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var contentLabel: UILabel!
  
  // MARK: - Internal Properties
  
  internal var articleModel: ArticleModel?
  
  // MARK: - ViewController Lifecycle Methods
  
  override func viewWillAppear(_ animated: Bool) {
    titleLabel.text = articleModel?.title
    contentLabel.text = articleModel?.content
  }
}
