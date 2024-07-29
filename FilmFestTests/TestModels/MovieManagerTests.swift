//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Muhammad on 26/07/2024.
//  Copyright © 2024 Author. All rights reserved.
//

import XCTest
@testable import FilmFest

final class MovieManagerTests: XCTestCase {
    var sut : MovieManager!
    
    let sciFiMovie = Movie(title: "Avengers")
    let artHouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "mission Impossible")
    
    override func setUp() {
        sut = MovieManager()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    //MARK: Initial Values
    
    func testInitMoviesToSee_ReturnZero(){
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInitMoviesSeen_ReturnZero(){
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK: Add & Query
    
    func testAddMoviesToSee_ReturnOne(){
        sut.addMovie(movie:actionMovie)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnMovieAtIndex(){
        sut.addMovie(movie:artHouseMovie)
        
        let movieQueried = sut.movieAt(index:0)
        XCTAssertEqual(artHouseMovie.title,movieQueried.title)
    }
    
    // MARK: Checking Off
    
    func testCheckOffMovie_UpdatesMovieManagerCounts(){
        sut.addMovie(movie:actionMovie)
        sut.checkOfMovieAt(index:0)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)

    }
    
    func testCheckOffMovie_UpdatesMovieManagerCountRemovesMovieFromArray(){
        sut.addMovie(movie:sciFiMovie)
        sut.addMovie(movie:artHouseMovie)
        sut.checkOfMovieAt(index:0)
        XCTAssertEqual(sut.movieAt(index: 0).title, artHouseMovie.title)

    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex(){
        sut.addMovie(movie:sciFiMovie)
        sut.checkOfMovieAt(index: 0)
        let movieQueried = sut.checkedOffMovieAt(index:0)
        XCTAssertEqual(sciFiMovie.title,movieQueried.title)

    }
    
    //MARK: Clearing and Resetting
    func testClearArrays_ReturnsArrayCountsOfZero(){
        sut.addMovie(movie: actionMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOfMovieAt(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)

        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK: Duplicates
    
    func testDuplicatesMovie_ShouldNotBeAddedToArray(){
        sut.addMovie(movie: sciFiMovie)
        sut.addMovie(movie: sciFiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)

    }
}
