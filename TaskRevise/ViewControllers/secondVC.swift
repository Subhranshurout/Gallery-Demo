//
//  secondVC.swift
//  TaskRevise
//
//  Created by Yudiz-subhranshu on 14/04/23.
//

import UIKit

class mycell2 :UICollectionViewCell , UIScrollViewDelegate{
    
    @IBOutlet var imageLbl: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    
    override  func awakeFromNib() {
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        scrollView.delegate = self
        doubleTapZoom()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageLbl
    }
    func doubleTapZoom() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTab))
        tap.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(tap)
        scrollView.isUserInteractionEnabled = true
        imageLbl.isUserInteractionEnabled = true
    }
    @objc func handleTab(_ gesture: UITapGestureRecognizer){
        if scrollView.zoomScale == 1 {
            let scale = gesture.location(in: imageLbl)
            let rect = CGRect(x: scale.x, y: scale.y, width: 1, height: 1)
            scrollView.zoom(to: rect, animated: true)
        }else {
            scrollView.setZoomScale(1, animated: true)
        }
    }
}

class secondVC: UIViewController {
    @IBOutlet var OpTable: UICollectionView!
    
    var receivedIndex : Int = 0
    var myImages : [UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OpTable.scrollToItem(at: IndexPath(item: receivedIndex, section: 0), at: .right, animated: false)
        OpTable.layoutSubviews()
    }
}
extension secondVC : UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = OpTable.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! mycell2
        cell.imageLbl.image = myImages[indexPath.row]
        cell.scrollView.setZoomScale(1.0, animated: true)
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! mycell2
        cell.scrollView.setZoomScale(1.0, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! mycell2
        cell.scrollView.setZoomScale(1.0, animated: true)
    }
}
