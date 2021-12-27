//
//  ViewController.swift
//  ImageDemo
//
//  Created by Coditas on 09/11/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fourth: UIView!
    @IBOutlet weak var third: UIView!
    @IBOutlet weak var second: UIView!
    @IBOutlet weak var first: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGestureRecogniser()
    }
    @IBAction func save(_ sender: UIButton) {
        viewFrame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height:view.frame.height)
        print(first.center)
        image.addSubview(first)
        // image.draw(viewFrame)
        //image.addSubview()
        // let final = image.abc(i: viewFrame)
        let imageView = UIImageView(image: image.finalImage)
        let vc = (storyboard?.instantiateViewController(identifier: "ImageViewController"))! as ImageViewController
        vc.img = imageView.image
        self.present(vc, animated: true, completion: nil)
    }
    var viewFrame : CGRect!
    var firstPoint: CGRect!
    let defaults = UserDefaults.standard
    @objc func draggingView(_ sender: UIPanGestureRecognizer){
        let point = sender.location(in:view)
        print("#",point)
        let draggerView = sender.view!
        draggerView.center = point
        switch sender.state{
        case .ended:
            print(point)
        //        case second:
        //            // defaults.set(point, forKey: "Position_2") as
        //            print("this is 2nd")
        //        case third:
        //            print ("this is 3rd")
        //        case fourth:
        //            print ("this is 4th")
        default :
            break
        }
        
    }
    func addGestureRecogniser(){
        //  var mainViewFrame = CGPoint(x: image.center.x , y: image.center.y)
        let subviews = [first,second,third,fourth]
        subviews.forEach { views in
            view.bringSubviewToFront(views!)
            image.bringSubviewToFront(views!)
        }
        for view in subviews{
            
            let gestureRecogniser = UIPanGestureRecognizer(target: self, action: #selector(draggingView))
            view?.addGestureRecognizer(gestureRecogniser)
        }
        
    }
}
extension UIView {
 
    var finalImage: UIImage? {
        let renderer = UIGraphicsImageRenderer(bounds: self.bounds)
        return renderer.image { rendererContext in layer.render(in: rendererContext.cgContext) }
    }
    //        return finalImage!
    //    }

}

