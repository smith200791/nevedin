//
//  FirstViewController.swift
//  NevedinTaskManager
//
//  Created by Андрей Неведин on 14.06.14.
//  Copyright (c) 2014 edu.self. All rights reserved.
//

import UIKit


//контроллер - класс делегат, реализует логику событий, происходящих на представлении
//реализует 2 протокола
//UITableViewDataSource - протокол отвечающий за доступ к данным нашего tableView
//UITableViewDelegate - протокол отвечающий за реализацию методов оповещания о событиях
// а так же является наследником класса UIViewController
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // что за аутет?
    //когда я создал контрол на вьюшке
    //как понять что это за объект в классе контроллере?
    //очень просто. создаем аутлет называем как душе угодно и определяем тип
    // далее просто этот объект связываем с контролом на вьюшке, все - обращайся из кода
    @IBOutlet var tblTasks: UITableView!
    
    
    //в чем прикол
    //мы создали UI объект TableView
    //когда мы нажимаем по строке данного tableView откуда эта tableView может знать
    //что делать после этого нажатия? заложены ли эти действия в класс UITableView?
    //ДА КОНЕЧНО ЖЕ НЕТ! так как реализация этих действий будет менятся от
    //приложения к приложению, наша tableView передает ответсвенность за эти действия
    //делегированному объекту. Какому объекту, в данном случае нашему контроллеру который
    //реализует интерфейс UITableViewDelegate, и если мы хотим реализовать логику
    //реакции на это действие, то мы просто реализуем в нашем контроллере класс интерфейса
    //отвечающего за это действие
    
    //откуда наша tableView получит данные что бы заполнится? знает ли она где и как
    //их брать заранее? КОНЕЧНО НЕТ!!!
    //она просто делегирует эту обязанность классу делегату, какому?
    //да нашему контроллеру, который сказал что реализует интерфейс UITableViewDataSource
    //а это значит он должен реализовать методы которые заполняют эту tableView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //обязательный метод, необходмый для реализации в наследнике класса UIViewController
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //обязательный метод, необходмый для реализации в наследнике класса UIViewController
        // Dispose of any resources that can be recreated.
    }
    
    
    //реализация обязательного метода у протокола UITableViewDataSource
    //данный метод запрашивает небходимые данные для релизации таблицы представления
    //так как данный класс является контроллером, реализующий паттерн MVC посредством делегирования, то
    //данный класс так же являтся делегатом (реализация протокола)
    //а данный является обязательным при реализации протокола
    // метод запрашивает колличество строк в tableView у модели (MVC), это необходимо для
    //корректного отображения на View (MVC)
    //т.е. данный метод является наглядным примером реализации контроллера в SWIFT
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        return taskMGR.tasks.count
    }
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            taskMGR.deleteTaskByIndex();
            
            let cell:  UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
            
            cell.text = ""
            cell.detailTextLabel.text = ""            
        }
    }
    
    //данный метод является обязаетльным при релазации контроллера tableView, а именно
    //реализации интерфейса UITableViewDataSource
    //он запрашивает значения текущих ячеек у дата модели
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        let cell:  UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        
        cell.text = taskMGR.tasks[indexPath.row].name
        cell.detailTextLabel.text = taskMGR.tasks[indexPath.row].desc
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool){
        tblTasks.reloadData()
    }
    
}

