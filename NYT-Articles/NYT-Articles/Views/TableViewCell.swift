//
//  TableViewCell.swift
//  NYT-Articles
//
//  Created by Kyrylo Hanichev on 26.03.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
  
  // MARK: - Private Outlets
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var contentLabel: UILabel!
  
  // MARK: - Internal Methods
  
  internal func updateCell(responseModel: ArticleModel) {
    titleLabel.text = responseModel.title
    contentLabel.text = responseModel.content
  }
}
