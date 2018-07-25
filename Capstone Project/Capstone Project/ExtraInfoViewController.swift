//
//  ExtraInfoViewController.swift
//  Capstone Project
//
//  Created by Crystal Wang on 7/23/18.
//  Copyright © 2018 Crystal Wang. All rights reserved.
//

import UIKit
import CallKit

class ExtraInfoViewController: UIViewController, CXProviderDelegate {

    struct Park {
        let name: String
        let website: String
        let phoneNum: String
    }
    
    var nationalPark: String = ""
    let uuid = UUID()
    var handle: CXHandle = CXHandle(type: .phoneNumber, value: "5555555555")
    var callController: CXCallController = CXCallController()
    var parkNum = 0
    var parks: [Park] = [
        Park(name: "Yosemite National Park",
             website: "https://www.nps.gov/yose/index.htm",
             phoneNum: "2093720200"),
        Park(name: "Sequoia National Park",
             website: "https://www.nps.gov/seki/index.htm",
             phoneNum: "5595653341"),
        Park(name: "Grand Canyon National Park",
             website: "https://www.nps.gov/grca/index.htm",
             phoneNum: "9286387888")
    ]

    @IBAction func goWebsite(_ sender: Any) {
        if let url = URL(string: parks[parkNum].website)
        {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func callNumber(_ sender: Any) {
        let startCallAction = CXStartCallAction(call: uuid, handle: CXHandle(type: .generic, value: "A Name"))
        
        let transaction = CXTransaction(action: startCallAction)
        callController.request(transaction) { error in
            if let error = error {
                print("Error requesting transaction:  \(error)")
            } else {
                print("Requested transaction successfully")
            }
        }
    }
    
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        action.fulfill()
    }
    
    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        action.fulfill()
    }
    
    func providerDidReset(_ provider: CXProvider) {
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
        for number in 0...(parks.count - 1) {
            if(parks[number].name == nationalPark) {
                parkNum = number
            }
        }
        
        handle = CXHandle(type: .phoneNumber, value: parks[parkNum].phoneNum)
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
