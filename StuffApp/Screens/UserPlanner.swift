//
//  UserPlanner.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 09/02/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI



struct UserPlanner: View {
    
    @State private var selectedDates: [TicketDate] = []
    @State private var date: TicketDate = TicketDate.default
    @State private var hour: String = ""
    @State private var showPopup = false
    @State private var showBasket: Bool = false
    
    
    var body: some View {
        VStack {
            
            //UserCalendarView()
            
            DateTimeView(date: self.$date, hour: self.$hour)
          
            SendRequestButtonView(text: "Send", action: {self.showBasket = self.validateInputs()
                withAnimation {
                    self.showPopup = !self.validateInputs()
                }
            }).padding()
        }
        .blur(radius: self.showPopup ? 10 : 0).overlay(
            VStack{
                if self.showPopup {
                    self.createPopupContent()
                } else {
                    EmptyView()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background( self.showPopup ? Color.white.opacity(0.3) : .clear)
        )
    }
    
    fileprivate func createPopupContent() -> some View{
        VStack {
            Text("Not allowed").font(.system(size: 20, weight: Font.Weight.semibold))
            Text("You need to select at least one date and hour in order to continue.")
                .multilineTextAlignment(.center).frame(maxHeight:.infinity)
            SendRequestButtonView(text: "Let's do that"){
                withAnimation {
                    self.showPopup.toggle()
                }
            }
            
        }.frame(width: UIScreen.main.bounds.width * 0.8, height: 200, alignment: .bottom)
        .padding()
            .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.green.opacity(0.3), radius: 20, x: 0, y: 10)
        .transition(.move(edge: .bottom))
    }
    fileprivate func validateInputs() -> Bool {
        self.selectedDates.count > 0
        && self.date != TicketDate.default
        && !self.hour.isEmpty
    }
}

struct UserPlanner_Previews: PreviewProvider {
    static var previews: some View {
        UserPlanner()
    }
}
