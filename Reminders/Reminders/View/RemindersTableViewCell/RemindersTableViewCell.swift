//
//  RemindersTableViewCell.swift
//  Reminders
//
//  Created by Amanda Detofol on 15/07/22.
//

import UIKit

class RemindersTableViewCell: UITableViewCell {

    //MARK: View Elements
    private let priorityImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 15
        image.backgroundColor = .red
        return image
    }()
    
    private let reminderTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private let reminderDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false 
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private let reminderDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    public let cellReusableIdentifier = "RemindersTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureCell(reminder: Reminder){
        self.reminderTitleLabel.text = reminder.title
        self.reminderDescriptionLabel.text = reminder.description
        self.reminderDateLabel.text = reminder.dateToShow
    }
    
    //MARK: Private methods
    private func setupView() {
        self.addSubview(priorityImage)
        self.addSubview(reminderTitleLabel)
        self.addSubview(reminderDescriptionLabel)
        self.addSubview(reminderDateLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.priorityImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.priorityImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.priorityImage.heightAnchor.constraint(equalToConstant: 30),
            self.priorityImage.widthAnchor.constraint(equalToConstant: 30),
            self.priorityImage.trailingAnchor.constraint(equalTo: self.reminderTitleLabel.leadingAnchor, constant: -16),
            
            self.reminderTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.reminderTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            self.reminderDescriptionLabel.topAnchor.constraint(equalTo: self.reminderTitleLabel.bottomAnchor, constant: 8),
            self.reminderDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.reminderDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            self.reminderDateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            self.reminderDateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        ])
    }
    
}
