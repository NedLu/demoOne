//
//  DetailScene.swift
//  demoProject
//
//  Created by 9splay_user on 2020/5/19.
//  Copyright © 2020 9splay_user. All rights reserved.
//

import Foundation

import UIKit

class DetailScene: UIViewController {
    
    var info: Dictionary<String, Any>?
    
    @IBOutlet weak var BackgroundImage: UIImageView!
    
    @IBOutlet weak var IDLabel: UILabel!
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    override func viewDidLoad() {
        
        self.BackgroundImage.image = info!["image"] as? UIImage
        
        let id = info!["id"] as? String
        
        let title = info!["title"] as? String
        
        self.IDLabel.text = String(format: "id = %@", id!)
        
        self.TitleLabel.text = String(format: "title = %@",title!)
        
    }
    
    @IBAction func backBtnClick(_ sender: Any) {
          self.dismiss(animated: false, completion: nil)
      }
    
}
