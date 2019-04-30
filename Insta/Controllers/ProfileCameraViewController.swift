//
//  ProfileCameraViewController.swift
//  Insta
//
//  Created by Ryan Luu on 4/30/19.
//  Copyright © 2019 rnluu. All rights reserved.
//

import UIKit
import Parse

class ProfileCameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onImageTap(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func onPostTap(_ sender: Any) {
        let user = PFUser.current()!
        
        let imageData = profileImageView.image?.pngData()
        let file = PFFileObject(data: imageData!)
        user["profile_img"] = file
        
        user.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("success")
            } else {
                print("error")
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let resizedImage = image.af_imageAspectScaled(toFill: size)
        profileImageView.image = resizedImage
        dismiss(animated: true, completion: nil)
    }
}
