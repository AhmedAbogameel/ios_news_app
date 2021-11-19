//
//  ViewController.swift
//  news_app
//
//  Created by Jemi on 18/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var newsTable: UITableView!
    
    var newsController = NewsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNewsTable()
        getNews()
    }
    
    private func getNews() {
        DispatchQueue.global().async {
            self.newsController.getNews()
            DispatchQueue.main.sync {
                self.newsTable.reloadData()
                self.newsTable.isHidden = false
                self.loadingIndicator.isHidden = true
            }
        }
    }
    
    private func initNewsTable() {
        newsTable.dataSource = self
        newsTable.delegate = self
//        newsTable.separatorStyle = .none
//        newsTable.showsVerticalScrollIndicator = false
    }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsController.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NewsCard = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCard
        cell.title.text = newsController.news[indexPath.row].title
        cell.loadImage(imageURL: newsController.news[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = .white
        navigate(row: indexPath.row)
    }
    
    private func navigate(row:Int) {
        let details = storyboard?.instantiateViewController(withIdentifier: "detailsView") as! DetailsViewController
        details.newsModel = newsController.news[row]
//        present(details, animated: true, completion: nil)
        navigationController?.pushViewController(details, animated: true)
    }
}

