//
//  ViewController.swift
//  Reminders
//
//  Created by Amanda Detofol on 13/07/22.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var remindersTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RemindersTableViewCell.self, forCellReuseIdentifier: "CellReusableIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private var viewModel: MainViewControllerViewModel = MainViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraint()
    }
    
    private func setupRightBarButtonItem(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(handleRightBarButtonItemClick))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.title = "Reminders"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupView(){
        self.view.backgroundColor = .white
        self.view.addSubview(remindersTableView)
        self.setupRightBarButtonItem()
    }

    private func setupConstraint(){
        NSLayoutConstraint.activate([
            remindersTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            remindersTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            remindersTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            remindersTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.reminders.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellReusableIdentifier") as! RemindersTableViewCell
        cell.configureCell(reminder: viewModel.reminders[indexPath.row])
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailView = DetailViewController()
        detailView.configure(with: viewModel.reminders[indexPath.row])
        self.present(detailView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("should remove item and update tableviewdatasource")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

extension MainViewController {
    
    @objc func handleRightBarButtonItemClick(){
       let newReminderViewController = NewReminderViewController()
       self.navigationController?.pushViewController(newReminderViewController, animated: true)
    }
}

