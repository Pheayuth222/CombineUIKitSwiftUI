//
//  HistoryVC.swift
//  CombineUIKitSwiftUI
//
//  Created by Yuth Fight on 26/7/24.
//

import UIKit
import SwiftUI

enum PaymentMethod : String,CaseIterable {
    case Payment = "Payment"
    case Deposit = "Deposit"
}

struct TransactionModel {
    var category            : String?
    var amount              : String?
    var transactionCount    : Int?
    var iconImage           : String?
    var colorBgView         : String?
    var paymentMethod       : PaymentMethod?
}

class HistoryVC: UIViewController {
    
    private var tableView = UITableView()
    
    private var transaction : [TransactionModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Transactions history"

        view.backgroundColor = .red
        self.setUpTableView()
        self.loadTransactions()
    }
    
    private func setUpTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TransactionCell.self, forCellReuseIdentifier: TransactionCell.identifier)
        tableView.register(HeaderTitleSectionCell.self, forCellReuseIdentifier: HeaderTitleSectionCell.identifier)
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
            TransactionModel(category: "Gym",amount: "$40.99", transactionCount: 2, iconImage: "gymIcon",colorBgView: "#D08900",paymentMethod: .Payment),
            TransactionModel(category: "Al-Bank",amount: "$460.00", transactionCount: 5, iconImage: "Chair2",colorBgView: "#29B83C",paymentMethod: .Deposit),
            TransactionModel(category: "McDonald",amount: "$34.10", transactionCount: 8, iconImage: "Chair3",colorBgView: "#DA95CA",paymentMethod: .Payment),
            TransactionModel(category: "Recipient",amount: "$320.19", transactionCount: 2, iconImage: "Chair4",colorBgView: "#D08900",paymentMethod: .Payment),
            TransactionModel(category: "그린주유소 하이패스(남인천) 하이패스(남인천) 하이패스(남인천) 하이패스(남인천) 그린주유소",amount: "$69,653", transactionCount: 3, iconImage: "Chair5",colorBgView: "#D08900",paymentMethod: .Deposit),
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableCell(withIdentifier: HeaderTitleSectionCell.identifier) as? HeaderTitleSectionCell {
            headerView.leftTileLabel.text = "Transactions history"
            return headerView
        } else {
            return UIView()
        }
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Transactions history"
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
}

class HeaderTitleSectionCell : UITableViewCell {
    
    static let identifier = "HeaderTitleSectionCell"
    
    
    var leftTileLabel : UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    let bgView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        bgView.backgroundColor = .white
        bgView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bgView)
        
        leftTileLabel.textColor = .purple
        leftTileLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        bgView.addSubview(leftTileLabel)
        
        NSLayoutConstraint.activate([
            bgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            bgView.widthAnchor.constraint(equalToConstant: 56),
            bgView.heightAnchor.constraint(equalToConstant: 56),
            
            leftTileLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor,constant: 20),
            leftTileLabel.centerYAnchor.constraint(equalTo: bgView.centerYAnchor)
        ])
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
        categoryLabel.numberOfLines = 2
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(categoryLabel)
        
        // Amount
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(amountLabel)
        
        // Transation
        transactionLabel.numberOfLines = 2
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
//        stackViewCover.spacing = 5
        stackViewCover.distribution = .fill
        stackViewCover.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackViewCover)
        
        NSLayoutConstraint.activate([
            
            // Background View Cover Image View
            bgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            bgView.widthAnchor.constraint(equalToConstant: 60),
            bgView.heightAnchor.constraint(equalToConstant: 60),
        
//            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            iconImageView.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            // StackView cover : Two Labels
//            stackViewCover.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackViewCover.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            stackViewCover.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -20),
            stackViewCover.leadingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: 10),
            stackViewCover.trailingAnchor.constraint(lessThanOrEqualTo: amountLabel.leadingAnchor, constant: 5),
//            stackViewCover.heightAnchor.constraint(equalToConstant: 70),
            
            // Right Amount Label
            amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            amountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        
        ])
    }
    
    func configureCell(with transaction: TransactionModel) {
        bgView.backgroundColor = UIColor.init(hexString: transaction.colorBgView ?? "",opacity: 0.15)
        iconImageView.image = UIImage(named: transaction.iconImage ?? "")
        categoryLabel.text = transaction.category
        amountLabel.text = transaction.paymentMethod == .Deposit ? "+ \(transaction.amount ?? "")" : "- \(transaction.amount ?? "")"
        transactionLabel.text = transaction.paymentMethod?.rawValue
//        transactionLabel.text = "\(transaction.transactionCount ?? 0) transactions"
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
