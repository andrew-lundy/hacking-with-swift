//
//  DetailViewController.swift
//  Project1
//
//  Created by Andrew Lundy on 8/20/19.
//  Copyright © 2019 Andrew Lundy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedImage: String?
    var totalPhotos = 0
    var selectedPhotoNumber = 0
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        title = "Picture \(selectedPhotoNumber) of \(totalPhotos)"
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.hidesBarsOnTap = false
    }
}
