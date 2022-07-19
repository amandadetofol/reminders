//
//  Reminder.swift
//  Reminders
//
//  Created by Amanda Detofol on 15/07/22.
//

import Foundation

enum Priority {
    case high
    case medium
    case low
    
    var string: String {
        switch self {
        case .high:
            return "High"
        case .medium:
            return "Medium"
        case .low:
            return "Low"
        }
    }
}

struct Reminder {
    let title: String
    let description: String
    let priority: Priority
    let dateToShow: String
    let date: Date
}
