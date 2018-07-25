//
//  ViewController.swift
//  Capstone Project
//
//  Created by Crystal Wang on 7/23/18.
//  Copyright © 2018 Crystal Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    struct NationalPark {
        let name: String
        let state: String
    }
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var table: UITableView!
    var pickerData: [String] = [String]()
    var pickedState: String = ""
    var parksUsed: [Int] = [Int]()
    var nationalParks: [NationalPark] = [
        NationalPark(name: "Little River Canyon National Preserve", state: "Alabama"),
        //Alaska_9
        NationalPark(name: "Aniakchak National Monument and Preserve", state: "Alaska"),
        NationalPark(name: "Denali National Park", state: "Alaska"),
        NationalPark(name: "Gates of the Arctic National Park and Preserve", state: "Alaska"),
        NationalPark(name: "Glacier Bay National Park and Preserve", state: "Alaska"),
        NationalPark(name: "Katmai National Park and Preserve", state: "Alaska"),
        NationalPark(name: "Kenai Fjords National Park", state: "Alaska"),
        NationalPark(name: "Kobuk Valley National Park", state: "Alaska"),
        NationalPark(name: "Lake Clark National Park and Preserve", state: "Alaska"),
        NationalPark(name: "Wrangell-St. Elias National Park and Preserve", state: "Alaska"),
        //Arizona_3
        NationalPark(name: "Grand Canyon National Park", state: "Arizona"),
        NationalPark(name: "Petrified Forest National Park", state: "Arizona"),
        NationalPark(name: "Saguaro National Park", state: "Arizona"),
        //Arkansas: 1
        NationalPark(name: "Hot Springs National Park", state: "Arkansas"),
        //California: 4
        NationalPark(name: "Channel Islands National Park", state: "California"),
        NationalPark(name: "Yosemite National Park", state: "California"),
        NationalPark(name: "Sequoia National Park", state: "California"),
        NationalPark(name: "Redwood National and State Parks", state: "California"),
        //Colorado_2
        NationalPark(name: "Rocky Mountain National Park", state: "Colorado"),
        NationalPark(name: "Great Sand Dunes National Park", state: "Colorado"),
        
        NationalPark(name: "Dry Tortugas National Park", state: "Florida"),
        NationalPark(name: "Chattahoochee River National Recreation Area", state: "Georgia"),
        NationalPark(name: "Kalaupapa National Historical Park", state: "Hawaii"),
        NationalPark(name: "Craters of the Moon National Monument and Preserve", state: "Idaho"),
        NationalPark(name: "Indiana Dunes National Lakeshore", state: "Indiana"),
        NationalPark(name: "Poverty Point National Monument", state: "Louisiana"),
        NationalPark(name: "Acadia National Park", state: "Maine"),
        //Michigan
        NationalPark(name: "Sleeping Bear Dunes National Lakeshore", state: "Michigan"),
        NationalPark(name: "Voyageurs National Park", state: "Minnesota"),
        //Montana: 2
        NationalPark(name: "Glacier National Park", state: "Montana"),
        NationalPark(name: "Bighorn Canyon National Recreation Area", state: "Montana"),
        NationalPark(name: "Agate Fossil Beds National Monument", state: "Nebraska"),
        NationalPark(name: "Great Basin National Park", state: "Nevada"),
        NationalPark(name: "Carlsbad Caverns National Park", state: "New Mexico"),
        NationalPark(name: "Cape Hatteras National Seashore", state: "North Carolina"),
        NationalPark(name: "Cuyahoga Valley National Park", state: "Ohio"),
        NationalPark(name: "Crater Lake National Park", state: "Oregon"),
        NationalPark(name: "Congaree National Park", state: "South Carolina"),
        NationalPark(name: "Big Bend National Park", state: "Texas"),
        //Utah: 3
        NationalPark(name: "Zion National Park", state: "Utah"),
        NationalPark(name: "Arches National Park", state: "Utah"),
        NationalPark(name: "Bryce Canyon National Park", state: "Utah"),
        NationalPark(name: "Shenandoah National Park", state: "Virginia"),
        NationalPark(name: "Olympic National Park", state: "Washington"),
        NationalPark(name: "Mount Rainier National Park", state: "Washington"),
        NationalPark(name: "Gauley River National Recreation Area", state: "West Virgina"),
        NationalPark(name: "Apostle Islands National Lakeshore", state: "Wisconsin"),
        NationalPark(name: "Grand Teton National Park", state: "Wyoming")
    ]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedState = pickerData[row]
        parksUsed = [Int]()
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var parkNum: Int = 0
        
        for number in 0...(nationalParks.count - 1) {
            if(nationalParks[number].state == pickedState) {
                parkNum += 1
            }
        }
        return parkNum
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "nationalParkCell", for: indexPath)
        
        cell.textLabel?.text = ""
        for number in 0...(nationalParks.count - 1) {
            if(cell.textLabel?.text == "") {
                if(nationalParks[number].state == pickedState) {
                    if(parksUsed.count > 0) {
                        var flag: Bool = true
                        for num in 0...(parksUsed.count - 1) {
                            if(parksUsed[num] == number) {
                                flag = false
                            }
                        }
                        if(flag){
                            parksUsed.append(number)
                            cell.textLabel?.text = nationalParks[number].name
                        }
                    } else {
                        parksUsed.append(number)
                        cell.textLabel?.text = nationalParks[number].name
                    }
                }
            } else {
                break
            }
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? InformationViewController,
            let indexNum = table.indexPathForSelectedRow?.row {
            vc.nationalPark = nationalParks[parksUsed[indexNum]].name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["Alabama", "Alaska", "Arizona", "California", "Colorado", "Florida", "Georgia", "Hawaii", "Idaho", "Indiana", "Louisiana", "Maine", "Michigan", "Minnesota", "Montana", "Nebraska", "Nevada", "New Mexico", "North Carolina", "Ohio", "Oregon", "South Carolina", "Texas", "Utah", "Virginia", "Washington", "West Virgina", "Wisconsin", "Wyoming"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

