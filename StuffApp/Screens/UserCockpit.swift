//
//  UserCockpit.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 24/01/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI

struct UserCockpit: View {
    
      @State private var showCalendar: Bool = false
    
    var body: some View {
        NavigationView{
            VStack(){
                PortretImage()
                    .offset(y: -130)
                    .padding(.bottom, -130)
                createShowPlannerViewButton()
                
            }.padding()
            
            
        }
    }
    
    fileprivate func createShowPlannerViewButton() -> some View {
        return SendRequestButtonView(text: "Wnioski"){
            self.showCalendar.toggle()
        }.sheet(isPresented: self.$showCalendar) {
            UserPlanner()
        }.padding(.vertical)
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
