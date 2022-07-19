//
//  Date+Extension.swift
//  Reminders
//
//  Created by Amanda Detofol on 19/07/22.
//

import Foundation

extension Date {
    
    func parseToFormattedString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
}
