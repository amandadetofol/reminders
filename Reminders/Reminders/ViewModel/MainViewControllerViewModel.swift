//
//  MainViewControllerViewModel.swift
//  Reminders
//
//  Created by Amanda Detofol on 15/07/22.
//

import Foundation

class MainViewControllerViewModel {
    
    private let coreDataManager = CoreDataManager()
    
    var reminders: [Reminder] {
        return coreDataManager.getItemsFromDatabase()
    }
    
}
