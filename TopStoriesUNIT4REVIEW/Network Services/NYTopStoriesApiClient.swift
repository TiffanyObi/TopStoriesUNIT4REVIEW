//
//  NYTopStoriesApiClient.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/7/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import Foundation
import NetworkHelper

struct NYTTopStoriesAPIClient {
  static func fetchTopStories(for section: String, completion: @escaping (Result<[Article], AppError>) -> ()) {
    let endpointURLstring = "https://api.nytimes.com/svc/topstories/v2/nyregion.json?api-key=\(Config.apiKey)"
    
    guard let url = URL(string: endpointURLstring) else {
      completion(.failure(.badURL(endpointURLstring)))
      return
    }
    let request = URLRequest(url: url)
    
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completion(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
          let topStories = try JSONDecoder().decode(TopStories.self, from: data)
          completion(.success(topStories.results))
        } catch {
          completion(.failure(.decodingError(error)))
      }
    }
  }
}
}
