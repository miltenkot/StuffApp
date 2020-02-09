//
//  SendRequestButtonView.swift
//  StuffApp
//
//  Created by Bartek Lanczyk on 09/02/2020.
//  Copyright © 2020 Bartek Lanczyk. All rights reserved.
//

import SwiftUI

struct SendRequestButtonView: View {
    var text = "Send"
    var action = {}
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                Text(text)
                    .font(.system(size: 20, weight: Font.Weight.semibold))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical)
                    .accentColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }.padding(.vertical)
    }
}

struct SendRequestButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SendRequestButtonView()
    }
}
