//
//  TaskManager.swift
//  NevedinTaskManager
//
//  Created by Андрей Неведин on 14.06.14.
//  Copyright (c) 2014 edu.self. All rights reserved.
//

import UIKit; //FRAMEWORK

//класс датамодель

var taskMGR: TaskManager = TaskManager()

//описывает структуру дата модели
struct task{
// в swift при реализации структуры данных всегда необходима превоначальная инициализация полей структуры
    var name = "Un-named"
    var desc = "Un-described" //description
}

//повединие (методы обработки данной датамодели)
class TaskManager: NSObject {

    
    var tasks = task[]() //инициализация массива структур описанных выше
    // по сути инициализаци дата модели (MVC)
    
    // описание методов работы с дата моделью
    //данный метод описывает способ добавления нового элемента в датамодель
    func addTask (name:String,description:String){
       tasks.append(task(name: name,desc: description))
    }
    
    func deleteTaskByIndex(){
        tasks.removeLast();
    }

    
}



//var addtask : (String,String)=addTask;