//
//  File.swift
//  CombineUIKitSwiftUI
//
//  Created by YuthFight's MacBook Pro  on 23/7/24.
//

import Foundation

enum RowType: String, CaseIterable {
    case Profile
    case Info
    case Rewards
}

// big array model to store all contacts
struct DetailInfoModel <T> {
    var headerTitle : String?
    var value        : T?
    var rowType      : RowType
}

// properties of each contact
struct ContactInfo {
    var profile : String?
    var name : String?
    var icone : String?
    var title : String?
}

class SecondVM {
    
    var detailData : [DetailInfoModel<Any>] = []
    
    var contactData : [ContactInfo] = []
    
    func getData() {
        
        
        let profileSection = [
            ContactInfo(profile: "MyPic",name: "Yuth Fight",icone: "Edit", title: "Product Designer"),
        ]
        
        
        contactData = [
            ContactInfo(icone: "person.fill", title: "Username"),
            ContactInfo(icone: "heart.fill", title: "Health")
        ]
        
        let rewards = [
            ContactInfo(icone: "creditcard.fill", title: "My Reward"),
            ContactInfo(icone: "map.fill", title: "Prizes")
        ]
        
        _ = [
            ContactInfo(icone: "creditcard.fill", title: "My Reward"),
        ]
        
        detailData = [
            DetailInfoModel(headerTitle: "",value: profileSection,rowType: .Profile),
            DetailInfoModel(headerTitle: "",value: contactData,rowType: .Info),
            DetailInfoModel(headerTitle: "Rewards",value: rewards,rowType: .Rewards),
        ]
    }
    
}
