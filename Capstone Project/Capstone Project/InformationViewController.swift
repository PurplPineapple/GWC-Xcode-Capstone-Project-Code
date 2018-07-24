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
    var nationalParks: [NationalPark] = [
        NationalPark(name: "Yosemite National Park",
                     picture: #imageLiteral(resourceName: "Yosemite"),
                     info: "Lyell Glacier is the largest glacier in Yosemite National Park and one of the few remaining in the Sierra Nevada today.  The park has three groves of ancient giant sequoia trees: the Mariposa Grove, Tuolomne Grove, and Merced Grove."),
        NationalPark(name: "Sequoia National Park",
                     picture: #imageLiteral(resourceName: "Sequoia"),
                     info: "Sequoia National Park is a national park in the southern Sierra Nevada east of Visalia, California, in the United States.  It was established on September 25, 1980.  The park is famous for its giant sequoia trees, including the General Sherman tree, the largest tree on Earth."),
        NationalPark(name: "Grand Canyon National Park",
                     picture: #imageLiteral(resourceName: "Grand Canyon"),
                     info: "Unique combinations of geologic color and erosional forms decorate a canyon that is 277 river miles long and up to 18 miles wide.  The Grand Canyon overwhelms the senses through its immense size.")
    ]

        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ExtraInfoViewController {
            vc.nationalPark = nationalPark
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for number in 0...(nationalParks.count - 1) {
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
