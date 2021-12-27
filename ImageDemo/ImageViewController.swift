//
//  ImageViewController.swift
//  ImageDemo
//
//  Created by Coditas on 10/11/21.
//

import UIKit

class ImageViewController: UIViewController {
    var img : UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = img
    }
    
    @IBAction func back(_ sender: UIButton) {
        let vc = (storyboard?.instantiateViewController(identifier: "ViewController"))! as ViewController
        //vc.img = imageView.image
        self.present(vc, animated: true, completion: nil)
    }
    @IBOutlet weak var image: UIImageView!
}
