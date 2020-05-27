//
//  ViewController.swift
//  demoProject
//
//  Created by 9splay_user on 2020/5/18.
//  Copyright © 2020 9splay_user. All rights reserved.
//

import UIKit

struct photosData: Decodable{
    
    var albumId:Int
    
    var id:Int
    
    var title:String
    
    var thumbnailUrl:String
}

class ViewController: UIViewController {

    @IBOutlet weak var apiBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func getAPIData(_ sender: Any) {
        
        let address = "https://jsonplaceholder.typicode.com/photos"
        
        if let url = URL(string: address) {
            // GET
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    
                    print("Error: \(error.localizedDescription)")
                    
                } else if let response = response as? HTTPURLResponse,let data = data {
                    
                    print("Status code: \(response.statusCode)")
                    
                    let decoder = JSONDecoder()
                    
                    if let photosData = try? decoder.decode([photosData].self, from: data) {
                        
                        DispatchQueue.main.async {

                            if let controller = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondScene")as?SecondScene {
                                
                                controller.photosArray = photosData
                                
                                self.present(controller, animated: true, completion: nil)
                                
                            }
                            
                        }
                        
                    } else {
                        print("Wrong format")
                    }
                }
                
            }.resume()
            
        } else {
            
            print("Invalid URL")
        
        }
    }
    
}

