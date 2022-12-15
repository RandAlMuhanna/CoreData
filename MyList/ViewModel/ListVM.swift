//
//  MyListVM.swift
//  MyList
//
//  Created by Rand AlMuhanna on 20/05/1444 AH.
//

import Foundation
import CoreData

class TaskListViewModel: ObservableObject {
    
    var title: String = ""
    @Published var tasks: [TaskViewModel] = []
    
    func getAllTasks() {
        tasks = CDManager.shared.getAllTasks().map(TaskViewModel.init)
    }
    
    
    func save() {
        
        let task = Task(context: CDManager.shared.viewContext)
        task.title = title
        
        CDManager.shared.save()
    }
    
}

struct TaskViewModel {
    
    let task: Task
    
    var id: NSManagedObjectID {
        return task.objectID
    }
    
    var title: String {
        return task.title ?? ""
    }
    
}
