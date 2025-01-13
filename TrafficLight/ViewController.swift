//
//  ViewController.swift
//  TrafficLight
//
//  Created by Дима Монид on 11.01.25.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var lightViewRed: UIView!
    @IBOutlet var lightViewOrange: UIView!
    @IBOutlet var lightViewGreen: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight: CurrentLight = .red
    private let lightOn = 1.0
    private let lightOff = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lightViewRed.alpha = lightOff
        lightViewOrange.alpha = lightOff
        lightViewGreen.alpha = lightOff
        
        startButton.layer.cornerRadius = 10
        

    }
    
    override func viewWillLayoutSubviews() {
        lightViewRed.layer.cornerRadius = lightViewRed.frame.height / 2
        lightViewOrange.layer.cornerRadius = lightViewOrange.frame.height / 2
        lightViewGreen.layer.cornerRadius = lightViewGreen.frame.height / 2
    }

    @IBAction func startButtonDidTapped(_ sender: UIButton) {
        
        switch currentLight{
        case .red:
            lightViewGreen.alpha = lightOff
            lightViewRed.alpha = lightOn
            currentLight = .orange
        case .orange:
            lightViewRed.alpha = lightOff
            lightViewOrange.alpha = lightOn
            currentLight = .green
        case .green:
            lightViewOrange.alpha = lightOff
            lightViewGreen.alpha = lightOn
            currentLight = .red
        }
        sender.setTitle("NEXT", for: .normal)

    }
    
}

extension ViewController {
    private enum CurrentLight {
        case red, orange, green
    }
}
