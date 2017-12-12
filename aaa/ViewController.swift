//
//  ViewController.swift
//  aaa
//
//  Created by user on 2017/10/30.
//  Copyright © 2017年 tzuyen. All rights reserved.
//

import UIKit
//import CoreGraphics
import CoreImage

class ViewController: UIViewController {

    @IBOutlet weak var hpOrb: UIImageView!
    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        var angle = sender.value
        var radian = angle * .pi / 180
        imagEffectWithHue(radian: CGFloat(radian))
        print("111")
    }
    
    func imagEffectWithHue(radian: CGFloat) {
        var coreImage = CIImage(image: UIImage(named: "bg18")!)
        let hueFilter = CIFilter(name: "CIHueAdjust")
        
        hueFilter?.setValue(coreImage, forKey: kCIInputImageKey)
        hueFilter?.setValue(radian, forKey: "inputAngle")
        
        coreImage = hueFilter?.outputImage
        let context = CIContext(options: nil)
        let cgImage = context.createCGImage(coreImage!, from: coreImage!.extent)
        hpOrb.image = UIImage(cgImage: cgImage!)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filters = CIFilter.filterNames(inCategory: kCICategoryBuiltIn)
        print(filters)
        print(filters.count)
        
       
        
    }

    


}

