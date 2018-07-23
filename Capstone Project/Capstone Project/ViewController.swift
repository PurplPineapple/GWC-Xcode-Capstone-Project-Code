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
    @IBOutlet weak var tableView: UITableView!
    var pickerData: [String] = [String]()
    var pickedState: String = ""
    var nationalParks: [NationalPark] = [
        NationalPark(name: "Yosemite National Park", state: "California"),
        NationalPark(name: "Sequoia National Park", state: "California")
    ]
    var selectedNationalPark: String = ""
    var selectedState: String = ""
    
    @IBAction func searchParks(_ sender: Any) {
        tableView.reloadData()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickedState = pickerData[row]
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var parksInState: Int = 0
        
        for number in 1...nationalParks.count {
            if(nationalParks[number].state == pickedState) {
                parksInState += 1
            }
        }
        
        return parksInState
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nationalParkCell", for: indexPath)
        print(pickedState)
        if(pickedState == "California") {
            cell.textLabel?.text = nationalParks[indexPath.row].name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNationalPark = nationalParks[indexPath.row].name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? InformationViewController {
            vc.nationalPark = selectedNationalPark
            vc.state = pickedState
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["Alaska", "California"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

