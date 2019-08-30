//
//  Movie.swift
//  unit-testing-practice
//
//  Created by Sunni Tang on 8/29/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

struct MovieWrapper: Codable {
    let movie: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movie = "results"
    }
    
    static func getAllMovies(from JSONData: Data ) -> MovieWrapper? {
        do {
            let allMovies = try JSONDecoder().decode(MovieWrapper?.self, from: JSONData)
            return allMovies
        } catch {
            return nil
        }
    }
}

struct Movie: Codable {
    let title: String
    let openingCrawl: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case openingCrawl = "opening_crawl"
    }
    
}
