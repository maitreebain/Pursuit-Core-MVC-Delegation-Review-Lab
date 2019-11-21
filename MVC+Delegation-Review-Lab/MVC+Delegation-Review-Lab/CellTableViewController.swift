//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class CellTableView: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var currentFont: CGFloat = 12 {
        didSet {
            tableView.reloadData()
        }
    }
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        movies = Movie.allMovies
    }

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard let tableViewFont = segue.source as? TableViewFontViewController else {
            fatalError("can't find segue")
        }
        
        currentFont = tableViewFont.currentFont ?? 12
        
    }

}

extension CellTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        let movie = movies[indexPath.row]
        
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = String(movie.year)

        cell.textLabel?.font = cell.textLabel!.font.withSize(currentFont)
        cell.detailTextLabel?.font = cell.textLabel!.font.withSize(currentFont)
        
        
        return cell
    }
}
