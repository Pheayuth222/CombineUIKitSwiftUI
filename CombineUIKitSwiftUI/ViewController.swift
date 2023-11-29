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
    
    let tableView = UITableView()
    
    var menuList : [String] = [""]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        
        if let data = data {
            print("Retrieve data : \(data)")
        }
        
//        view.backgroundColor = .white
//
//        let labelName = UILabel()
//        labelName.text = "Combine UIKit With SwiftUI"
//        labelName.translatesAutoresizingMaskIntoConstraints = false
//        labelName.font = .boldSystemFont(ofSize: 25)
//        view.addSubview(labelName)
//
//        let button = UIButton()
//        button.setTitle("Navigate to SwiftUI Screen", for: .normal)
//        button.titleLabel?.textAlignment = .center
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitleColor(.blue, for: .normal)
//        button.addTarget(self, action: #selector(openSwiftUIScreen), for: .touchUpInside)
//        view.addSubview(button)
//
//        NSLayoutConstraint.activate([
//            labelName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            button.topAnchor.constraint(equalTo: labelName.bottomAnchor,constant: 50)
//        ])
        
    }
    
    private func setUpTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        view.addSubview(tableView)
        
        tableView.separatorStyle = .none
        
        // Set  the constraints for the TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func openSwiftUIScreen() {
        let swiftUIViewController = UIHostingController(rootView: SwiftUINav(navigationController: self.navigationController))
        self.navigationController?.pushViewController(swiftUIViewController, animated: true)
    }


}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.userNameLabel.text = "Hello"
        cell.descLabel.text = "Testing Text"
        cell.imageUser.image = UIImage(systemName: "person.fill")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let swiftUIViewController = UIHostingController(rootView: SwiftUINav(navigationController: self.navigationController))
            self.navigationController?.pushViewController(swiftUIViewController, animated: true)
        } else if indexPath.row == 1 {
            let swiftUIViewController = UIHostingController(rootView: LoginScreen(navigationController: self.navigationController))
            self.navigationController?.pushViewController(swiftUIViewController, animated: true)
        } else {
            let swiftUIViewController = UIHostingController(rootView: TabBarView(navigationController: self.navigationController))
            self.navigationController?.pushViewController(swiftUIViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
}
