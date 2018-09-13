//
//  Extensions.swift
//  Codata
//
//  Created by Matthieu PASSEREL on 04/08/2018.
//  Copyright © 2018 Matthieu PASSEREL. All rights reserved.
//

import Foundation


extension Date {
    
    func toString() -> String {
        let formatter = DateFormatter()
        let calendar = Calendar.current
        
        if calendar.isDateInToday(self) {
            formatter.timeStyle = .short
            formatter.dateStyle = .none
        } else {
            formatter.dateStyle = .medium
            formatter.timeStyle = .none

        }
        
        return formatter.string(from: self)
    }
    
}
