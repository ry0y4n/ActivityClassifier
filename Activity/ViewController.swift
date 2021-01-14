//
//  ViewController.swift
//  Activity
//
//  Created by laurent.droguet on 15/07/2019.
//  Copyright © 2019 laurent.droguet. All rights reserved.
//

import UIKit
import CoreActivity

class ViewController: UIViewController {

    @IBOutlet weak private var activityLabel: UILabel!

    let motionManager = MotionManager()
    let mlManager = MLManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        motionManager
            .getMotionData()
                { [weak self] data in
                    guard let self = self else { return }
                    self.mlManager
                        .handleMotionDataAndPredict(motionData: data,
                                                    classification: { [weak self] classification in
                                                        guard let self = self else { return }
                                                        self.activityLabel.text = classification
                        })
        }
        
//        motionManager.accelerometerUpdateInterval = TimeInterval(ModelConstants.sensorsUpdateInterval)
//            motionManager.gyroUpdateInterval = TimeInterval(ModelConstants.sensorsUpdateInterval)
//             
//            // モーションデータをプッシュ型ではなく、プル型で加速度・ジャイロを同時に処理するためにタイマーを使う
//            motionManager.startAccelerometerUpdates()
//            motionManager.startGyroUpdates()
//            timer = Timer.scheduledTimer(timeInterval: ModelConstants. sensorsUpdateInterval, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }
}

