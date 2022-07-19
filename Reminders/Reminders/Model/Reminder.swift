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
}

struct Reminder {
    let title: String
    let description: String
    let priority: Priority
    let dateToShow: String
    let date: Date
}
