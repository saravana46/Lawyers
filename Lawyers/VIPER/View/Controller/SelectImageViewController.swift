//
//  SelectImageViewController.swift
//  Lawyers
//
//  Created by Saravana on 03/11/22.
//

import UIKit

class SelectImageViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var selectImage: UIImageView!
    
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "SelectImage"
        galleryButton.setBorder()
        cameraButton.setBorder()
    }
    
    @IBAction func backButtonTabbed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func galleryButtonTabbed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func cameraButtonTabbed(_ sender: Any) {
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        selectImage.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}
