//
//  JokeDetailViewController.swift
//  unit-testing-practice
//
//  Created by Sunni Tang on 8/29/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class JokeDetailViewController: UIViewController {

    var joke: Joke?
    @IBOutlet weak var jokeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureObjects()
    }

    private func configureObjects() {
        jokeLabel.text = joke?.punchline
    }
}
