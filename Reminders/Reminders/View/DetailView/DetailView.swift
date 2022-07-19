//
//  DetailView.swift
//  Reminders
//
//  Created by Amanda Detofol on 15/07/22.
//

import UIKit

protocol DetailViewProtocol {
    func didPressSaveChangeButton()
}

class DetailView: UIView {
    
    // MARK: View Elements
    private let reminderTitleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Title"
        return textField
    }()
    
    private let reminderDescriptionTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Description"
        return textField
    }()
    
    private let reminderDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private lazy var priorityPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    private lazy var saveChangesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save Changes", for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.titleLabel?.textColor = .black
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(didPressSaveChangeButton), for: .touchUpInside)
        return button
    }()
    
    var reminderTitle: String? {
        return self.reminderTitleTextField.text
    }
    
    var reminderDescriptionTitle: String? {
        return self.reminderDescriptionTextField.text
    }
    
    var date: Date? {
        return self.reminderDatePicker.date
    }
    
    var reminderPriority: String? = ""
    
    
    private let dataArray = ["High", "Medium", "Low"]
    var delegate: DetailViewProtocol?
    
    init(){
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with reminder: Reminder){
        self.reminderTitleTextField.text = reminder.title
        self.reminderDescriptionTextField.text = reminder.description
        self.reminderDatePicker.date = reminder.date
    }
    
    //MARK: Private methods
    private func setupView(){
        self.addSubview(reminderTitleTextField)
        self.addSubview(reminderDescriptionTextField)
        self.addSubview(reminderDatePicker)
        self.addSubview(priorityPicker)
        self.addSubview(saveChangesButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.reminderTitleTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 128),
            self.reminderTitleTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.reminderTitleTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.reminderTitleTextField.heightAnchor.constraint(equalToConstant: 48),
            
            self.reminderDescriptionTextField.topAnchor.constraint(equalTo: self.reminderTitleTextField.bottomAnchor, constant: 16),
            self.reminderDescriptionTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.reminderDescriptionTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.reminderDescriptionTextField.heightAnchor.constraint(equalToConstant: 48),
            
            self.reminderDatePicker.topAnchor.constraint(equalTo: self.reminderDescriptionTextField.bottomAnchor, constant: 16),

            self.reminderDatePicker.heightAnchor.constraint(equalToConstant: 48),
            self.reminderDatePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.priorityPicker.topAnchor.constraint(equalTo: self.reminderDatePicker.bottomAnchor, constant: 16),
            self.priorityPicker.heightAnchor.constraint(equalToConstant: 128),
            self.priorityPicker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.saveChangesButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.saveChangesButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.saveChangesButton.heightAnchor.constraint(equalToConstant: 48),
            self.saveChangesButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            
        ])
    }
    
}

extension DetailView {
    
    @objc func didPressSaveChangeButton(){
        delegate?.didPressSaveChangeButton()
    }
    
}

extension DetailView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = dataArray[row]
        return row
     }
}

extension DetailView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedRow = dataArray[row]
        self.reminderPriority = selectedRow
    }
    
}
