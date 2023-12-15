//
//  ViewController2.swift
//  LandmarkBook
//
//  Created by Vedat Dokuzkardeş on 9.11.2023.
//

import UIKit

class ViewController2: UIViewController {
    
    
    @IBOutlet weak var LandmarkLbl: UILabel!
    @IBOutlet weak var LandmarkImg: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LandmarkLbl.text = selectedLandmarkName
        LandmarkImg.image = selectedLandmarkImage 

 
    }


}
