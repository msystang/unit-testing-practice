//
//  ViewController.swift
//  unit-testing-practice
//
//  Created by Sunni Tang on 8/29/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class JokeListViewController: UIViewController {

    var jokes = [Joke]()
    @IBOutlet weak var jokeListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadJokeData()
        
    }

    private func configureTableView() {
        jokeListTableView.delegate = self
        jokeListTableView.dataSource = self
    }
    
    private func loadJokeData() {
        let jokesData = DataFetchingService.getJokesDataFromJSON()
        // refactor later to not force unwrap, error enum?
        jokes = Joke.getAllJokes(from: jokesData)!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndex = jokeListTableView.indexPathForSelectedRow else { fatalError("No cell was selected") }
        guard segue.identifier == "jokeCellToDetailSegue" else { fatalError("Unidentified segue") }
        guard let jokeDetailsVC = segue.destination as? JokeDetailViewController else { fatalError("No destination View Controller") }
        
        jokeDetailsVC.joke = jokes[selectedIndex.row]
    }
    
}

extension JokeListViewController: UITableViewDelegate {}

extension JokeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jokeListTableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        let joke = jokes[indexPath.row]
        
        cell.textLabel?.text = joke.setup
        
        return cell
    }
    
    
}
