//
//  DateShape.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 08/02/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI

struct DateShape: Shape {

    var cutRadius: CGFloat = 5
    
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            path.move(to: CGPoint(x: rect.origin.x, y: rect.origin.y ))
            path.addLine(to: CGPoint(x: rect.width, y: rect.origin.y))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - rect.height / 4))
            path.addArc(center: CGPoint(x: rect.width, y: rect.height - rect.height / 4 + cutRadius), radius: cutRadius, startAngle: Angle(degrees: -90) , endAngle: Angle(degrees: 90) , clockwise: true)
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.origin.x, y: rect.height))
            path.addLine(to: CGPoint(x: rect.origin.x, y: rect.height - rect.height / 4 + cutRadius * 2))
            path.addArc(center: CGPoint(x: rect.origin.x, y: rect.height - rect.height / 4 + cutRadius), radius: cutRadius, startAngle: Angle(degrees: 90) , endAngle: Angle(degrees: -90) , clockwise: true)
            path.closeSubpath()
            
        }
    }
}
