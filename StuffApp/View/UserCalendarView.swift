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
    
    
    private var rkManager3 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 3)
    
    var body: some View {
        NavigationView{
            VStack(){
                RKViewController(isPresented: self.$multipleIsPresented, rkManager: self.rkManager3)
                
            }.padding()
        }
        
    }
    
//    func datesView(dates: [Date]) -> some View {
//        ScrollView (.horizontal) {
//            HStack {
//                ForEach(dates, id: \.self) { date in
//                    Text(self.getTextFromDate(date: date))
//                }
//            }
//        }.padding(.horizontal, 15)
//
//    }
    
    func startUp() {
        
        rkManager3.colors.weekdayHeaderColor = Color.blue
        rkManager3.colors.monthHeaderColor = Color.green
        rkManager3.colors.textColor = Color.blue
        rkManager3.colors.disabledColor = Color.red
        
    }
    
//    func getTextFromDate(date: Date!) -> String {
//        let formatter = DateFormatter()
//        formatter.locale = .current
//        formatter.dateFormat = "EEEE, MMMM d, yyyy"
//        return date == nil ? "" : formatter.string(from: date)
//    }
}

struct UserCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        UserCalendarView()
    }
}
