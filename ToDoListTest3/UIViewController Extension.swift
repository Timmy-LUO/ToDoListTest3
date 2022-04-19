//
//  UIViewController Extension.swift
//  ToDoListTest3
//
//  Created by 羅承志 on 2022/1/13.
//

import UIKit

extension UIViewController {
    
    func okAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension UIColor {
    static var textFieldBackgroundColor: UIColor = UIColor(red: 0/255, green: 87/255, blue: 87/255, alpha: 1)
    
//    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) {
//        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
//    }
}
