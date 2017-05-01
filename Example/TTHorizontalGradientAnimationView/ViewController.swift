//
//  ViewController.swift
//  TTHorizontalGradientAnimationView
//
//  Created by dhiraj on 05/01/2017.
//  Copyright (c) 2017 dhiraj. All rights reserved.
//

import UIKit
import TTHorizontalGradientAnimationView

class ViewController: UIViewController {

    let progressView = TTHorizontalGradientAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TTHorizontalGradientAnimationView"
        self.view.addSubview(progressView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        var remainder,temp:CGRect
        remainder = view.bounds
        (temp,remainder) = remainder.divided(atDistance: topLayoutGuide.length + 0.5, from: .minYEdge)
        (temp,remainder) = remainder.divided(atDistance: 2, from: .minYEdge)
        progressView.frame = temp
    }

}

