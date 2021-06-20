

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12

    let eggTimes = ["Soft":3,"Medium":4,"Hard":7]
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        print(eggTimes[hardness]!)
        
        progressBar.progress = 0.0
        secondsPassed  = 0
        mainTitle.text = hardness
        
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true )
        
        
        }
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            secondsPassed += 1
            var percentageProgress : Float = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = percentageProgress
        }
        else {
            timer.invalidate()
            mainTitle.text = "DONE!"
            playSound()
        }
        
        func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
    
 
        
//            switch hardness {
//            case "Soft":
//                print(5)
//            case "Medium":
//                print(7)
//            case "Hard":
//                print(12)
//            default:
//                print()
//        }
    }
    
//    var count = 60
//
//
//        var timer = Timer.scheduledTimer(timeInterval: 1, target: any, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
//
//
//    func update() {
//        if(count > 0) {
//            //countDownLabel.text = String(count--)
//            print("\(count) seconds")
//        }
//
}
