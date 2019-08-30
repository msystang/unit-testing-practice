//
//  MovieDetailViewController.swift
//  unit-testing-practice
//
//  Created by Sunni Tang on 8/29/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movie: Movie?
    @IBOutlet weak var crawlLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureObjects()
    }
    
    private func configureObjects() {
        crawlLabel.text = movie?.openingCrawl
    }
 

}
