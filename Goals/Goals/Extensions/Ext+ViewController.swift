//
//  File.swift
//  Goals
//
//  Created by Alexandre NYS on 20/03/2021.
//
import UIKit

extension UIViewController{
    
    func  presentVeiwController (_ uiViewController: UIViewController){
        let transtion = CATransition()
        transtion.duration = 0.4
        transtion.type = .reveal
        transtion.subtype = .fromRight
        self.view.window?.layer.add(transtion, forKey: kCATransition)
        present(uiViewController, animated: false, completion: nil)
    }
    
    func presentSecondView(_ uiViewControllerToPresented:UIViewController){
        let transtion = CATransition()
        transtion.duration = 0.44
        transtion.type = .fade
        transtion.subtype = .fromRight
        
        guard let presentedViewController = presentedViewController else {return}
        
        presentedViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transtion, forKey: kCATransition)
            self.present(uiViewControllerToPresented, animated: false, completion: nil)
        }
        
    }
    
    func dismissViewController(_ uiViewController: UIViewController){
        let transtion = CATransition()
        transtion.duration = 0.4
        transtion.type = .reveal
        transtion.subtype = .fromLeft
        self.view.window?.layer.add(transtion, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
}
