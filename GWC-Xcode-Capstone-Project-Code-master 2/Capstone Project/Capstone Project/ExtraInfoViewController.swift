//
//  ExtraInfoViewController.swift
//  Capstone Project
//
//  Created by Crystal Wang on 7/23/18.
//  Copyright © 2018 Crystal Wang. All rights reserved.
//

import UIKit

class ExtraInfoViewController: UIViewController {

    var nationalPark: String = ""
    

    @IBAction func goWebsite(_ sender: Any) {
        if let url = URL(string: "https://github.com/PurplPineapple/GWC-Xcode-Capstone-Project-Code")
        {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PlanViewController {
            vc.nationalPark
                = nationalPark
        } else if let vc = segue.destination as? MapViewController {
            vc.nationalPark = nationalPark
        } else if let vc = segue.destination as? InformationViewController {
            vc.nationalPark = nationalPark
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
