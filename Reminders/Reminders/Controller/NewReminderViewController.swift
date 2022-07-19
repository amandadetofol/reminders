//
//  NewReminderViewController.swift
//  Reminders
//
//  Created by Amanda Detofol on 18/07/22.
//

import Foundation

import UIKit

class NewReminderViewController: UIViewController {
    
    private var viewToView: DetailView = DetailView()
    private let coreDataManger = CoreDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewController()
    }
    
    func configure(with reminder: Reminder){
        viewToView.configure(with: reminder)
    }
    
    func selectPriority(basedOn string: String) -> Priority {
        switch string.lowercased() {
        case "high":
            return .high
        case "medium":
            return .medium
        case "low":
            return .low
        default:
            return .low
        }
    }
    
    private func setupViewController(){
        viewToView.delegate = self
        self.view = viewToView
    }
    
    
}

extension NewReminderViewController: DetailViewProtocol {

    func didPressSaveChangeButton() {
        guard let title = viewToView.reminderTitle,
              let description = viewToView.reminderDescriptionTitle,
              let priorityString = viewToView.reminderPriority,
              let date = viewToView.date else {
            return
        }
        
        let newReminder = Reminder(title: title,
                                   description: description,
                                   priority: selectPriority(basedOn: priorityString),
                                   dateToShow: date.parseToFormattedString(),
                                   date: date)
        
        self.coreDataManger.addReminderInCoreData(newReminder)
        self.navigationController?.popViewController(animated: true)
    }
}
