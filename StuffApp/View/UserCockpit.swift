//
//  UserCockpit.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 24/01/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI

struct UserCockpit: View {
    
    @State var multipleIsPresented = false
    
    var rkManager3 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 3)
    var rkManager4 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0)
    
    var body: some View {
        VStack {
            Button(action: { self.multipleIsPresented.toggle() }) {
                Text("Example 3 - Multiple Dates Selection ").foregroundColor(.blue)
            }
            .sheet(isPresented: self.$multipleIsPresented, content: {
                RKViewController(isPresented: self.$multipleIsPresented, rkManager: self.rkManager3)})
            datesView(dates: self.rkManager3.selectedDates)
            
        }.onAppear(perform: startUp)
            .navigationViewStyle(StackNavigationViewStyle())
    }
    func datesView(dates: [Date]) -> some View {
        ScrollView (.horizontal) {
            HStack {
                ForEach(dates, id: \.self) { date in
                    Text(self.getTextFromDate(date: date))
                }
            }
        }.padding(.horizontal, 15)
        
    }
    
    func startUp() {
        
        // example of pre-setting selected dates
        let testOnDates = [Date().addingTimeInterval(60*60*24), Date().addingTimeInterval(60*60*24*2)]
        rkManager3.selectedDates.append(contentsOf: testOnDates)
        
        // example of some foreground colors
        rkManager3.colors.weekdayHeaderColor = Color.blue
        rkManager3.colors.monthHeaderColor = Color.green
        rkManager3.colors.textColor = Color.blue
        rkManager3.colors.disabledColor = Color.red
        
        // example of pre-setting disabled dates
        let testOffDates = [
            Date().addingTimeInterval(60*60*24*4),
            Date().addingTimeInterval(60*60*24*5),
            Date().addingTimeInterval(60*60*24*7)]
        rkManager4.disabledDates.append(contentsOf: testOffDates)
    }
    
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        return date == nil ? "" : formatter.string(from: date)
    }
}

struct UserCockpit_Previews: PreviewProvider {
    static var previews: some View {
        UserCockpit()
    }
}
