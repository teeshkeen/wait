//
//  AddImpulseViewController.swift
//  wait
//
//  Created by tee on 29.08.2026.
//

import Foundation
import CoreData
import UIKit

final class AddImpulseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    private let manager = CoreDataManager.shared
    
    private let gradePickerValues = ImpulseTimes.allCases
    private var selectedGrade: ImpulseTimes? = .day
    
    private lazy var labelTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter your impulse"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var datePicker: UIPickerView = {
        let datePicker = UIPickerView()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .contactAdd, primaryAction: UIAction { [weak self] _ in
            self?.addNewImpulse()
        })
            
        button.titleLabel?.text = "Add"
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "add new idea"
        
        view.addSubview(labelTextField)
        view.addSubview(datePicker)
        view.addSubview(addButton)
        
        datePicker.delegate = self
        datePicker.dataSource = self

        NSLayoutConstraint.activate([
            
            labelTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            datePicker.topAnchor.constraint(equalTo: labelTextField.topAnchor, constant: 20),
            datePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            datePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
        ])
    }
    
    private func addNewImpulse() {
        guard let text = labelTextField.text else { return }
        guard let time = selectedGrade else { return }
        if let date = time.date() {
            manager.addNewImpulse(with: text, at: date)
        }
        
        print("good saved \(manager.impulses.count)")
        navigationController?.popViewController(animated: true)
    }
    
}

extension AddImpulseViewController {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gradePickerValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gradePickerValues[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGrade = gradePickerValues[row]
    }
}
