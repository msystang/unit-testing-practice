//
//  QuestionListViewController.swift
//  unit-testing-practice
//
//  Created by Sunni Tang on 8/29/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class TriviaListViewController: UIViewController {
    
    var allTrivia = [Trivia]()
    
    @IBOutlet weak var triviaListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadTriviaData()
        
    }
    
    private func configureTableView() {
        triviaListTableView.delegate = self
        triviaListTableView.dataSource = self
    }
    
    private func loadTriviaData() {
        let triviaData = DataFetchingService.getTriviaDataFromJSON()
        // refactor later to not force unwrap, error enum?
        allTrivia = TriviaWrapper.getAllTrivia(from: triviaData)!.trivia
    }
    
}

extension TriviaListViewController: UITableViewDelegate {}

extension TriviaListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTrivia.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = triviaListTableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        let trivia = allTrivia[indexPath.row]
        
        cell.textLabel?.text = trivia.question
        
        return cell
    }
    
    
}
