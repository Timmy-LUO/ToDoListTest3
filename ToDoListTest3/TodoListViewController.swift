//
//  TodoListViewController.swift
//  ToDoListTest3
//
//  Created by 羅承志 on 2022/1/13.
//

import UIKit

// Coordinator
// Router
class TodoListViewController: UIViewController {
    
    // MARK: - Properties
    private let todoList = TodoList()   //let todoList: TodoList = .init()
    
    
    // MARK: - UI
    private let rootView = TodoListView()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        rootView.toDoListTableView.delegate = self
        rootView.toDoListTableView.dataSource = self
        rootView.addToDoButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        todoList.valueChanged = {
            //print("todolist string changed!!")
            self.rootView.toDoListTableView.reloadData()
        }
    }
    
    // MARK: - Action
    @objc private func addButtonAction() {
        guard let text = rootView.myTextField.text, text != "" else {
            okAlert(title: "Warning", message: "No text!!")
            return
        }
        todoList.add(string: text)
        rootView.toDoListTableView.scrollToRow(at: [0, todoList.strings.count - 1],
                                               at: .bottom, animated: true)
        rootView.myTextField.text = ""
        self.view.endEditing(true)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        rootView.toDoListTableView.setEditing(editing, animated: true)
    }

    // MARK: Setup
    private func setupNavigation() {
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.title = "代辦事項"
    }
}


//MARK: - UITableViewDataSource
extension TodoListViewController: UITableViewDataSource {
    //section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.numberOfStrings
    }
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let string = todoList.getString(indexPath: indexPath)
        cell.textLabel?.text = string
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TodoListViewController: UITableViewDelegate {
    //move indexPath.row
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        todoList.move(sourceIndex: sourceIndexPath.row,
                      destinationIndex: destinationIndexPath.row)
    }
    
    //remove indexPath.row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        switch editingStyle {
        case .delete:
            todoList.remove(index: indexPath.row)
        default:
            break
        }
    }
}
