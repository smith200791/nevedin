//
//  SecondViewController.swift
//  NevedinTaskManager
//
//  Created by Андрей Неведин on 14.06.14.
//  Copyright (c) 2014 edu.self. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!
    
    //Events
    //я дбавил кнопку на вью
    //как обработать эвент от этой кнопки
    //объявить экшн и связать с контролом - кнопкой
    @IBAction func Button_Click(sender: UIButton){
        if !txtTask.text.isEmpty && !txtDesc.text.isEmpty{
            taskMGR.addTask(txtTask.text,  description: txtDesc.text)
            self.view.endEditing(true)
            txtTask.text = ""
            txtDesc.text = ""
            self.tabBarController.selectedIndex = 0
        } else{
            showValidationMessage()
        }
        
        
    }
    
    // Show an alert with an "Okay" button.
    func showValidationMessage() {
        let title = NSLocalizedString("Пожалуйста, заполните все поля", comment: "")
        let message = NSLocalizedString("Поле имя и описания обязательны для заполнения", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Create the action.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
            NSLog("The validation alert's cancel action occured.")
        }
        
        // Add the action.
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!){
        self.view.endEditing(true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITextField Delegate
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
}

