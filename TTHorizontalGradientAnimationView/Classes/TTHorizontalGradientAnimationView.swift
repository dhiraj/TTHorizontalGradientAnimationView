//
//  TTHorizontalGradientAnimationView.swift
//  Pods
//
//  Created by Dhiraj Gupta on 5/1/17.
//
//

import UIKit

extension Array {
    mutating func rearrange(from: Int, to: Int) {
        insert(remove(at: from), at: to)
    }
}


open class TTHorizontalGradientAnimationView: UIView,CAAnimationDelegate {

    override public init(frame: CGRect) {
        super.init(frame: frame)
        initCommon()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override open func awakeFromNib() {
        super.awakeFromNib()
        initCommon()
    }
    open func initCommon(){
        self.isOpaque = true
        let glayer = self.layer as! CAGradientLayer
        // Use a horizontal gradient
        glayer.startPoint = CGPoint(x:0,y:0.5)
        glayer.endPoint = CGPoint(x:1,y:0.5)
        
        // Create the gradient colors using hues in 5 degree increments
        var allcolors:[Any] = []
        for deg in stride(from: 0, to: 360.0, by: 5.0){
            allcolors.append(UIColor(hue: CGFloat(1.0 * deg / 360.0), saturation: 1, brightness: 1, alpha: 1).cgColor)
        }
        glayer.colors = allcolors
        self.performAnimation()
    }
    override open class var layerClass: Swift.AnyClass {
        get{
            return CAGradientLayer.self
        }
    }
    func shiftColors(inColors:[Any])->[Any]{
        guard inColors.count > 2 else {
            NSLog("Need at least 3 colors!")
            return inColors
        }
        var outColors:[Any] = []
        outColors.append(contentsOf: inColors)
        outColors.rearrange(from: outColors.count - 1, to: 0)
        return outColors
    }
    func performAnimation(){
        // Update the colors on the model layer
        let glayer = self.layer as! CAGradientLayer
        let fromColors = glayer.colors!
        let toColors = shiftColors(inColors: fromColors)
        glayer.colors = toColors
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = fromColors
        animation.toValue = toColors
        animation.duration = 0.008
        animation.isRemovedOnCompletion = true
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.delegate = self
        glayer.add(animation, forKey: "animateGradient")// Add the animation to our layer
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.performAnimation()
    }

}
