//
//  TodoList.swift
//  ToDoListTest3
//
//  Created by 羅承志 on 2022/1/13.
//

import Foundation

// 設計一個機器
// 設計 API
// 綁定 binding

class TodoList {
    
    init() {
        loadData()
    }
    
    
    // MARK: - Properties
    private let userDefault = UserDefaults.standard
    private let userDefaultKey = "key"
    
    var strings: [String] = [] {
        didSet {
            valueChanged?()
            saveData()
        }
    }
    
    
    //MARK: - Closure
    var valueChanged: (() -> Void)?
    
    
    //MARK: - Function
    var numberOfStrings: Int {
        return strings.count
    }
    
    func getString(indexPath: IndexPath) -> String {
        return strings[indexPath.row]
    }
    
    func add(string: String) {
        strings.append(string)
    }
    
    func move(sourceIndex: Int, destinationIndex: Int) {
        let remove = strings.remove(at: sourceIndex)
        strings.insert(remove, at: destinationIndex)
    }
    
    func remove(index: Int) {
        strings.remove(at: index)
    }
    
//    func remove(string: String) {
//        if let index = strings.firstIndex(of: string) {
//            strings.remove(at: index)
//        }
//    }
    
    private func saveData() {
        userDefault.setValue(strings, forKey: userDefaultKey)
    }
    
    private func loadData() {
        strings = userDefault.stringArray(forKey: userDefaultKey) ?? []
    }
}
