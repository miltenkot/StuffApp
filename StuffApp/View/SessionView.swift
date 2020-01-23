//
//  SessionView.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 14/01/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI

struct SessionView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                Text("Welcome back user")
                Button(action: session.signOut){
                    Text("Sign out")
                }
                UserCockpit()
                
            } else {
                AuthView()
            }
            
        }.onAppear(perform: getUser)
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView().environmentObject(SessionStore())
    }
}
