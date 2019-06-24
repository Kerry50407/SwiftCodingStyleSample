//
//  BookManager.swift
//  SwiftCodingStyleSample
//
//  Created by Kerry Dong on 2019/6/24.
//  Copyright © 2019 Kerry Dong. All rights reserved.
//

import Foundation

// MARK: - Order 1: Protocol, Enum, Struct, class... for outter used
protocol BookManagerDelegate: NSObject {
    func hasUpdated(bookList: [Book])
}

// MARK: - Order 2: Class defination
class BookManager {
    // MARK: - Order 5: Internal constants, variable
    static let shared = BookManager()
    weak var delegate: BookManagerDelegate?
    
    // MARK: - Order 6: Local constants, variable
    private var updateBookListTimer: Timer?
    private static let updateInterval = 10.0
    
    private let BookList = [
        [Book(title: "Thinking in JAVA", price: 750, isNewArrival: false),
         Book(title: "Effective in JAVA", price: 800, isNewArrival: false)],
        [Book(title: "Objective C tutorial", price: 500, isNewArrival: false),
         Book(title: "Master in Objective C", price: 900, isNewArrival: true)],
        [Book(title: "iOS 12 Programming in Beginners", price: 1200, isNewArrival: true),
         Book(title: "Swift in Depth", price: 1800, isNewArrival: true),
         Book(title: "Swift Game Development", price: 400, isNewArrival: true)]]
    
    /////  Function
    // MARK: - Order 7: Init / Deinit function(If it has)
    private init() {
        setup()
    }
    
    deinit {
        updateBookListTimer?.invalidate()
        updateBookListTimer = nil
    }
    
    // MARK: - Order 9: Fuction for intialization
    private func setup() {
        updateBookListTimer = Timer.scheduledTimer(withTimeInterval: BookManager.updateInterval, repeats: true, block: { [weak self] (timer) in
            guard let strongSelf = self else {
                return
            }
            let randomIndex = Int.random(in: 0 ..< 3)
            strongSelf.delegate?.hasUpdated(bookList: strongSelf.BookList[randomIndex])
        })
    }
}

// MARK: - Order 11: Function for other class used
extension BookManager {
    func getBookList() -> [Book] {
        let randomIndex = Int.random(in: 0 ..< 3)
        return BookList[randomIndex]
    }
    
    func invalidateBookListTimer() {
        updateBookListTimer?.invalidate()
        updateBookListTimer = nil
    }
}
