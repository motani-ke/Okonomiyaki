//
//  ResultViewController.swift
//  SpeedCalc
//
//  Created by 二階堂 遍 on 2016/09/28.
//  Copyright © 2016年 二階堂 遍. All rights reserved.
//

import UIKit
import GoogleMobileAds

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var rank: UILabel!
    
    @IBOutlet weak var ad: GADBannerView!
    
    var viewModel = ResultViewModel()
    
    @IBAction func backToHome(_ sender: AnyObject) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAd()
        navigationItem.hidesBackButton = true
        
        rank.text = viewModel.getRank()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func setAd() {
        ad.adSize = kGADAdSizeSmartBannerPortrait
        ad.adUnitID = "ca-app-pub-3117890941833470/9972558148"
        ad.rootViewController = self
        let request = GADRequest()
        request.testDevices = ["ce575c80c4ff3671687aa25da24d83b4"]
        ad.load(request)
        
    }
}
