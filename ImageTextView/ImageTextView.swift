//
//  ImageTextView.swift
//  ImageTextView
//
//  Created by Christian Paul Dehli on 10/17/15.
//  Copyright © 2015 Christian Paul Dehli. All rights reserved.
//

import UIKit

public protocol ImageTextViewDelegate {
    func textViewShouldBeginEditing(textView: ImageTextView!) -> Bool
    func textViewDidEndEditing(textView: ImageTextView!)
    func textViewDidChange(textView: ImageTextView!)
}

public class ImageTextView: UITextView, UITextViewDelegate {
    
    public var placeholder: String!
    public var realDelegate: ImageTextViewDelegate!
    
    private var placeholderLabel: UILabel!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor.clearColor()
        
        placeholderLabel = UILabel()
        placeholderLabel.text = placeholder
        placeholderLabel.backgroundColor = UIColor.clearColor()
        placeholderLabel.textColor = UIColor.lightGrayColor()
        placeholderLabel.font = font
        addSubview(placeholderLabel)
        
        
        delegate = self
    }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        placeholderLabel.text = placeholder
        placeholderLabel.sizeToFit()
        
        // Add offset to label
        placeholderLabel.frame = CGRectMake(placeholderLabel.frame.origin.x + 4,
            placeholderLabel.frame.origin.y + 8,
            placeholderLabel.frame.size.width,
            placeholderLabel.frame.size.height)
    }
    
    public func addImage(image: UIImage) {
        
        let attributedString = NSMutableAttributedString(attributedString: attributedText)
        
        let attachment = NSTextAttachment()
        attachment.image = image
        
        let scaleFactor =  attachment.image!.size.width / (0.5*frame.size.width - 10);
        attachment.image = UIImage(CGImage: attachment.image!.CGImage!, scale: scaleFactor, orientation: .Up)
        
        let attrStringWithImage = NSAttributedString(attachment: attachment)
        attributedString.replaceCharactersInRange(selectedRange, withAttributedString: attrStringWithImage)
        
        attributedString.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(14), range: NSMakeRange(0, attributedString.length))
        
        attributedText = attributedString;
        
        placeholderLabel.hidden = true
    }
    
    // UITextViewDelegate
    
    public func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        placeholderLabel.hidden = true
        return realDelegate.textViewShouldBeginEditing(self)
    }
    
    public func textViewDidEndEditing(textView: UITextView) {
        if text == "" {
            placeholderLabel.hidden = false
        }
        realDelegate.textViewDidEndEditing(self)
    }
    
    public func textViewDidChange(textView: UITextView) {
        realDelegate.textViewDidChange(self)
    }
}