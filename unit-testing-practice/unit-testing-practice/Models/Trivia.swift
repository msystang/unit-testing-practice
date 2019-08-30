//
//  Question.swift
//  unit-testing-practice
//
//  Created by Sunni Tang on 8/29/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

struct TriviaWrapper: Codable {
    let trivia: [Trivia]
    
    private enum CodingKeys: String, CodingKey {
        case trivia = "results"
    }
    
    static func getAllTrivia(from JSONData: Data ) -> TriviaWrapper? {
        do {
            let decoder = JSONDecoder()
            let allTrivia = try decoder.decode(TriviaWrapper?.self, from: JSONData)
            return allTrivia
        } catch {
            print(error)
            return nil
        }
    }
    
}

struct Trivia: Codable {
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    private enum CodingKeys: String, CodingKey {
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
    
    
}

