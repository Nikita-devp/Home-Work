//
//  Files.swift
//  MyGraduationProject
//
//  Created by Злата Лашкевич on 14.12.24.
import UIKit

class ImagePicker: NSObject, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var imagePickerController: UIImagePickerController?
    
    func showImage(in viewСontroler: UIViewController){
        imagePickerController = UIImagePickerController()
        imagePickerController?.delegate = self
        viewСontroler.present(imagePickerController!, animated: true)
    }
}
