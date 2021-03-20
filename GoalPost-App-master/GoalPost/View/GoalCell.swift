//
//  GoalCell.swift
//  GoalPost
//
//  GoalPost
//
//  Created by Alexandre NYS on 20/03/2021.
//
import UIKit

class GoalCell: UITableViewCell {
    
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    
    @IBOutlet weak var goalTypeLabel: UILabel!
    
    @IBOutlet weak var goalProgressLabel: UILabel!
    
    @IBOutlet weak var completionView: UIView!
    
    func configureCell(goal: Goal) {
        self.goalDescriptionLabel.text = goal.goalDescription
        self.goalTypeLabel.text = goal.goalType
        self.goalProgressLabel.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden = true
        }
    }
}
