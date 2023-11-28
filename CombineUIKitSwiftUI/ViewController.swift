//
//  ViewController.swift
//  CombineUIKitSwiftUI
//
//  Created by YuthFight's MacBook Pro  on 27/11/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    var data: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = data {
            print("Retrieve data : \(data)")
        }
        
        view.backgroundColor = .white
        
        let labelName = UILabel()
        labelName.text = "Combine UIKit With SwiftUI"
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.font = .boldSystemFont(ofSize: 25)
        view.addSubview(labelName)
        
        let button = UIButton()
        button.setTitle("Navigate to SwiftUI Screen", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(openSwiftUIScreen), for: .touchUpInside)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            labelName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.topAnchor.constraint(equalTo: labelName.bottomAnchor,constant: 50)
        ])
    }
    
    @objc func openSwiftUIScreen() {
        let swiftUIViewController = UIHostingController(rootView: SwiftUINav(navigationController: self.navigationController))
        self.navigationController?.pushViewController(swiftUIViewController, animated: true)
    }


}

