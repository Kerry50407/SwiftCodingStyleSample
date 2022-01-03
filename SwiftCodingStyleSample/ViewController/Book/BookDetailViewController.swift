//
//  BookDetailViewController.swift
//  SwiftCodingStyleSample
//
//  Created by Kerry Dong on 2019/6/24.
//  Copyright © 2019 Kerry Dong. All rights reserved.
//

import UIKit

// MARK: - Order 2: Class defination
class BookDetailViewController: UIViewController {
    // MARK: - Order 4: IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var isNewArrival: UILabel!
    
    // MARK: - Order 5: Internal constants, variable
    var book: Book?
    
    // MARK: - Order 8: Override function
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Order 9: Fuction for intialization
    private func setup() {
        titleLabel.text = book?.title
        priceLabel.text = String(book?.price ?? 0)
        isNewArrival.text = "NewArrival: \(book?.isNewArrival ?? false)"
    }
}
