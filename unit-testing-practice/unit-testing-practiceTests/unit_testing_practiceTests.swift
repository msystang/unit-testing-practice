//
//  unit_testing_practiceTests.swift
//  unit-testing-practiceTests
//
//  Created by Sunni Tang on 8/29/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import XCTest
@testable import unit_testing_practice

class unit_testing_practiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: -- Joke Data
    func testJokesDataExists() {
        let jokesDataFromJSON = DataFetchingService.getJokesDataFromJSON()
        
        let jokesData = Joke.getAllJokes(from: jokesDataFromJSON)
        
        XCTAssertTrue(jokesData != nil, "Could not load Joke data")
    }
    
    func testGetTenJokes() {
        let jokesDataFromJSON = DataFetchingService.getJokesDataFromJSON()
        
        let jokesData = Joke.getAllJokes(from: jokesDataFromJSON)
            
        XCTAssertTrue(jokesData?.count == 10, "Expected 10 jokes, got different number of jokes.")
    }
    
    
    // MARK: -- Star Wars Movie Data
    func testMoviesDataExists() {
        let moviesDataFromJSON = DataFetchingService.getMoviesDataFromJSON()
        
        let moviesData = MovieWrapper.getAllMovies(from: moviesDataFromJSON)
        
        XCTAssertTrue(moviesData != nil, "Could not load Movie data")
    }
 
    func testMoviesArrayExists() {
        let moviesDataFromJSON = DataFetchingService.getMoviesDataFromJSON()

        let moviesData = MovieWrapper.getAllMovies(from: moviesDataFromJSON)
        let moviesArray = moviesData?.movie
        
        XCTAssertTrue(moviesArray != nil, "Could not load Movie array data")
    }
    
    func testGetSevenMovies() {
        let moviesDataFromJSON = DataFetchingService.getMoviesDataFromJSON()
        
        let moviesData = MovieWrapper.getAllMovies(from: moviesDataFromJSON)
        let moviesArray = moviesData?.movie
        
        XCTAssertTrue(moviesArray?.count == 7, "Expected 7 movies, got different number of movies.")
    }

    
    // MARK: -- Trivia Movie Data
    func testTriviaDataExists() {
        let triviaDataFromJSON = DataFetchingService.getTriviaDataFromJSON()
        
        let triviaData = TriviaWrapper.getAllTrivia(from: triviaDataFromJSON)
        
        XCTAssertTrue(triviaData != nil, "Could not load Trivia data")
    }
    
    func testTriviaArrayExists() {
        let triviaDataFromJSON = DataFetchingService.getTriviaDataFromJSON()
        
        let triviaData = TriviaWrapper.getAllTrivia(from: triviaDataFromJSON)
        let triviaArray = triviaData?.trivia
        
        XCTAssertTrue(triviaArray != nil, "Could not load trivia array data")
    }
    
    func testGetTenTrivia() {
        let triviaDataFromJSON = DataFetchingService.getTriviaDataFromJSON()
        
        let triviaData = TriviaWrapper.getAllTrivia(from: triviaDataFromJSON)
        let triviaArray = triviaData?.trivia
        
        XCTAssertTrue(triviaArray?.count == 10, "Expected 10 trivia, got different number of movies.")
    }

}
