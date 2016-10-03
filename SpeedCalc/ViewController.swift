//
//  ViewController.swift
//  SpeedCalc
//
//  Created by 二階堂 遍 on 2016/09/24.
//  Copyright © 2016年 二階堂 遍. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    enum GameType {
        case Normal
        case Prime
    }
    
    var type = GameType.Normal
    
    let identifier = "calc"
    let size = UIScreen.main.bounds.size.width / 5
    var a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]
    var prime = [2, 3, 5, 7, 11, 13, 17, 19, 23]

    var interstitial: GADInterstitial!

    weak var timer: Timer?
    var cursor = 1
    
    @IBOutlet weak var progressView: UIProgressView!

    func gotoResult() {
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print ("not ready ========================")
        }
        
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var shuffleArray: [Int] = []
        for _ in 0 ..< a.count {
            shuffleArray.append(a.remove(at: Int(arc4random_uniform(UInt32(a.count)))))
        }
        
        a = shuffleArray

        for i in 1 ..< 26 {
            addButton(index: i)
        }
        
        setAd()
        initTimer()
    }
    
    func addButton(index: Int) {
        let button = UIButton()
        button.setTitle(String(a[index - 1]), for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: size, height: size)
        button.tag = 1
        
        let x = CGFloat((index - 1) % 5) * size + size / 2
        let y = CGFloat(((index - 1) / 5 + 2)) * size
        
        button.layer.position = CGPoint(x: x, y: y)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.addTarget(self, action: #selector(ViewController.buttonClick) , for: UIControlEvents.touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonClick(_ sender: Any?) {
        guard let button = sender as? UIButton else {
            return
        }
        
        guard let sText = button.titleLabel?.text else {
            return
        }

        switch type {
        case .Normal:
            if String(cursor) != sText {
                gotoResult()
            }
        case .Prime:
            if String(prime[cursor - 1]) != sText {
                gotoResult()
            }
        }
        
        button.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
        button.setTitle("", for: .normal)
        button.isEnabled = false

        cursor += 1
        
        if type == .Prime {
            if cursor == 10 {
                cursor = 26
                gotoResult()
            }
        }
        
        if cursor == 26 {
            gotoResult()
        }
    }
    
    func setAd() {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3117890941833470/3804613347")
        let request = GADRequest()
        request.testDevices = [ kGADSimulatorID, "ce575c80c4ff3671687aa25da24d83b4" ]
        
        interstitial.load(request)
    }
    
    func initTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
    }
    
    @objc func countDown() {
        progressView.progress = progressView.progress - 0.0002
        
        if progressView.progress == 0 {
            gotoResult()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ResultViewController else {
            return
        }
        
        vc.viewModel = ResultViewModel()
        vc.viewModel.correct = cursor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

