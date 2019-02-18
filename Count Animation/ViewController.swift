//
//  ViewController.swift
//  Count Animation
//
//  Created by user140592 on 2/18/19.
//  Copyright © 2019 talspektor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let countingLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(countingLabel)
        countingLabel.frame = view.frame
        
        // create CADisplayLink
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
    }
    
    var startValue: Double = 500
    let endValue: Double = 1000
    let animationDuration: Double = 3.5
    
    let animationStartDate = Date()
    
    @objc func handleUpdate() {
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        
        if elapsedTime > animationDuration {
            self.countingLabel.text = "\(endValue)"
        }else {
            let persantage = elapsedTime / animationDuration
            let value = startValue + persantage * (endValue - startValue)
            self.countingLabel.text = "\(value)"
        }
        
    }
}

