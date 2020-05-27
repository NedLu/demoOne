//
//  SecondScen.swift
//  demoProject
//
//  Created by 9splay_user on 2020/5/19.
//  Copyright © 2020 9splay_user. All rights reserved.
//

import Foundation

import UIKit



class SecondScene : ViewController, UICollectionViewDelegate,
UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var PhotosCollection: UICollectionView!
    
    var photosArray : Array<photosData> = []
    
    var imageDic : [Int:UIImage] = [:]
    
    override func viewDidLoad() {
        
        //           screenSize = UIScreen.main.bounds.size
        
        PhotosCollection.delegate = self
        
        PhotosCollection.dataSource = self
        
        let flowLayout = PhotosCollection.collectionViewLayout as? UICollectionViewFlowLayout
        
        let width = (self.view.frame.size.width) / 4;
        
        flowLayout?.itemSize = CGSize(width: width, height: width)
        
        flowLayout?.estimatedItemSize = .zero
        
        flowLayout?.minimumInteritemSpacing = 0
        
        let mainQueue = DispatchQueue.main
        
        for dic:photosData in photosArray {
            
            let url = URL(string: dic.thumbnailUrl)!
            
            mainQueue.async {
                
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data, let image = UIImage(data: data) {
                        
                        self.imageDic[dic.id] = image
                        
                        DispatchQueue.main.async {
                            
                            self.PhotosCollection.reloadItems(at: [IndexPath(item:dic.id-1, section: 0)])
                        }
                        
                    }
                }
                
                task.resume()
            }
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photosArray.count
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! photoCell
        
        let tmpDic:photosData = photosArray[indexPath.row]
        
        cell.TitleLabel?.text? = tmpDic.title

        cell.IDLabel?.text? = String(tmpDic.id)
        
        if let image = imageDic[tmpDic.id] {
            
            cell.BackgroundImage.image = image
            
        }

        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let tmpDic:photosData = photosArray[indexPath.row]
        
        if let image = imageDic[tmpDic.id] {
            
            if let controller = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailScene")as?DetailScene {
                
                controller.info = ["id":String(tmpDic.id),"title":tmpDic.title,"image":image]
                
                self.present(controller, animated: true, completion: nil)
                
            }
            
        }
        
    }
       
       
    @IBAction func backBtnClick(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
}
