//
//  AddGoalViewController.swift
//  GoalPost
//
//  Created by madhav sharma on 7/3/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit

class AddGoalViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    var goal: Goal? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "error", message: "please enter your goal", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action  in
            print("tapped Dismiss")
        }))
        present(alert,animated: true)
    }
    
    private func setupView(){
        overrideUserInterfaceStyle = .dark
        nextBtn.bindToKeyboard()
        shortTermBtn.layer.cornerRadius = 5.0
        longTermBtn.layer.cornerRadius = 5.0
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        goalTextView.delegate = self
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        goalTextView.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        goalTextView.resignFirstResponder()
    }

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your Goal?" {
            if (goal != nil){
                guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
                do{
                    goal?.goalDescription = goalTextView.text
                    try managedContext.save()
                    print("Successfully changed")
                    guard let GoalsViewController = storyboard?.instantiateViewController(withIdentifier: "GoalsViewController")
                        else {
                            return
                    }
                    //to switch default annoying card-view to fullscreen-view
                    //using a segue programmatically
                    GoalsViewController.modalPresentationStyle = .fullScreen
                    presentDetail(GoalsViewController)
                } catch{
                    debugPrint("Couldn't change: \(error.localizedDescription)")
                }
            } else {
                guard let createGoalViewController = storyboard?.instantiateViewController(identifier: "CreateGoalViewController") as? CreateGoalViewController
                    else {
          
                        return
                }
                createGoalViewController.initData(description: goalTextView.text!, type: goalType)
                createGoalViewController.modalPresentationStyle = .fullScreen
                //dismiss this viewController and present a new one at the same time
                presentingViewController?.presentSecondaryDetail(createGoalViewController)
            }
        
        } else {
          showAlert()
        }
    

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        if (goal != nil ){
            goalTextView.text = goal!.goalDescription
        } else {
            goalTextView.text = ""
        }
    }
}
