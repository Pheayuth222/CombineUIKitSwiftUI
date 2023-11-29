//
//  LoginScreen.swift
//  CombineUIKitSwiftUI
//
//  Created by KOSIGN on 29/11/23.
//

import SwiftUI

struct LoginScreen: View {
    
    weak var navigationController: UINavigationController?
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            // Login
            VStack (spacing: 12){
                Text("Welcome!")
                    .font(.title.bold())
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Username")
                        .font(.callout.bold())
                    CustomTF(hint: "Email", value: $email)
                    
                    Text("Password")
                        .font(.callout.bold())
                        .padding(15)
                    CustomTF(hint: "******", value: $password)
                    
                    Button(action: {
                        print(self.email)
                        print(self.password)
                    }, label: {
                        Text("Login")
                            .font(.title)
                    })
                    
                })
            }
        }
    }
    
    @ViewBuilder
    func CustomTF(hint: String, value: Binding<String>, isPassword: Bool = false) -> some View {
        Group {
            if isPassword {
                SecureField(hint, text: value)
            } else {
                TextField(hint, text: value)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
//        .background(.red)
    
    }
    
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
