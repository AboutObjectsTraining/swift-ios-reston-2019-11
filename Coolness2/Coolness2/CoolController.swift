// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class CoolController: UIViewController
{
    @IBOutlet var textField: UITextField!
    @IBOutlet var contentView: UIView!
    
    @IBAction func addCell() {
        print("In \(#function), text is \(textField.text ?? "null")")
        let newCell = CoolViewCell()
        newCell.text = textField.text
        newCell.backgroundColor = UIColor.brown
        contentView.addSubview(newCell)
    }
    
    func loadView3() {
        Bundle.main.loadNibNamed("CoolStuff", owner: self, options: nil)
    }
    
    func loadView2() {
        guard let topLevelObjs = Bundle.main.loadNibNamed("CoolStuff", owner: nil, options: nil) else { return }
        view = topLevelObjs.first as? UIView
    }
    
    func loadView1() {
        view = UIView()
        view.backgroundColor = UIColor.brown
        
        let subview1 = CoolViewCell(frame: CGRect(x: 20, y: 60, width: 240, height: 40))
        let subview2 = CoolViewCell(frame: CGRect(x: 60, y: 120, width: 240, height: 40))
        
        let screenRect = UIScreen.main.bounds
        let (accessoryRect, contentRect) = screenRect.divided(atDistance: 120, from: .minYEdge)
        
        let accessoryView = UIView(frame: accessoryRect)
        contentView = UIView(frame: contentRect)
        contentView.clipsToBounds = true
        
        view.addSubview(accessoryView)
        view.addSubview(contentView)
        
        accessoryView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        // Controls
        
        textField = UITextField(frame: CGRect(x: 15, y: 80, width: 240, height: 30))
        accessoryView.addSubview(textField)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter some text"
        
        textField.delegate = self
        
        let button = UIButton(type: .system)
        accessoryView.addSubview(button)
        button.setTitle("Add", for: .normal)
        button.sizeToFit()
        button.frame = button.frame.offsetBy(dx: 270, dy: 80)
        
        button.addTarget(self, action: #selector(addCell), for: .touchUpInside)
        
        // Cool Cells
        subview1.text = "Cool View Cells Rock!!! 🎉🍾"
        subview2.text = "Hello World! 🌍🌎🌏"
        
        contentView.addSubview(subview1)
        contentView.addSubview(subview2)
        
        subview1.backgroundColor = UIColor.systemPurple
        subview2.backgroundColor = UIColor.systemOrange
    }
}

extension CoolController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//extension CoolController
//{
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("In \(#function), class is \(CoolController.self)")
//        super.touchesBegan(touches, with: event)
//    }
//}
