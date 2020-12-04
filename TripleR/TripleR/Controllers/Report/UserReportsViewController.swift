//
//  UserReportsViewController.swift
//  TripleR
//
//  Created by William Tsaur on 11/24/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit

class UserReportsViewController: UIViewController {

    @IBOutlet weak var reportsTable: UITableView!
    
    var data: [Report] = []
    
    var selectedReport: Report?
    
    let categoryRowHeight: CGFloat = 80
    
    override func viewWillAppear(_ animated: Bool) {
        print(UIDevice.current.identifierForVendor!.uuidString)
        pullRequest()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reportsTable.delegate = self
        reportsTable.dataSource = self
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func pullRequest() {
        if let url = URL(string: "https://triplerapi.azurewebsites.net/reports?user_id=\(UIDevice.current.identifierForVendor!.uuidString)") {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error as Any)
                    return
                }
                if let safeData = data {
                    self.parseJSON(reportData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(reportData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Reports.self, from: reportData)
            data = decodedData.reports
            DispatchQueue.main.async {
                self.reportsTable.reloadData()
            }
        } catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ViewReportViewController
        vc?.data = selectedReport
    }

}

// MARK: - UITableView Delegate and DataSource

extension UserReportsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return categoryRowHeight
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aReport = data[indexPath.row]
        print("a report:\n\(aReport)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "reportCell", for: indexPath)

        cell.textLabel?.textColor = K.customGray
        cell.textLabel?.font = UIFont(name: "Hiragino Sans W7", size: 15)
        cell.textLabel?.text = aReport.incident.address + " " + aReport.incident.date

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedReport = data[indexPath.row]
        let segueId = "goToReportDetail"
        performSegue(withIdentifier: segueId, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
