//
//  TicketDate.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 08/02/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import Foundation

struct TicketDate: Equatable {
    var day: String
    var month: String
    var year: String
    static var `default`: TicketDate { TicketDate(day: "", month: "", year: "") }
    
}
