//
//  MovieDetailViewController.swift
//  IMDb Movies App
//
//  Created by Admin on 01/05/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movie : Movie?
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var popularityLabel: UILabel!
    
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var releasedDateLabel: UILabel!
    
    @IBOutlet weak var originalLanguageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    private func initViews() {
        if let movie = movie {
            loadPosterImage(posterUrl: movie.posterPath)
            titleLabel.text = movie.title
            popularityLabel.text = String(movie.popularity)
            overviewLabel.text = movie.overview
            releasedDateLabel.text = movie.releasedDate
            originalLanguageLabel.text = movie.originalLanguage
        }
    }
    
    private func loadPosterImage(posterUrl : String) {
        let completeUrl = IMAGE_BASE_URL + posterUrl
        print(completeUrl)
        downloadImage(url: completeUrl) { [weak self] (data) in
            if let data = data, let image = UIImage(data: data) {
                self?.posterImageView.image = image
            }
        }
    }
}
