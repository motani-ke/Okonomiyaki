//
//  ResultViewController.swift
//  SpeedCalc
//
//  Created by 二階堂 遍 on 2016/09/27.
//  Copyright © 2016年 二階堂 遍. All rights reserved.
//

import UIKit

final class StartViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: StartCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: StartCollectionViewCell.identifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ViewController else {
            return
        }
        
        guard let type = sender as? ViewController.GameType else {
            return
        }
        
        vc.type = type
    }
}

extension StartViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2 - 15
        let height = collectionView.frame.height / 2
        return CGSize(width: width, height: height)
    }
    
    /*
     セルの回りのマージン
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let margin: CGFloat = 10.0
        let marginBottom: CGFloat = 50.0
        return UIEdgeInsetsMake(margin, margin, marginBottom, margin)
    }
    
    /*
     セル上下のスペース
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StartCollectionViewCell.identifier, for: indexPath) as! StartCollectionViewCell
        
        switch indexPath.row {
        case 0:
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.text.text = "ノーマル"
        case 1:
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.text.text = "素数"
        default:
            cell.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
            cell.text.text = "🔑"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "gameStart", sender: ViewController.GameType.Normal)
        case 1:
            performSegue(withIdentifier: "gameStart", sender: ViewController.GameType.Prime)
        default: break
            // なにもしない
        }
    }
}
