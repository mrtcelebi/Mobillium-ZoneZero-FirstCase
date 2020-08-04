//
//  MovieViewController.swift
//  Mobillium-ZoneZero-FirstCase
//
//  Created by Catalina on 4.08.2020.
//  Copyright © 2020 Catalina. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let movie = Movie()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func showTitleLabel(title: String) {
        
        let alert = UIAlertController(title: "",
                                      message: title,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss",
                                      style: .cancel,
                                      handler: nil))
        
        present(alert, animated: true)
            
    }
}


//MARK: - TableView DataSource

extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.movieTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.movieCell, for: indexPath) as! MovieCell
        cell.movieTitleLabel.text = movie.movieTitleArray[indexPath.row]
        return cell
    }
}

//MARK: - TableView Delegate

extension MovieListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        showTitleLabel(title: movie.movieTitleArray[indexPath.row])
        
    }
}


