//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Vedat Dokuzkardeş on 9.11.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImg = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("zeus")
        landmarkNames.append("artemis")
        landmarkNames.append("babil")
        landmarkNames.append("halikarnas")
        landmarkNames.append("iskenderiye")
        landmarkNames.append("keops")
        landmarkNames.append("rodos")
        
        landmarkImages.append(UIImage(named: "zeus")!)
        landmarkImages.append(UIImage(named: "artemis")!)
        landmarkImages.append(UIImage(named: "babil")!)
        landmarkImages.append(UIImage(named: "halikarnas")!)
        landmarkImages.append(UIImage(named: "iskenderiye")!)
        landmarkImages.append(UIImage(named: "keops")!)
        landmarkImages.append(UIImage(named: "rodos")!)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test"
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImg = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "VC2", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VC2" {
            let destinationVC = segue.destination as! ViewController2
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImg
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}

