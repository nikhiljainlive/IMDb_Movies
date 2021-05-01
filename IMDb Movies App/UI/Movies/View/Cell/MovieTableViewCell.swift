//
//  TableViewCell.swift
//  IMDb Movies App
//
//  Created by Admin on 01/05/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    static let reuseIdentifier = "MovieTableViewCell"
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var movieLanguageLabel: UILabel!
    
    @IBOutlet weak var movieReleasedLabel: UILabel!
    
    func bind(movie : Movie) {
        posterImageView.image = UIImage(named: "poster-placeholder")
        loadPosterImage(posterUrl : movie.posterPath)
        movieTitleLabel.text = movie.title
        movieLanguageLabel.text = movie.originalLanguage
        movieReleasedLabel.text = movie.releasedDate
    }
    
    private func loadPosterImage(posterUrl : String) {
        
        let completeUrl = IMAGE_BASE_URL + posterUrl
        downloadImage(url: completeUrl) { [weak self] (data) in
            if let data = data, let image = UIImage(data: data) {
                self?.posterImageView.image = image
            }
        }
    }
}
