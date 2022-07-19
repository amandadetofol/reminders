//
//  DetailViewController.swift
//  Reminders
//
//  Created by Amanda Detofol on 15/07/22.
//

import UIKit

class DetailViewController: UIViewController {
    
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

extension DetailViewController: DetailViewProtocol {
    func didSelectPickerRow(row: String) {
        print("selected row")
    }
    
    func didPressSaveChangeButton() {
        print("should update reminder in database")
    }
}
