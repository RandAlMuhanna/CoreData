//
//  ContentView.swift
//  MyList
//
//  Created by Rand AlMuhanna on 20/05/1444 AH.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject private var taskListVM = TaskListViewModel()
        

        
        var body: some View {
            VStack {
                HStack {
                    TextField("Enter task name", text: $taskListVM.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Save") {
                        taskListVM.save()
                        taskListVM.getAllTasks()
                    }
                }
                
                List(taskListVM.tasks , id: \.id) { task in
                    Text(task.title)
                }
                
                Spacer()
            }.padding()
            .onAppear(perform: {
                taskListVM.getAllTasks()
            })
            
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
