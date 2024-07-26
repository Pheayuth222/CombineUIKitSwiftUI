//
//  HistoryVC.swift
//  CombineUIKitSwiftUI
//
//  Created by Yuth Fight on 26/7/24.
//

import UIKit
import SwiftUI

struct TransactionModel {
    var category       : String?
    var amount      : String?
    var transactionCount     : Bool?
    var iconImage     : String?
}

class HistoryVC: UIViewController {
    
    private var tableView = UITableView()
    
    private var transaction : [TransactionModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Your Title Here"

        view.backgroundColor = .red
        self.setUpTableView()
        self.loadTransactions()
    }
    
    private func setUpTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TransactionCell.self, forCellReuseIdentifier: TransactionCell.identifier)
//        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func loadTransactions() {
        self.transaction = [
            TransactionModel(category: "하이패스(남인천)",amount: "900 원", transactionCount: true, iconImage: "Chair1"),
            TransactionModel(category: "하이패스(남인천)",amount: "720 원", transactionCount: false, iconImage: "Chair2"),
            TransactionModel(category: "그린주유소",amount: "69,653 원", transactionCount: true, iconImage: "Chair3"),
            TransactionModel(category: "그린주유소",amount: "69,653 원", transactionCount: true, iconImage: "Chair4"),
            TransactionModel(category: "그린주유소",amount: "69,653 원", transactionCount: true, iconImage: "Chair5"),
        ]
        self.tableView.reloadData()
    }
    
}

extension HistoryVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transaction.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: TransactionCell.identifier, for: indexPath) as? TransactionCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(with: transaction[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
}


class TransactionCell: UITableViewCell {
    
    static let identifier  = "TransactionCell"
    
    let iconImageView = UIImageView()
    let categoryLabel    = UILabel()
    let amountLabel = UILabel()
    let transactionLabel = UILabel()
    
    let bgView = UIView()
    
    let stackViewCover = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // Background View
        bgView.backgroundColor = .red
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.layer.cornerRadius = 15
        contentView.addSubview(bgView)
        
        // imageView
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImageView)
        
         
        // category
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(categoryLabel)
        
        // Amount
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(amountLabel)
        
        // Transation
        transactionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(transactionLabel)
        
        // Set Font
        categoryLabel.font      = UIFont.systemFont(ofSize: 18,weight: .medium)
        amountLabel.font        = UIFont.systemFont(ofSize: 18, weight: .medium)
        transactionLabel.font   = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        // UIStackView
        stackViewCover.axis = .vertical
        stackViewCover.addArrangedSubview(categoryLabel)
        stackViewCover.addArrangedSubview(transactionLabel)
        stackViewCover.spacing = 5
        stackViewCover.distribution = .fillEqually
        stackViewCover.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackViewCover)
        
        NSLayoutConstraint.activate([
            
            bgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            bgView.widthAnchor.constraint(equalToConstant: 60),
            bgView.heightAnchor.constraint(equalToConstant: 60),
        
//            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            iconImageView.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            
            stackViewCover.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackViewCover.leadingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: 10),
            stackViewCover.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: -15),
            stackViewCover.heightAnchor.constraint(equalToConstant: 50),
            
            
            amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            amountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        
        ])
    }
    
    func configureCell(with transaction: TransactionModel) {
        iconImageView.image = UIImage(named: transaction.iconImage ?? "")
        categoryLabel.text = transaction.category
        amountLabel.text = transaction.amount
        transactionLabel.text = "\(transaction.transactionCount ?? false) transactions"
    }
}



// MARK: - Preview UIKit

struct HistoryVCPreview: UIViewControllerRepresentable {
  
  var viewControllerBuilder: () -> HistoryVC
  
  init(_ viewControllerBuilder: @escaping () -> HistoryVC) {
    self.viewControllerBuilder = viewControllerBuilder
  }
  
  func makeUIViewController(context: Context) -> some UIViewController {
    viewControllerBuilder()
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
   // Nothing to do here
  }
 
}

struct HistoryVC_Previews: PreviewProvider {
  static var previews: some View {
      HistoryVCPreview {
          HistoryVC()
    }
  }
}
