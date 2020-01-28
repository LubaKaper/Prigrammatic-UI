//
//  MainView.swift
//  Prigrammatic-UI
//
//  Created by Liubov Kaper  on 1/28/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let defaultMessage = "No default color set, please go to settings"
    
    // create a label(closure syntax)
    // HAS TO BE lazy
    public lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemYellow
        label.textAlignment = .center
        label.text = defaultMessage
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }() // () creates closure and calls simultaneously
    // TODO: syntax terminology
    
//    public var messageLabel: UILabel = {
//        let label = UILabel()
//        label.text = defaultMessage // DOES NOT COMPILE BECAUSE NOT lazy
//        return label
//    }()
    
    // create a button
    public lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.backgroundColor = .systemYellow
        return button
    }()

    // using initalizer
    // init(frame: ) gets called if the view is done programmatically
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    // if this view gets initialized from storyboard, this initializer gets called
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setUpMessageLabelConstraints()
        setupResetButtonConstraints()
        
    }
    private func setUpMessageLabelConstraints() {
        // add message label to the main view(ALWAYS)
        addSubview(messageLabel) // returns messegeLabel we created above
        
        // set constraints for the message label
        //1. getting rid of autoLayout
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        //2.
        // can do this way without making an array
        // messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        // Array of constraints
        NSLayoutConstraint.activate([
        // set topAnchor 20 points from the safe area top
            messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
        // set padding at the leading edge of the MAinView
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        // set padding at the trailing edge of the MAinView
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupResetButtonConstraints() {
        addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        // set constraints
        NSLayoutConstraint.activate([
        resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        resetButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40)
        ])
    }
}
