//
//  InterfaceController.swift
//  GetQuotes-WatchOS Extension
//
//  Created by Nelson Gonzalez on 4/10/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import WatchKit
import Foundation



class InterfaceController: WKInterfaceController {
    @IBOutlet weak var quoteLabel: WKInterfaceLabel!
    @IBOutlet weak var authorLabel: WKInterfaceLabel!
    
    
    let quotesController = QuotesController()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        quotesController.getQuotes { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    
    }
    
    private func updateViews() {
        
        let body = quotesController.quotes.map({$0.body}).first
        let author = quotesController.quotes.map({$0.author}).first
        quoteLabel.setText(body)
        authorLabel.setText(author)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
