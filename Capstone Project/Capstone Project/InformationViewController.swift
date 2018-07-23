//
//  InformationViewController.swift
//  Capstone Project
//
//  Created by Crystal Wang on 7/23/18.
//  Copyright © 2018 Crystal Wang. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    struct NationalPark {
        let name: String
        let picture: UIImage
        let info: String
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    var nationalPark: String = ""
    var state = ""
    var nationalParks: [NationalPark] = [
        NationalPark(name: "Yosemite National Park",
                     picture: <#T##UIImage#>,
                     info: "Yo"),
        NationalPark(name: "Sequioa National Park",
                     picture: <#T##UIImage#>,
                     info: "Hey")
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ExtraInfoViewController {
            vc.nationalPark = nationalPark
            vc.state = state
        } else if let vc = segue.destination as? ViewController {
            vc.selectedState = state
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for number in 1...nationalParks.count {
            if(nationalParks[number].name == nationalPark) {
                imageView.image = nationalParks[number].picture
                textView.text = nationalParks[number].info
            }
        }
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
