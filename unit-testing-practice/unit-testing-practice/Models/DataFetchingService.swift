//
//  DataFetchingService.swift
//  unit-testing-practice
//
//  Created by Sunni Tang on 8/30/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

struct DataFetchingService {
    static func getJokesDataFromJSON() -> Data {
        guard let pathToJokesData = Bundle.main.path(forResource: "jokesData", ofType: "json") else {
            fatalError("jokesData.json file not found")
        }
        
        let jokesURL = URL(fileURLWithPath: pathToJokesData)
        
        do {
            let jokesData = try Data(contentsOf: jokesURL)
            return jokesData
        } catch {
            fatalError("Could not get data from jokesData.json: \(error)")
        }
    }
    
    static func getMoviesDataFromJSON() -> Data {
        guard let pathToMoviesData = Bundle.main.path(forResource: "starWarsMovieData", ofType: "json") else {
            fatalError("starWarsMovieData.json file not found")
        }
        
        let moviesURL = URL(fileURLWithPath: pathToMoviesData)
        
        do {
            let moviesData = try Data(contentsOf: moviesURL)
            return moviesData
        } catch {
            fatalError("Could not get data from starWarsMovieData.json: \(error)")
        }
    }
    
    static func getTriviaDataFromJSON() -> Data {
        guard let pathToTriviaData = Bundle.main.path(forResource: "triviaData", ofType: "json") else {
            fatalError("triviaData.json file not found")
        }
        
        let triviaURL = URL(fileURLWithPath: pathToTriviaData)
        
        do {
            let triviaData = try Data(contentsOf: triviaURL)
            return triviaData
        } catch {
            fatalError("Could not get data from triviaData.json: \(error)")
        }
    }
}
