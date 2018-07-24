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
        NationalPark(name: "Yosemite National Park", state: "California"),
        NationalPark(name: "Sequoia National Park", state: "California"),
        NationalPark(name: "Grand Canyon National Park", state: "Arizona")
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
                        for num in 0...(parksUsed.count - 1) {
                            if(parksUsed[num] != number) {
                                parksUsed.append(number)
                                cell.textLabel?.text = nationalParks[number].name
                            }
                        }
                    } else {
                        parksUsed.append(number)
                        cell.textLabel?.text = nationalParks[number].name
                    }
                }
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
        
        pickerData = ["Alaska", "Arizona", "California"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

