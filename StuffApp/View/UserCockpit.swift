//
//  UserCockpit.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 19/01/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI

struct UserCockpit: View {
    @State var multipleIsPresented = true
    
    var rkManager1 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 3)
       
    
    var body: some View {
        
            RKViewController(isPresented: self.$multipleIsPresented, rkManager: self.rkManager1)
            
        }
}

struct UserCockpit_Previews: PreviewProvider {
    static var previews: some View {
        UserCockpit()
    }
}
