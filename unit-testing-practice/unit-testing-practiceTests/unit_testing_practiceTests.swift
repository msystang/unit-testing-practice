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

    // Joke Data
    private func getJokesDataFromJSON() -> Data {
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
    
    func testJokesDataExists() {
        let jokesDataFromJSON = getJokesDataFromJSON()
        
        let jokesData = Joke.getAllJokes(from: jokesDataFromJSON)
        
        XCTAssertTrue(jokesData != nil, "Could not load Joke data")
    }

}
