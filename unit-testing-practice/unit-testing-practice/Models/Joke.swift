//
//  Joke.swift
//  unit-testing-practice
//
//  Created by Sunni Tang on 8/29/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

struct Joke: Codable {
    let setup: String
    let punchline: String
    
    static func getAllJokes(from JSONData: Data ) -> [Joke]? {
        do {
            let allJokes = try JSONDecoder().decode([Joke]?.self, from: JSONData)
            return allJokes
        } catch {
            return nil
        }
    }
}
