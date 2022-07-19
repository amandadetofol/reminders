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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewController()
    }
    
    func configure(with reminder: Reminder){
        viewToView.configure(with: reminder)
    }
    
    private func setupViewController(){
        viewToView.delegate = self
        self.view = viewToView
    }
    
}

extension NewReminderViewController: DetailViewProtocol {
    func didSelectPickerRow(row: String) {
        print(row)
    }
    
    func didPressSaveChangeButton() {
        print("should save new item in database")
    }
}
