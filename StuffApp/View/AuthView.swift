//
//  AuthView.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 14/01/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signIn() {
        session.signIn(email: email, password: password) { result, error in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Welcome back!")
                .font(.system(size: 32, weight: .heavy))
            Text("Sign in to continue")
            .font(.system(size: 18, weight: .medium))
                .foregroundColor(.gray)
            
            VStack(spacing: 18) {
                TextField("Email adress", text: $email)
                    .font(.system(size: 14))
                .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, lineWidth: 1))
                
                SecureField("Password", text: $password)
                    .font(.system(size: 14))
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, lineWidth: 1))
            }
            .padding(.vertical, 64)
            
            Button(action: signIn){
                Text("Sign in")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                //.background(LinearGradient(gradient: <#T##Gradient#>, startPoint: <#T##UnitPoint#>, endPoint: <#T##UnitPoint#>))
            }
        }
    }
}

struct AuthView: View {
    var body: some View {
        NavigationView {
            SignInView()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(SessionStore())
    }
}
