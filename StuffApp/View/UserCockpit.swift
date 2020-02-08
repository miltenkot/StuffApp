//
//  UserCockpit.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 24/01/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI

struct UserCockpit: View {
    
    @State var flag = true
    
    var body: some View {
        NavigationView{
            VStack(){
                Image("portret")
                    .imageScale(.medium)
                    .cornerRadius(150)
                HStack {
                    NavigationLink(destination: UserCalendar()){
                        Text("Wnioski")
                    }
                    
                }
            }
            
            
        }
    }
}

struct UserCockpit_Previews: PreviewProvider {
    static var previews: some View {
        UserCockpit()
    }
}


