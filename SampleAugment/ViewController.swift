//
//  ViewController.swift
//  SampleAugment
//
//  Created by WENDRA RIANTO on 2021/11/04.
//

import UIKit
import CoreMotion
class ViewController: UIViewController {

    
    @IBOutlet weak var accelX: UILabel!
    @IBOutlet weak var accelY: UILabel!
    @IBOutlet weak var accelZ: UILabel!
    
    @IBOutlet weak var attitudeRoll: UILabel!
    @IBOutlet weak var attitudePitch: UILabel!
    @IBOutlet weak var attitudeYaw: UILabel!
    let motionManager:CMMotionManager = CMMotionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let motion_handler:CMDeviceMotionHandler = self.outputMotionData
        let handler : CMAccelerometerHandler = self.outputAccelData
        
        motionManager.deviceMotionUpdateInterval = 0.2
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!,withHandler:motion_handler)
        
        motionManager.startAccelerometerUpdates(to:OperationQueue.current!, withHandler: handler)
    }
    
    func outputMotionData(motion: CMDeviceMotion?, errorOC: Error?) {
        let attitude = motion!.attitude
        
        attitudeRoll.text = String(format: "%03f", attitude.roll)
        attitudePitch.text = String(format: "%03f", attitude.pitch)
        attitudeYaw.text = String(format: "%03f", attitude.yaw)
    }
    func outputAccelData(accelData: CMAccelerometerData?, errorOC: Error?) {
        let acceleration = accelData!.acceleration
        
        accelX.text = String(format: "%03f", acceleration.x)
        accelY.text = String(format: "%03f", acceleration.y)
        accelZ.text = String(format: "%03f", acceleration.z)
    }

}

