//
//  AuthView.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 14/01/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

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
            Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
            
            Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
            
           
            
            TextField("Email", text: $email)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            
            Button(action: signIn){
                Text("LOGIN")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.green)
                .cornerRadius(15.0)
            }
            if (error != "") {
                Text(error)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.blue)
                .padding()
                
            }
            Spacer()
            
            NavigationLink(destination: SignUpView()) {
                HStack {
                    Text("Im a new user.")
                        .font(.system(size:14, weight: .light))
                        .foregroundColor(.primary)
                    
                    Text("Create an account")
                        .font(.system(size: 14 ,weight: .semibold))
                        .foregroundColor(.green)
                    
                }
            }
        }
        .padding(.horizontal, 32)
    }
}

struct SignUpView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signUp() {
        session.signUp(email: email, password: password) { result, error in
            
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
            
            Text("Create Account")
            .font(.largeTitle)
            .fontWeight(.semibold)
            
            Text("Sing up to get started")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.gray)
            
            Image("logo")
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 150, height: 150)
                       .clipped()
                       .cornerRadius(150)
                       .padding(.bottom, 75)
            
            TextField("Username", text: $email)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
         
            Button(action: signUp) {
                Text("Create Account")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.green)
                    .cornerRadius(15.0)
            }
            if (error != "") {
                          Text(error)
                              .font(.system(size: 14, weight: .semibold))
                              .foregroundColor(.blue)
                          .padding()
                          
                      }
            Spacer()
            
        }.padding(.horizontal, 32)
        
        
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
