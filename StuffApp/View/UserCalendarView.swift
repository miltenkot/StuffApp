//
//  UserCalendar.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 03/02/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI

struct UserCalendarView: View {
    
    @State private var multipleIsPresented = false
    
    
    var rkManager3 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 3)
    
    var body: some View {
        NavigationView{
            VStack(){
                RKViewController(isPresented: self.$multipleIsPresented, rkManager: self.rkManager3)
                
            }.padding()
        }
        
    }
    
    func startUp() {
        
        rkManager3.colors.weekdayHeaderColor = Color.blue
        rkManager3.colors.monthHeaderColor = Color.green
        rkManager3.colors.textColor = Color.blue
        rkManager3.colors.disabledColor = Color.red
        
    }
}

struct UserCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        UserCalendarView()
    }
}
