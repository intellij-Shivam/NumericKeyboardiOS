//
//  Keyboard.swift
//  NumericKeypad
//
//  Created by Shivam Saini on 06/12/18.
//  Copyright © 2018 intellij-Shivam. All rights reserved.
//

import UIKit

public typealias EnterButtonBlock = (_ sender: UIButton) -> Void

public let keyboardFrame = CGRect(x: 0, y: 0, width: 350, height: 300)

open class Keyboard: UIView {
    var view: UIView!
    var enterCallback: EnterButtonBlock?
    
    @IBOutlet public var dotButton: UIButton!
    
    required public init(showDotButton show:Bool = false, completion:@escaping EnterButtonBlock) {
        super.init(frame: keyboardFrame)
        enterCallback = completion
        setupXib()
        self.dotButton.isHidden = !show
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.view.isOpaque = false
        view.isOpaque = false
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupXib() {
        view = loadViewfromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,
                                 UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    func loadViewfromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "NumericKeyboard", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    @IBAction func keytapped(_ sender: UIButton) {
        if let activeTextField = UIResponder.currentFirst() as? UITextField {
            if sender.tag == 11 {
                var textArray = Array(activeTextField.text ?? "")
                let _ = textArray.popLast()
                activeTextField.text = String(textArray)
            }else if sender.tag == 12 {
                //Back Button Tapped
                enterCallback!(sender)
            }else if sender.tag == 13 {
                activeTextField.text = activeTextField.text! + "."
            }
            else {
                activeTextField.text = activeTextField.text! + "\(sender.tag)"
            }
        }
    }
    
}

public extension UIResponder {
    
    private struct Static {
        static weak var responder: UIResponder?
    }
    
    static func currentFirst() -> UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }
    
    @objc private func _trap() {
        Static.responder = self
    }
}

