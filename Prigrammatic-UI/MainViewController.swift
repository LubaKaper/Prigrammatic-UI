//
//  ViewController.swift
//  Prigrammatic-UI
//
//  Created by Liubov Kaper  on 1/28/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var mainView = MainView()
    // if doing programmatic UI, implement and setup the view in loadView()
    // loadView() gets called before viewDSidLoad
    // loadView() sets up initial view of the controller
    // do not call super when overriding loadView
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavBar()
        // add target/action to reset button
        mainView.resetButton.addTarget(self, action: #selector(resetAppColor(_:)), for: .touchUpInside)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
         updateAppColor()
    }
    
    private func updateAppColor() {
        if let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String {
            view.backgroundColor = UIColor(named: colorName)
        } else {
            
        }
    }
    // function to configure NavBar
    private func configureNavBar() {
        // set title of Navigation bar
        navigationItem.title = "Programmatic UI"
        
        // adding UIBarButtonItem to Navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_:)))
    }
    @objc
    private func showSettings(_ sender: UIBarButtonItem) {
       // segue to the settingsVC
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
        
        // or this: Will present modally(different styles)
       // present(settingsVC, animated: true)
       // settingsVC.modalPresentationStyle = .overCurrentContext
        //settingsVC.modalTransitionStyle = .flipHorizontal
    }
    
    @objc
    private func resetAppColor(_ sender: UIButton) {
        print("reset app color")
        //view.backgroundColor = .systemPink
    }
    
}

