//
//  KeyboardViewController.swift
//  Surfboard
//
//  Created by Dulio Denis on 8/28/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add a button to the keyboard
        var button=UIButton(frame: CGRectMake(150, 40, 120, 120))
        var hipster = UIImage(named: "hipster.png")
        button.setBackgroundImage(hipster, forState: .Normal)
        button.addTarget(self, action: "didPressButton", forControlEvents: .TouchUpInside)
        view.addSubview(button)
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as! UIButton
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
    
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as! UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
    
    // MARK: - Quote Helper Method
    
    func randomQuote() -> String {
        var quotes: [String] = ["Violence is my last option. – Chuck Norris", "Those who believe in telekinetics, raise my hand. – Kurt Vonnegut", "Rather be dead than cool. – Kurt Cobain", " I love deadlines. I like the whooshing sound they make as they fly by. – Douglas Adams", "A guilty conscience needs to confess. A work of art is a confession. – Albert Camus", "A day without sunshine is like, you know, night. – Steve Martin"]
        
        var quote = Int(arc4random_uniform(UInt32(quotes.count)))
        
        return quotes[quote]
    }
    
    
    // MARK: - Button Action
    
    func didPressButton() {
        var proxy = textDocumentProxy as! UITextDocumentProxy
        proxy.insertText(randomQuote())
    }

}
