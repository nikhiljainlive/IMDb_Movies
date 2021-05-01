//
//  MoviesTableViewController.swift
//  IMDb Movies App
//
//  Created by Admin on 01/05/21.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    private var moviesViewModel : MoviesViewModel!
    private var movies = [Movie]() {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        moviesViewModel = Injector.provideMoviesViewModel()
        self.navigationController?.title = "Movies"
        registerTableViewCell()
        observeMovies()
    }
    
    private func registerTableViewCell() {
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: MovieTableViewCell.reuseIdentifier)
    }
    
    private func observeMovies() {
        self.movies = moviesViewModel.getMovies()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseIdentifier) as! MovieTableViewCell
        cell.bind(movie: movies[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let movieDetailVC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailViewController
        movieDetailVC.movie = movies[indexPath.row]
        self.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
