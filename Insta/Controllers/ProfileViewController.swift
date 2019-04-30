//
//  ProfileViewController.swift
//  Insta
//
//  Created by Ryan Luu on 4/29/19.
//  Copyright © 2019 rnluu. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUserInfo()
    }
    
    func setUserInfo() {
        let user = PFUser.current()!
        if let userPhoto = user["profile_img"] {
            let imageFile = userPhoto as! PFFileObject
            let urlString = imageFile.url!
            let urlConn = URL(string: urlString)
            profileImageView.af_setImage(withURL: urlConn!)
        } else {
            profileImageView.image = UIImage(named: "image_placeholder")
        }
        profileNameLabel.text = user.username
    }

    @IBAction func onProfileCameraTap(_ sender: Any) {
    }
}
