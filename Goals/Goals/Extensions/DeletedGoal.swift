//
//  DeletedGoal.swift
//  Goals
//
//  Created by Alexandre NYS on 20/03/2021.
//

import Foundation

// Deleting the goals that are no more needed
class DeletedGoal{
    
    var goalDescription : String
    private (set) public var goalType:GoalType
    private (set) public var goalComplete:Int32
    private (set) public var goalProgress:Int32
     
     init(inpGoalDiscription:String, inpGoalType:GoalType, inpGoalComlete:Int32,inpGoalProgress:Int32 ) {
         self.goalDescription = inpGoalDiscription
         self.goalType = inpGoalType
         self.goalComplete = inpGoalComlete
         self.goalProgress = inpGoalProgress
     }
 }
