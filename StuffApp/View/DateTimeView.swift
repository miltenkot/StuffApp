//
//  SessionView.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 14/01/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI

struct DateTimeView: View {
    
    @State private var activeIdx: Double = 0
    
       
    @State private var selectedDate: TicketDate = TicketDate.default
    @State private var selectedHourndex: Int = -1
    private let dates = Date.getFollowingThirtyDays()
    
    @Binding var date: TicketDate
    @Binding var hour: String
    
    //Calendar
    @State private var multipleIsPresented = false
    
    
    var rkManager3 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 3)
    
    var body: some View {
        VStack {
            NavigationView{
                      VStack(){
                          RKViewController(isPresented: self.$multipleIsPresented, rkManager: self.rkManager3)
                          
                      }.padding()
                  }
            VStack(alignment: .leading, spacing: 30) {
                createDateView()
                createTimeView()
            }
            
        }
    }
    
    fileprivate func createDateView() -> some View{
        VStack(alignment: .leading) {
            Text("Date")
                .font(.headline).padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(self.dates.indices){ index in
                        DateView(date: self.dates[index], isSelected: self.selectedDate.day == self.dates[index].day, onSelect: { selectedDate in
                            self.selectedDate = selectedDate
                            self.date = selectedDate
                            self.activeIdx = 8
                            self.rkManager3.selectedDates.append(Date().addingTimeInterval(60*60*24*Double(index)))
                            
                            
                        })
                    }
                }.padding(.horizontal)
            }
        }
    }
    
    fileprivate func createTimeView() -> some View {
        
        VStack(alignment: .leading) {
            Text("Time").font(.headline).padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(0..<24, id: \.self){ i in
                        TimeView(index: i, isSelected: self.selectedHourndex == i, onSelect: { selectedIndex in
                            self.selectedHourndex = selectedIndex
                            self.hour = "\(selectedIndex):00"
                        })
                    }
                }.padding(.horizontal)
            }
        }
    }
    
    //Calendar settings
    
    func startUp() {
        
        rkManager3.colors.weekdayHeaderColor = Color.blue
        rkManager3.colors.monthHeaderColor = Color.green
        rkManager3.colors.textColor = Color.blue
        rkManager3.colors.disabledColor = Color.red
        
    }
}

struct DateTimeView_Previews: PreviewProvider {
    static var previews: some View {
        DateTimeView(date: .constant(TicketDate.default), hour: .constant(""))
    }
}
