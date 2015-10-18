//
//  ViewController.swift
//  ImageTextViewDemo
//
//  Created by Christian Paul Dehli on 10/17/15.
//  Copyright © 2015 Christian Paul Dehli. All rights reserved.
//

import UIKit
import ImageTextView

class ViewController: UIViewController {
    
    @IBOutlet weak var imageTextView: ImageTextView!

    @IBAction func addImage(sender: AnyObject) {
        let w = CGFloat(100)
        let h = CGFloat(90)
        
        UIGraphicsBeginImageContext(CGSize(width: w, height: h))
        let p = UIBezierPath(rect: CGRectMake(0, 0, w, h))
        UIColor.blueColor().setFill()
        p.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imageTextView.addImage(image)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tap.cancelsTouchesInView = false
        self.navigationController?.navigationBar.addGestureRecognizer(tap)
        
        imageTextView.placeholder = "This is the placeholder..."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        imageTextView.resignFirstResponder()
    }

}

