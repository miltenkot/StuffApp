//
//  UserCockpit.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 24/01/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI

struct UserCockpit: View {
    
    var body: some View {
        NavigationView{
            VStack(){
                PortretImage()
                    .offset(y: -130)
                    .padding(.bottom, -130)
                NavigationLink(destination: UserCalendar()){
                    Text("Wnioski")
                    
                }
                
            }.padding()
            
            
        }
    }
}

struct UserCockpit_Previews: PreviewProvider {
    static var previews: some View {
        UserCockpit()
    }
}



struct PortretImage: View {
    var body: some View {
        Image("portret")
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}
