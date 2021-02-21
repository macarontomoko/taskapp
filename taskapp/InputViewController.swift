//
//  InputViewController.swift
//  taskapp
//
//  Created by 黒田智子 on 2021/02/17.
//

import UIKit
import RealmSwift    // 追加する

class InputViewController: UIViewController {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentsTextView: UITextView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var categoryTextField: UITextField!
    
    
    let realm = try! Realm()
    
       var task: Task!

       override func viewDidLoad() {
           super.viewDidLoad()

           // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
           let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
           self.view.addGestureRecognizer(tapGesture)

           titleTextField.text = task.title
           contentsTextView.text = task.contents
           datePicker.date = task.date
        
        // 以下、 自分で追加
        categoryTextField.text = task.category
        
        //以上、自分で追加
       }

       override func viewWillDisappear(_ animated: Bool) {
           try! realm.write {
               self.task.title = self.titleTextField.text!
               self.task.contents = self.contentsTextView.text
               self.task.date = self.datePicker.date
            
            // 以下、自分で追加
            self.task.category = self.categoryTextField.text!
            //以上、自分で追加
            
               self.realm.add(self.task, update: .modified)
            
           }

           super.viewWillDisappear(animated)
       }

       @objc func dismissKeyboard(){
           // キーボードを閉じる
           view.endEditing(true)
       }
   }



