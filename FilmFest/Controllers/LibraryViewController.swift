//
//  ViewController.swift
//  FilmFest
//
//  Created by Author on 1/15/18.
//  Copyright © 2018 Author. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    @IBOutlet var dataService : MovieLibraryDataService!
    @IBOutlet weak var libraryTableView: UITableView!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataService.movieManager = movieManager
        
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releasedYear: "1999"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Horror", releasedYear: "1989"))

        dataService.movieManager?.addMovie(movie: Movie(title: "Crime Thriller", releasedYear: "1979"))

        dataService.movieManager?.addMovie(movie: Movie(title: "Indie Comedy"))

        dataService.movieManager?.addMovie(movie: Movie(title: "Kung Fu Flick"))
        libraryTableView.reloadData()

    }

}

