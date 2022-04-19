//
//  TodoListView.swift
//  ToDoListTest3
//
//  Created by 羅承志 on 2022/1/13.
//

import UIKit

class TodoListView: UIView {
    
    // MARK: UI
    let toDoListTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let myTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .textFieldBackgroundColor
        textField.font = .boldSystemFont(ofSize: 25)
        textField.placeholder = "新增事項"
        textField.leftViewMode = .always
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let addToDoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("＋", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        backgroundColor = .black
        addSubview(toDoListTableView)
        addSubview(myTextField)
        addSubview(addToDoButton)
        
        NSLayoutConstraint.activate([
            toDoListTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            toDoListTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            toDoListTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            toDoListTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            
            myTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            myTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            myTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            
            addToDoButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addToDoButton.leadingAnchor.constraint(equalTo: myTextField.trailingAnchor, constant: 10),
            addToDoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
