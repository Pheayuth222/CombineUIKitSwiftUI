//
//  HomeCraftVC.swift
//  CombineUIKitSwiftUI
//
//  Created by Yuth Fight on 26/7/24.
//

import UIKit
import SwiftUI

struct Chair {
    let name: String
    let price: String
    let description: String
    let imageName: String
}


class HomeCraftVC: UIViewController {
    
    lazy var labelName : UILabel = {
        let label = UILabel()
        label.text = "Yuth Fight"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var collectionView : UICollectionView!
    
    
    let chairs = [
        Chair(name: "Amos Chair", price: "$680", description: "A modern take on tradition", imageName: "Chair1"),
        Chair(name: "Kew Chair", price: "$580", description: "A modern take on tradition", imageName: "Chair2"),
        Chair(name: "Buro Chair", price: "$680", description: "A modern take on tradition", imageName: "Chair3"),
        Chair(name: "Tinar Chair", price: "$480", description: "A modern take on tradition", imageName: "Chair4"),
        Chair(name: "Nala Chair", price: "$720", description: "A modern take on tradition", imageName: "Chair5"),
        Chair(name: "Palo Chair", price: "$650", description: "A modern take on tradition", imageName: "Chair6"),
        Chair(name: "Zino Chair", price: "$550", description: "A modern take on tradition", imageName: "Chair7"),
        Chair(name: "Duno Chair", price: "$600", description: "A modern take on tradition", imageName: "Chair8"),
        Chair(name: "Miko Chair", price: "$490", description: "A modern take on tradition", imageName: "Chair9"),
        Chair(name: "Fino Chair", price: "$530", description: "A modern take on tradition", imageName: "Chair10")
        // Add more chairs
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.setUpCollectionView()
        
    }
    
    
    // Custom somethins you want
    private func setUpCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width / 2 - 16, height: 250)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 11, bottom: 16, right: 11)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(ChairCollectionCell.self, forCellWithReuseIdentifier: "ChairCollectionCell")
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: super.view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: super.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: super.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: super.view.bottomAnchor)
        ])
    }

}

extension HomeCraftVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chairs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChairCollectionCell", for: indexPath) as! ChairCollectionCell
            let chair = chairs[indexPath.item]
        cell.nameLabel.text = chair.name
        cell.priceLabel.text = chair.price
        cell.descriptionLabel.text = chair.description
        cell.imageView.image = UIImage(named: chair.imageName)
            return cell
        }
}

class ChairCollectionCell: UICollectionViewCell {

    let imageView = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let descriptionLabel = UILabel()
    let addToCartButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addDropShadow() {
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.1
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        contentView.layer.masksToBounds = false
    }

    private func setupViews() {
        addDropShadow()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(descriptionLabel)
        addSubview(addToCartButton)

        imageView.contentMode = .scaleAspectFit
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        priceLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textColor = .gray
        addToCartButton.setImage(UIImage(systemName: "cart"), for: .normal)

        // Layout constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

            descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

            addToCartButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            addToCartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            addToCartButton.widthAnchor.constraint(equalToConstant: 24),
            addToCartButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}


struct HomeCraftVCPreview: UIViewControllerRepresentable {
  
  var viewControllerBuilder: () -> HomeCraftVC
  
  init(_ viewControllerBuilder: @escaping () -> HomeCraftVC) {
    self.viewControllerBuilder = viewControllerBuilder
  }
  
  func makeUIViewController(context: Context) -> some UIViewController {
    viewControllerBuilder()
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
   // Nothing to do here
  }
 
}

struct HomeCraftVC_Previews: PreviewProvider {
  static var previews: some View {
      HomeCraftVCPreview {
          HomeCraftVC()
    }
  }
}
