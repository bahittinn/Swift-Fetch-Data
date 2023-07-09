//
//  ViewController.swift
//  Fetch-Search
//
//  Created by Bahittin on 9.07.2023.
//

import UIKit

class ViewController: UIViewController {
    var gelenVeri : [String] = ["saa","sa2"]
    var selectedRow = ""
    var data = [ToDo]()
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
     
     //deneme
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchData(URL: Constants.apiUrl) { result in
            self.data = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
    }
    
//MARK: - Fetch Data From Api
    func fetchData(URL url:String, completion: @escaping ([ToDo]) -> Void) {
        let url = URL(string: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if data != nil && error == nil {
                do {
                    let parsingData = try JSONDecoder().decode([ToDo].self, from: data!)
                    completion(parsingData)
                } catch {
                    print("error: \(error.localizedDescription)")
                }
            }
        }
        dataTask.resume()
    }
}

//MARK: - Table Settings
extension ViewController : UITableViewDelegate,UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return data.count
     }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableCellName, for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = data[indexPath.row].title
        print(selectedRow) 
        performSegue(withIdentifier: Constants.detailSegue, sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.detailSegue {
            let destinationVC = segue.destination as! detailViewController
            destinationVC.anime=selectedRow
        }
    }
}



 


