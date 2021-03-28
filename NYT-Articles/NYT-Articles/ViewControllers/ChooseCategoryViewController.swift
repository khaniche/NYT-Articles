//
//  ChooseCategoryViewController.swift
//  NYT-Articles
//
//  Created by Kyrylo Hanichev on 23.03.2021.
//

import UIKit

class ChooseCategoryViewController: UIViewController {
  
  // MARK: - Private Outlets
  
  @IBOutlet private var categoryButton: [UIButton]!
  @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
  
  // MARK: - Private Properties
  
  private let baseURL = "https://api.nytimes.com/svc/search/v2/articlesearch.json?"
  private let apiKey = "pP3PHeGwBk1VXcuzu5zx5KcUn13RrsE0"
  private let categoryField = "fq=news_desk:"
  
  private var responseModel: ResponseModel? = nil {
    didSet {
      DispatchQueue.main.async {
        self.activityIndicator.stopAnimating()
      }
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    buttonIsEnabled(isEnabled: true)
  }
  
  // MARK: - IBActions
  
  @IBAction private func artsButton(_ sender: UIButton) {
    fetchCategories(categoryString: "Arts")
    buttonIsEnabled(isEnabled: false)
  }
  
  @IBAction private func foodButton(_ sender: UIButton) {
    fetchCategories(categoryString: "Food")
    buttonIsEnabled(isEnabled: false)
  }
  
  @IBAction private func travelButton(_ sender: UIButton) {
    fetchCategories(categoryString: "Travel")
    buttonIsEnabled(isEnabled: false)
  }
  
  // MARK: - Private Methods
  
  private func showErrorMessage(message: String) {
    DispatchQueue.main.async {
      let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
      alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
      self.present(alertController, animated: true)
      self.activityIndicator.stopAnimating()
    }
  }
  
  private func buttonIsEnabled(isEnabled: Bool) {
    for index in categoryButton {
      index.isEnabled = isEnabled
    }
  }
  
  private func navigateToArticleTableViewController() {
    DispatchQueue.main.async {
      let viewController = self.storyboard?.instantiateViewController(identifier: "ArticleTableViewController")
      guard let articleTableViewController = viewController as? ArticleTableViewController else { return }
      articleTableViewController.responseModel = self.responseModel
      self.navigationController?.pushViewController(articleTableViewController, animated: true)
    }
  }
  
  private func setupActivityIndicator() {
    activityIndicator.scaleIndicator(factor: 2)
    activityIndicator.color = .white
    activityIndicator.startAnimating()
  }
  
  private func fetchCategories(categoryString: String) {
    setupActivityIndicator()
    guard let url = URL(string: baseURL + "fq=news_desk:(\(categoryString))" + "&api-key=\(apiKey)") else { return }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let session = URLSession(configuration: .default)
    session.dataTask(with: request, completionHandler: { [weak self] data, response, error in
      guard let self = self else { return }
      if let error = error {
        self.showErrorMessage(message: error.localizedDescription)
      }
      guard let data = data else { return }
      do {
        let results = try JSONDecoder().decode(ResponseModel.self, from: data)
        self.responseModel = results
        self.navigateToArticleTableViewController()
      } catch let error {
        self.showErrorMessage(message: error.localizedDescription)
      }
    }).resume()
  }
}
