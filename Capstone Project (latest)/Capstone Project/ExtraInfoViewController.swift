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
        //Alabama
        Park(name: "Little River Canyon National Preserve",
             website: "https://www.nps.gov/liri/index.htm",
             phoneNum: "2568459605"),
        //Alaska: 9
        Park(name: "Aniakchak National Monument and Preserve",
             website: "https://www.nps.gov/ania/index.htm",
             phoneNum: "9072463305"),
        Park(name: "Denali National Park",
             website: "https://www.nps.gov/dena/index.htm",
             phoneNum: "9076839532"),
        Park(name: "Gates of the Arctic National Park and Preserve",
             website: "https://www.nps.gov/gaar/index.htm",
             phoneNum: "9076925494"),
        Park(name: "Glacier Bay National Park and Preserve",
             website: "https://www.nps.gov/glba/index.htm",
             phoneNum: "9076972230"),
        Park(name: "Katmai National Park and Preserve",
             website: "https://www.nps.gov/katm/index.htm",
             phoneNum: "9072463305"),
        Park(name: "Kenai Fjords National Park",
             website: "https://www.nps.gov/kefj/index.htm",
             phoneNum: "9074220500"),
        Park(name: "Kobuk Valley National Park",
             website: "https://www.nps.gov/kova/index.htm",
             phoneNum: "9074423890"),
        Park(name: "Lake Clark National Park and Preserve",
             website: "https://www.nps.gov/lacl/index.htm",
             phoneNum: "9077812218"),
        Park(name: "Wrangell-St. Elias National Park and Preserve",
             website: "https://www.nps.gov/wrst/index.htm",
             phoneNum: "9078225234"),
        //Arizona: 3
        Park(name: "Grand Canyon National Park",
             website: "https://www.nps.gov/grca/index.htm",
             phoneNum: "9286387888"),
        Park(name: "Petrified Forest National Park",
             website: "https://www.nps.gov/pefo/index.htm",
             phoneNum: "9285246228"),
        Park(name: "Saguaro National Park",
             website: "https://www.nps.gov/sagu/index.htm",
             phoneNum: "5207335153"),
        //Arkansas: 1
        Park(name: "Hot Springs National Park",
             website: "https://www.nps.gov/hosp/index.htm",
             phoneNum: "5016206715"),
        //California: 4
        Park(name: "Channel Islands National Park",
             website: "https://www.nps.gov/chis/index.htm",
             phoneNum: "8056585730"),
        Park(name: "Yosemite National Park",
             website: "https://www.nps.gov/yose/index.htm",
             phoneNum: "2093720200"),
        Park(name: "Sequoia National Park",
             website: "https://www.nps.gov/seki/index.htm",
             phoneNum: "5595653341"),
        Park(name: "Redwood National and State Parks",
             website: "https://www.nps.gov/redw/index.htm",
             phoneNum: "7074657335"),
        //Colorado: 2
        Park(name: "Rocky Mountain National Park",
             website: "https://www.nps.gov/romo/index.htm",
             phoneNum: "9705861206"),
        Park(name: "Great Sand Dunes National Park",
             website: "https://www.nps.gov/grsa/index.htm",
             phoneNum: "7193786395"),
        //Florida: 1
        Park(name: "Dry Tortugas National Park",
             website: "https://www.nps.gov/drto/index.htm",
             phoneNum: "3052427700"),
        //Georgia: 1
        Park(name: "Chattahoochee River National Recreation Area",
             website: "https://www.nps.gov/chat/index.htm",
             phoneNum: "6785381200"),
        //Hawaii: 1
        Park(name: "Kalaupapa National Historical Park",
             website: "https://www.nps.gov/kala/index.htm",
             phoneNum: "8085676802"),
        //Idaho: 1
        Park(name: "Craters of the Moon National Monument and Preserve",
             website: "https://www.nps.gov/crmo/index.htm",
             phoneNum: "2085271300"),
        //Indiana: 1
        Park(name: "Indiana Dunes National Lakeshore",
             website: "https://www.nps.gov/indu/index.htm",
             phoneNum: "2193951882"),
        //Louisiana: 1
        Park(name: "Poverty Point National Monument",
             website: "https://www.nps.gov/popo/index.htm",
             phoneNum: "3189265492"),
        //Maine: 1
        Park(name: "Acadia National Park",
             website: "https://www.nps.gov/acad/index.htm",
             phoneNum: "2072883338"),
        //Michigan: 1
        Park(name: "Sleeping Bear Dunes National Lakeshore",
             website: "https://www.nps.gov/slbe/index.htm",
             phoneNum: "2313264700"),
        //Minnesota: 1
        Park(name: "Voyageurs National Park",
             website: "https://www.nps.gov/voya/index.htm",
             phoneNum: "2182836600"),
        //Montanna: 2
        Park(name: "Glacier National Park",
             website: "https://www.nps.gov/glac/index.htm",
             phoneNum: "4068887800"),
        Park(name: "Bighorn Canyon National Recreation Area",
             website: "https://www.nps.gov/bica/index.htm",
             phoneNum: "3075485406"),
        //Nebraska: 1
        Park(name: "Agate Fossil Beds National Monument",
             website: "https://www.nps.gov/agfo/index.htm",
             phoneNum: "3086654113"),
        //Nevada: 1
        Park(name: "Great Basin National Park",
             website: "https://www.nps.gov/grba/index.htm",
             phoneNum: "7752347331"),
        //New Mexico: 1
        Park(name: "Carlsbad Caverns National Park",
             website: "https://www.nps.gov/cave/index.htm",
             phoneNum: "5757852232"),
        //North Carolina: 1
        Park(name: "Cape Hatteras National Seashore",
             website: "https://www.nps.gov/caha/index.htm",
             phoneNum: "2524732111"),
        //Ohio: 1
        Park(name: "Cuyahoga Valley National Park",
             website: "https://www.nps.gov/cuva/index.htm",
             phoneNum: "3306572752"),
        //Oregon: 1
        Park(name: "Crater Lake National Park",
             website: "https://www.nps.gov/crla/index.htm",
             phoneNum: "5415943000"),
        //South Carolina: 1
        Park(name: "Congaree National Park",
             website: "https://www.nps.gov/cong/index.htm",
             phoneNum: "8037764396"),
        //Texas: 1
        Park(name: "Big Bend National Park",
             website: "https://www.nps.gov/bibe/index.htm",
             phoneNum: "4324772251"),
        //Utah: 3
        Park(name: "Zion National Park",
             website: "https://www.nps.gov/zion/index.htm",
             phoneNum: "4357723256"),
        Park(name: "Arches National Park",
             website: "https://www.nps.gov/arch/index.htm",
             phoneNum: "435719-2299"),
        Park(name: "Bryce Canyon National Park",
             website: "https://www.nps.gov/brca/index.htm",
             phoneNum: "4358345322"),
        //Virginia: 1
        Park(name: "Shenandoah National Park",
             website: "https://www.nps.gov/shen/index.htm",
             phoneNum: "5409993500"),
        //Washington: 2
        Park(name: "Olympic National Park",
             website: "https://www.nps.gov/olym/index.htm",
             phoneNum: "3605653130"),
        Park(name: "Mount Rainier National Park",
             website: "https://www.nps.gov/mora/index.htm",
             phoneNum: "3605692211"),
        //West Virginia: 1
        Park(name: "Gauley River National Recreation Area",
             website: "https://www.nps.gov/gari/index.htm",
             phoneNum: "3044650508"),
        //Wisconsin: 1
        Park(name: "Apostle Islands National Lakeshore",
             website: "https://www.nps.gov/apis/index.htm",
             phoneNum: "7157793397"),
        //Wyoning: 1
        Park(name: "Grand Teton National Park",
             website: "https://www.nps.gov/grte/index.htm",
             phoneNum: "3077393399"),
        // My fingers are numb and my hands are shaking but I finally did it. I've reached the end

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
