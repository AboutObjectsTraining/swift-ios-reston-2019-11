// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class CoolView: UIView
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
}

extension CoolView: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
