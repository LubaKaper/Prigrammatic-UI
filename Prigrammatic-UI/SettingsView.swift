//
//  SettingsView.swift
//  Prigrammatic-UI
//
//  Created by Liubov Kaper  on 1/28/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    // lazy property initializer
    public lazy var pickerView: UIPickerView = {
       let pv = UIPickerView()
        //pv.backgroundColor = .black
        return pv
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        // add subViews
        setupPickerViewConstraints()
    }
    
    private func setupPickerViewConstraints() {
        // 1.
        addSubview(pickerView)
        //2.
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        // 3.
        NSLayoutConstraint.activate([
            pickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    

}
