//
//  ArticleModel.swift
//  NYT-Articles
//
//  Created by Kyrylo Hanichev on 23.03.2021.
//

import Foundation

struct ResponseModel: Codable {
  
  internal var response: DocsModel
   
   private enum CodingKeys: String, CodingKey {
     case response = "response"
   }
}

struct DocsModel: Codable {
  
  internal var docs: [ArticleModel]
   
   private enum CodingKeys: String, CodingKey {
     case docs = "docs"
   }
}

struct ArticleModel: Codable {
  
  internal let title: String
  internal let content: String
  
  private enum CodingKeys: String, CodingKey {
    case content = "lead_paragraph"
    case title = "section_name"
  }
}
