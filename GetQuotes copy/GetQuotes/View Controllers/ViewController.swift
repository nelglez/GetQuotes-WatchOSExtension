//
//  ViewController.swift
//  GetQuotes
//
//  Created by Nelson Gonzalez on 4/10/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quotesTextView: UITextView!
    @IBOutlet weak var authorLabel: UILabel!
    
    let quotesController = QuotesController()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        authorLabel.text = nil
        
    }
    
    private func updateViews() {
        let body = quotesController.quotes.map({$0.body}).first
        let author = quotesController.quotes.map({$0.author}).first
        quotesTextView.text = body
        authorLabel.text = author
    }

    @IBAction func fetchQuoteButtonPressed(_ sender: UIButton) {
        
        quotesController.getQuotes { (error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                self.updateViews()
            }
            
        }
    }
    
}

