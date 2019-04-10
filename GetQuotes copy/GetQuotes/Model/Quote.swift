//
//  Quote.swift
//  GetQuotes
//
//  Created by Nelson Gonzalez on 4/10/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

struct QuoteResults: Decodable {
    
    var quote: Quote
}

struct Quote: Decodable {
    let author: String
    let body: String
    
    
    enum QuotesCodingKeys: String, CodingKey {
        case author
        case body
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: QuotesCodingKeys.self)
        
        let author = try container.decode(String.self, forKey: .author)
        let body = try container.decode(String.self, forKey: .body)
        
        self.author = author
        self.body = body
        
    }
    
}

//JSON Structure
/*
 
 {
    "qotd_date": "2014-07-04T03:00:00.000-05:00",
    "quote": {
        "id": 17025,
        "favorites_count": 0,
        "dialogue": false,
        "favorite": false,
        "tags": [
            "equality",
            "men"
                ],
        "url": "http://localhost:3000/quotes/abraham-lincoln/17025-fourscore-and-",
        "upvotes_count": 1,
        "downvotes_count": 0,
        "author": "Abraham Lincoln",
        "author_permalink": "abraham-lincoln",
        "body": "Fourscore and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal."
                }
 }
 
 */
