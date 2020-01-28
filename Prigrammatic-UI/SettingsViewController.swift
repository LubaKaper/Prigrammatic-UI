//
//  SettingsViewController.swift
//  Prigrammatic-UI
//
//  Created by Liubov Kaper  on 1/28/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit

struct AppKey {
    static let appColorKey = "app color"
}

class SettingsViewController: UIViewController {
    
    private let settingsView = SettingsView()
    // dat for picker view
    private let colors = ["Orange", "Red", "Green", "Bubblegum", "Cyan", "Sky", "White", "Yellow" , "Lime", "Blue"]
    
    override func loadView() {
        view = settingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        
        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
        //colors[0]
        updateColor()
        //settingsView.pickerView.selectedRow(inComponent: <#T##Int#>)
    }
    
    func updateColor() {
        guard let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String else {
            return
        }
        view.backgroundColor = UIColor(named: colorName )
        let colorIndex = colors.firstIndex(of: colorName)
        settingsView.pickerView.selectRow(colorIndex ?? 0, inComponent: 0, animated: true)
    }

}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
}
extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let colorName = colors[row]
        view.backgroundColor = UIColor(named: colorName)
        
        // save color name to userDefaults
        
        UserDefaults.standard.set(colorName, forKey: AppKey.appColorKey)
    }
}
