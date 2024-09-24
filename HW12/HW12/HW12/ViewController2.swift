//
//  ViewController2.swift
//  HW12
//
//  Created by Злата Лашкевич on 21.09.24.
//

import UIKit

protocol EditPropertyViewControllerDelegate: AnyObject {
    func didSaveProperty(key: propertyKey, value: Any?)
}

final class EditPropertyViewController: UIViewController {
    
    var propertyKey: PropertyKey
    var propertyValue: any?
    var propertyType: PropertyType
}

