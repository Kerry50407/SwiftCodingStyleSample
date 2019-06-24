//
//  ViewController.swift
//  SwiftCodingStyleSample
//
//  Created by Kerry Dong on 2019/6/24.
//  Copyright © 2019 Kerry Dong. All rights reserved.
//

import UIKit

// MARK: - Order 1: Protocol, Enum, Struct, class... for outter used
protocol WelcomeViewControllerDelegate {
    func doNothing()
}

// MARK: - Order 2: Class defination
class CaculatorBookListViewController: UIViewController {
    ///  Constants, variable
    // MARK: - Order 3: Protocol, Enum, Struct, class... for inner used
    private enum RowHeight: CGFloat {
        case sixty = 60.0
        case eighty = 80.0
    }
    
    // MARK: - Order 4: IBOutlet
    @IBOutlet weak var numberAddedTextField: UITextField!
    @IBOutlet weak var numberToBeAddedTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var bookTableView: UITableView!
    
    // MARK: - Order 5: Internal constants, variable
    var someVariable: Int?
    
    // MARK: - Order 6: Local constants, variable
    private var bookList: [Book] = []
    
    
    /////  Function
    // MARK: - Order 7: Init / Deinit function(If it has)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Init function
    }
    
    deinit {
        // Deinit function
    }
    
    // MARK: - Order 8: Override function
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueID.segueToBookDetailViewController, let bookDetail = segue.destination as? BookDetailViewController, let book = sender as? Book {
            
            bookDetail.book = book
        }
    }
    
    // MARK: - Order 9: Fuction for intialization
    private func setup() {
        BookManager.shared.delegate = self
        bookList = BookManager.shared.getBookList()
    }
    
    private func setupTableView() {
        bookTableView.dataSource = self
        bookTableView.delegate = self
    }
    
}

// MARK: - Order 10: Protocol to extension - Native class
extension CaculatorBookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let bookCell = bookTableView.dequeueReusableCell(withIdentifier:
            CellID.bookTableViewCell, for: indexPath) as? BookTableViewCell {
            bookCell.titleLabel.text = bookList[indexPath.row].title
            
            return bookCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RowHeight.sixty.rawValue
    }
}

extension CaculatorBookListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = bookList[indexPath.row]
        performSegue(withIdentifier: SegueID.segueToBookDetailViewController, sender: book)
    }
}

// MARK: - Order 11: Protocol to extension - Custom class
extension CaculatorBookListViewController: BookManagerDelegate {
    func hasUpdated(bookList: [Book]) {
        self.bookList = bookList
        bookTableView.reloadData()
    }
}

// MARK: - Order 12: IBAction function
extension CaculatorBookListViewController {
    @IBAction func alertButtonTouchUpInside(_ sender: UIBarButtonItem) {
        showWelcomeAlertSheet()
    }
    
    @IBAction func calculateButtonTouchUpInside(_ sender: UIButton) {
        let numberAdded = Double(numberAddedTextField.text ?? "") ?? 0.0
        let numberToBeAdded = Double(numberToBeAddedTextField.text ?? "") ?? 0.0

        resultLabel.text = String(numberAdded + numberToBeAdded)
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: UIButton) {
        numberAddedTextField.text = ""
        numberToBeAddedTextField.text = ""
        resultLabel.text = String(0)
    }
}

// MARK: - Order 13: Group of specific outer function
extension CaculatorBookListViewController {
    func updateView() {
        
    }
}

// MARK: - Order 14: Group of specific inner function
extension CaculatorBookListViewController {
    private func showWelcomeAlertSheet() {
        let welcomeAlertSheet = UIAlertController(title: Constants.welcomeTitle,
                                          message: Constants.welcomeMessage,
                                          preferredStyle: .alert)
        let okAction = UIAlertAction(title: Constants.ok, style: .default, handler: nil)
        welcomeAlertSheet.addAction(okAction)
        
        present(welcomeAlertSheet, animated: true, completion: nil)
    }
    
}

