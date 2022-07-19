//
//  DetailViewController.swift
//  Reminders
//
//  Created by Amanda Detofol on 15/07/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var viewToView: DetailView = DetailView()
    private let coreDataManger = CoreDataManager()
    private let notificationManager = NotificationCenterManager()
    private var currentReminder: Reminder? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewController()
        self.getCurrentReminder()
    }
    
    func configure(with reminder: Reminder){
        viewToView.configure(with: reminder)
    }
    
    private func selectPriority(basedOn string: String) -> Priority {
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
    
    private func getCurrentReminder() {
        guard let title = viewToView.reminderTitle,
              let description = viewToView.reminderDescriptionTitle,
              let priorityString = viewToView.reminderPriority,
              let date = viewToView.date else {
            return
        }
        
        self.currentReminder = Reminder(title: title,
                                        description: description,
                                        priority: selectPriority(basedOn: priorityString),
                                        dateToShow: date.parseToFormattedString(),
                                        date: date)
    }
    
}

extension DetailViewController: DetailViewProtocol {
    
    func didPressSaveChangeButton() {
        guard let currentReminder = self.currentReminder else { return }
        guard let title = viewToView.reminderTitle,
              let description = viewToView.reminderDescriptionTitle,
              let priorityString = viewToView.reminderPriority,
              let date = viewToView.date else {
            return
        }
        
        let reminder = Reminder(title: title,
                                description: description,
                                priority: selectPriority(basedOn: priorityString),
                                dateToShow: date.parseToFormattedString(),
                                date: date)
        
        self.notificationManager.sendNotification(title: title, description: description, date: date)
        coreDataManger.updateReminderInCoreData(reminder: currentReminder,
                                                newReminder: reminder)
        self.navigationController?.popViewController(animated: true)
    }
}
