//
//  MockExtension.swift
//  FilmFestTests
//
//  Created by Muhammad on 26/07/2024.
//  Copyright © 2024 Author. All rights reserved.
//

import UIKit
@testable import FilmFest

extension MovieLibraryDataServiceTests{
    class TableViewMock: UITableView{
        var cellDequedProperly = false
        class func initMock(dataSource : MovieLibraryDataService)->TableViewMock{
            let mock = TableViewMock(frame: CGRect(x: 0, y: 0, width: 300, height: 500), style: .plain)
            mock.dataSource = dataSource
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellID")
            
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
            cellDequedProperly = true
            return super.dequeueReusableCell(withIdentifier: identifier)
        }
    }
    
    class MovieCellMock:MovieCell{
        var movieData : Movie?
        override func configMovieCell(movie:Movie){
            movieData = movie
        }
        
    }
}

extension MovieCellTests{
    class MockCellDataSource : NSObject, UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
