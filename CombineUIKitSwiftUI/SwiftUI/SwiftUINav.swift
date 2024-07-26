//
//  SwiftUINav.swift
//  CombineUIKitSwiftUI
//
//  Created by YuthFight's MacBook Pro  on 28/11/23.
//

import SwiftUI

struct SwiftUINav: View {
    
    weak var navigationController: UINavigationController?
    @State private var data : String = ""

        var body: some View {
            VStack {
                HStack {
                    Text("SwiftUI Screen")
                        .bold()
                        .font(.system(size: 21.0))
                }
                Spacer()
                    .frame(width: 1, height: 74, alignment: .bottom)
                TextField("Enter Text", text: $data)
                    .padding()
                VStack(alignment: .center){
                    Button(action: {
                        let viewController = ViewController()
                        viewController.data = self.data
                        
                        // Push the UIKit ViewController
                        UIApplication.shared.windows.first?.rootViewController?.present(viewController, animated: true, completion: nil)
//                        navigationController?.popViewController(animated: true)
                    }) {
                        Text("Navigate to UIKit Screen")
                            .font(.system(size: 21.0))
                            .bold()
                            .frame(width: UIScreen.main.bounds.width, height: 10, alignment: .center)
                    }
                }
                Spacer()
                    .frame(width: 2, height: 105, alignment: .bottom)
            }.navigationBarHidden(false)
        }
}

//#Preview {
//    SwiftUINav()
//}

struct SwiftUINav_Preview : PreviewProvider {
    static var previews: some View {
        SwiftUINav()
    }
}

