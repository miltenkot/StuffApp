//
//  UserPlanner.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 09/02/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI



struct UserPlanner: View {
    
     
    
    @State private var date: TicketDate = TicketDate.default
    @State private var hour: String = ""
    
    var body: some View {
        VStack {
            
            UserCalendarView()
            
            DateTimeView(date: self.$date, hour: self.$hour)
                     SendRequestButtonView(text: "Send", action: {}).padding()
        }
    }
}

struct UserPlanner_Previews: PreviewProvider {
    static var previews: some View {
        UserPlanner()
    }
}
