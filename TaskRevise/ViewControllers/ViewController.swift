//
//  ViewController.swift
//  TaskRevise
//
//  Created by Yudiz-subhranshu on 14/04/23.
//

import UIKit

class mycell : UICollectionViewCell {
    
    @IBOutlet var imageLbl: UIImageView!
}

class ViewController: UIViewController {

    var myImages : [UIImage]!
    
    @IBOutlet var myTable: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myImages = [UIImage]()
        for i in 1...8 {
            myImages.append(UIImage(named: "img\(i)")!)
        }
        for i in 1...8 {
            myImages.append(UIImage(named: "img\(i)")!)
        }
        for i in 1...8 {
            myImages.append(UIImage(named: "img\(i)")!)
        }
    }
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = sender as? Int {
            let destinationVC = segue.destination as! secondVC
            destinationVC.receivedIndex = index
            destinationVC.myImages = myImages

        }
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        myImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myTable.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! mycell
        cell.imageLbl.image = myImages[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(collectionView.frame.size.width / 3 , collectionView.frame.size.width / 3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "secondVC", sender: indexPath.row)
    }
}

