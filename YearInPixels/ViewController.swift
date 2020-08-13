//
//  ViewController.swift
//  YearInPixels
//
//  Created by Charity Hsu on 8/9/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var janCV: UICollectionView!
    @IBOutlet weak var febCV: UICollectionView!
    @IBOutlet weak var marCV: UICollectionView!
    @IBOutlet weak var aprCV: UICollectionView!
    @IBOutlet weak var mayCV: UICollectionView!
    @IBOutlet weak var junCV: UICollectionView!
    @IBOutlet weak var julCV: UICollectionView!
    @IBOutlet weak var augCV: UICollectionView!
    @IBOutlet weak var sepCV: UICollectionView!
    @IBOutlet weak var octCV: UICollectionView!
    @IBOutlet weak var novCV: UICollectionView!
    @IBOutlet weak var decCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch collectionView {
        case janCV:
            return jan.count
        case febCV:
            return feb.count
        case marCV:
            return mar.count
        case aprCV:
            return apr.count
        case mayCV:
            return may.count
        case junCV:
            return jun.count
        case julCV:
            return jul.count
        case augCV:
            return aug.count
        case sepCV:
            return sep.count
        case octCV:
            return oct.count
        case novCV:
            return nov.count
        case decCV:
            return dec.count
        default:
            return 31
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == janCV {
            let janCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JanCell", for: indexPath) as! CollectionViewCell
            
            janCell.myLabel.text = jan[indexPath.item]
            
            if janCell.myLabel.text == " " {
                janCell.isHidden = true
            }
            return janCell
        } else if collectionView == febCV {
            let febCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FebCell", for: indexPath) as! CollectionViewCell
            
            febCell.myLabel.text = feb[indexPath.item]
            
            if febCell.myLabel.text == " " {
                febCell.isHidden = true
            }
            return febCell
        } else if collectionView == marCV {
            let marCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarCell", for: indexPath) as! CollectionViewCell
            
            marCell.myLabel.text = mar[indexPath.item]
            
            if marCell.myLabel.text == " " {
                marCell.isHidden = true
            }
            return marCell
        } else if collectionView == aprCV {
            let aprCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AprCell", for: indexPath) as! CollectionViewCell
            
            aprCell.myLabel.text = apr[indexPath.item]
            
            if aprCell.myLabel.text == " " {
                aprCell.isHidden = true
            }
            return aprCell
        } else if collectionView == mayCV {
            let mayCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MayCell", for: indexPath) as! CollectionViewCell
            
            mayCell.myLabel.text = may[indexPath.item]
            
            if mayCell.myLabel.text == " " {
                mayCell.isHidden = true
            }
            return mayCell
        } else if collectionView == junCV {
            let junCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JunCell", for: indexPath) as! CollectionViewCell
            
            junCell.myLabel.text = jun[indexPath.item]
            
            if junCell.myLabel.text == " " {
                junCell.isHidden = true
            }
            return junCell
        } else if collectionView == julCV {
            let julCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JulCell", for: indexPath) as! CollectionViewCell
            
            julCell.myLabel.text = jul[indexPath.item]
            
            if julCell.myLabel.text == " " {
                julCell.isHidden = true
            }
            return julCell
        } else if collectionView == augCV {
            let augCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AugCell", for: indexPath) as! CollectionViewCell
            
            augCell.myLabel.text = aug[indexPath.item]
            
            if augCell.myLabel.text == " " {
                augCell.isHidden = true
            }
            return augCell
        } else if collectionView == sepCV {
            let sepCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SepCell", for: indexPath) as! CollectionViewCell
            
            sepCell.myLabel.text = sep[indexPath.item]
            
            if sepCell.myLabel.text == " " {
                sepCell.isHidden = true
            }
            return sepCell
        } else if collectionView == octCV {
            let octCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OctCell", for: indexPath) as! CollectionViewCell
            
            octCell.myLabel.text = oct[indexPath.item]
            
            if octCell.myLabel.text == " " {
                octCell.isHidden = true
            }
            return octCell
        } else if collectionView == novCV {
            let novCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NovCell", for: indexPath) as! CollectionViewCell
            
            novCell.myLabel.text = nov[indexPath.item]
            
            if novCell.myLabel.text == " " {
                novCell.isHidden = true
            }
            return novCell
        } else {
            let decCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DecCell", for: indexPath) as! CollectionViewCell
            
            decCell.myLabel.text = dec[indexPath.item]
            
            if decCell.myLabel.text == " " {
                decCell.isHidden = true
            }
            return decCell
        }
        
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let itemInfo = Sender(CV: collectionView, IP: indexPath)

        performSegue(withIdentifier: "showPopup", sender: itemInfo)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPopup" {
            if let itemInfo = sender as? Sender {
                let controller = segue.destination as! PopupVC
                
                controller.previousVC = self
                controller.senderInfo = itemInfo
            }
        }
        
    }
    
}

