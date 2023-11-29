//
//  CustomTableViewCell.swift
//  CombineUIKitSwiftUI
//
//  Created by KOSIGN on 29/11/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var imageUser : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var userNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    var descLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        contentView.addSubview(imageUser)
//        contentView.addSubview(userNameLabel)
//        contentView.addSubview(descLabel)
//
//        NSLayoutConstraint.activate([
//            imageUser.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
//            imageUser.centerYAnchor.constraint(equalTo: centerYAnchor),
//            imageUser.widthAnchor.constraint(equalToConstant: 40),
//            imageUser.heightAnchor.constraint(equalToConstant: 40),
//        ])
//
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imageUser)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(descLabel)
        
        NSLayoutConstraint.activate([
            imageUser.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            imageUser.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageUser.widthAnchor.constraint(equalToConstant: 40),
            imageUser.heightAnchor.constraint(equalToConstant: 40),
            
            userNameLabel.leadingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: 16),
            userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descLabel.leadingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: 16),
            descLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 4),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
