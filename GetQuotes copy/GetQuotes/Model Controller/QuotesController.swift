//
//  QuotesController.swift
//  GetQuotes
//
//  Created by Nelson Gonzalez on 4/10/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

class QuotesController {
    
    private(set) var quotes: [Quote] = []
    
    private let baseUrl = URL(string: "https://favqs.com/api/qotd")!
    
    func getQuotes(completion: @escaping(Error?)-> Void) {
        
        let request = URLRequest(url: baseUrl)
    
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error with the request: \(error)")
                completion(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil)
                return
            }
            
            switch response.statusCode {
                
            case 200:
                if let data = data {
                    print("No data returned: \(String(describing: error))")
                    completion(error)
                    do {
                        let decoder = JSONDecoder()
                        
                        let quotes = try decoder.decode(QuoteResults.self, from: data)
                        self.quotes.append(quotes.quote)
                        completion(nil)
                        
                    } catch {
                        print("Error decoding data: \(error)")
                        completion(error)
                    }
                }
                break
            default:
                completion(error)
                break
            }
            
            }.resume()
        
    }
}
