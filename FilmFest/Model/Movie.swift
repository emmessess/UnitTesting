//
//  Moview.swift
//  FilmFest
//
//  Created by Muhammad on 25/07/2024.
//  Copyright © 2024 Author. All rights reserved.
//

import Foundation
struct Movie : Equatable{
    let title : String!
    let releasedYear : String?
    
    init(title: String!, releasedYear: String? = nil) {
        self.title = title
        self.releasedYear = releasedYear
    }
    
    
}
