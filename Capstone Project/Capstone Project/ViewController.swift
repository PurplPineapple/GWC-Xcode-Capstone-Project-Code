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
    var nationalParks: [NationalPark] = [
        NationalPark(name: "Yosemite National Park", state: "California"),
        NationalPark(name: "Sequoia National Park", state: "California")
    ]
    var selectedNationalPark: String = ""
    var selectedState: String = ""
    
    @IBAction func searchParks(_ sender: Any) {
        table.reloadData()
    }
    
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
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nationalParks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "nationalParkCell", for: indexPath)
        if(pickedState == nationalParks[indexPath.row].state){
            cell.textLabel?.text = nationalParks[indexPath.row].name
        } else {
            cell.textLabel?.text = ""
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNationalPark = nationalParks[indexPath.row].name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? InformationViewController {
            vc.nationalPark = selectedNationalPark
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

