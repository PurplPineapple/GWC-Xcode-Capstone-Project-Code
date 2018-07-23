//
//  PlanViewController.swift
//  Capstone Project
//
//  Created by Crystal Wang on 7/23/18.
//  Copyright © 2018 Crystal Wang. All rights reserved.
//

import UIKit

class PlanViewController: UIViewController {

    var nationalPark: String = ""
    var state: String = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddPlanViewController {
            vc.nationalPark = nationalPark
            vc.state = state
        } else if let vc = segue.destination as? ExtraInfoViewController {
            vc.nationalPark = nationalPark
            vc.state = state
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
