//
//  MovieCellTests.swift
//  FilmFestTests
//
//  Created by Muhammad on 26/07/2024.
//  Copyright © 2024 Author. All rights reserved.
//

import XCTest
@testable import FilmFest
final class MovieCellTests: XCTestCase {
    var libraryVC : LibraryViewController!
    var tableView : UITableView!
    var mockDataSource : MockCellDataSource!
    override func setUp() {
        super.setUp()
        
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        
        tableView = libraryVC.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCell_Config_ShouldSetLabelsToMovieData(){
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0 )) as! MovieCell
        
        cell.configMovieCell(movie: Movie(title: "Indie Comedy",releasedYear: "2000"))
        
        XCTAssertEqual(cell.textLabel?.text, "Indie Comedy")
        XCTAssertEqual(cell.detailTextLabel?.text, "2000")

    }

}
