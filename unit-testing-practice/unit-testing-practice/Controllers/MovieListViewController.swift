//
//  MovieListViewController.swift
//  unit-testing-practice
//
//  Created by Sunni Tang on 8/29/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    var movies = [Movie]()
    
    @IBOutlet weak var movieListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadMovieData()
        
    }
    
    private func configureTableView() {
        movieListTableView.delegate = self
        movieListTableView.dataSource = self
    }
    
    private func loadMovieData() {
        let moviesData = DataFetchingService.getMoviesDataFromJSON()
        // refactor later to not force unwrap, error enum?
        movies = MovieWrapper.getAllMovies(from: moviesData)!.movie
    }
    
}

extension MovieListViewController: UITableViewDelegate {}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieListTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movie = movies[indexPath.row]
        
        cell.textLabel?.text = movie.title
        
        return cell
    }
    
    
}
