//
//  MovieLibraryDataServiceTests.swift
//  FilmFestTests
//
//  Created by Muhammad on 26/07/2024.
//  Copyright © 2024 Author. All rights reserved.
//

import XCTest
@testable import FilmFest
final class MovieLibraryDataServiceTests: XCTestCase {

    var sut:MovieLibraryDataService!
    var libraryTableView : UITableView!
    
    var libraryVC : LibraryViewController!
    var tableViewMock : TableViewMock!
    
    let fairyTale = Movie(title: "Fairy Tale")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "Dark Comedy")

    override func setUp() {
        super.setUp()
        
        
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        
        libraryTableView = libraryVC.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTableViewSection_Count_ReturnsTwo(){
        let section = libraryTableView.numberOfSections
        XCTAssertEqual(section, 2)
    }
    
    func testTableViewSections_SectionOne_ReturnsMoviesToSeeCount(){
//        sut.movieManager?.addMovie(movie: fairyTale)
//        sut.movieManager?.addMovie(movie: darkComedy)
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
//        
//        sut.movieManager?.addMovie(movie: thriller)
//        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 5)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesSeenCount(){
//        sut.movieManager?.addMovie(movie: fairyTale)
//        sut.movieManager?.addMovie(movie: darkComedy)
//        
//        sut.movieManager?.checkOfMovieAt(index: 0)
//        
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
//        
//        sut.movieManager?.checkOfMovieAt(index: 0)
//        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 0)
    }
    
    //MARK: Cells
    
    func testCell_RowAtIndex_ReturnsmoviCell(){
        sut.movieManager?.addMovie(movie: darkComedy)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_ShouldDequeCell(){
        sut.movieManager?.addMovie(movie: thriller)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(tableViewMock.cellDequedProperly)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData(){
        sut.movieManager?.addMovie(movie: fairyTale)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock

        XCTAssertEqual(cell.movieData,fairyTale)
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData(){
        sut.movieManager?.addMovie(movie: darkComedy)
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.checkOfMovieAt(index: 0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock

        XCTAssertEqual(cell.movieData,darkComedy)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie(){
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: darkComedy)
        libraryTableView.delegate?.tableView?(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)

    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectStringValues(){
        let section1Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 0)
        let section2Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies To See")
        XCTAssertEqual(section2Title, "Movies Seen")


    }
}
