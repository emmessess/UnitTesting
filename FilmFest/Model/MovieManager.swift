//
//  MovieManager.swift
//  FilmFest
//
//  Created by Muhammad on 26/07/2024.
//  Copyright © 2024 Author. All rights reserved.
//

import Foundation
class MovieManager {
    var moviesToSeeCount : Int {return moviesToSee.count}
    var moviesSeenCount : Int {return moviesSeen.count}
    
    private var moviesToSee = [Movie]()
    private var moviesSeen = [Movie]()

    func addMovie(movie:Movie){
        if !moviesToSee.contains(movie){
            moviesToSee.append(movie)
        }
    }
    
    func movieAt(index:Int)->Movie{
        return moviesToSee[index]
    }
    
    func checkOfMovieAt(index:Int){
        guard index < moviesToSeeCount else {return}

        let checkedMovie = moviesToSee.remove(at: index)
        moviesSeen.append(checkedMovie)

    }
    
    func checkedOffMovieAt(index:Int)->Movie{
        return moviesSeen[index]
    }
    
    func clearArrays(){
        moviesToSee.removeAll()
        moviesSeen.removeAll()

    }
}

func == (lhs:Movie,rhs:Movie)->Bool{
    if lhs.title != rhs.title{
        return false
    }
    
    if lhs.releasedYear != rhs.releasedYear{
        return false
    }
    return true
}
