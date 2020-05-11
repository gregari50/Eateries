//
//  EateryDetailViewController.swift
//  Eateries
//
//  Created by Бойко Григорий on 06/05/2020.
//  Copyright © 2020 Бойко Григорий. All rights reserved.
//

import UIKit

class EateryDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    var restaurant: Restaurant!
    
    //До того как загрузится
    override func viewWillAppear(_ animated: Bool) {
        //отключаем скрытие бара по свайпу
        navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Высота ячейки
        tableView.estimatedRowHeight = 58
        //Автоматическое определение высоты
        tableView.rowHeight = UITableView.automaticDimension
        
        imageView.image = UIImage(named: restaurant.image)
        
        rateButton.layer.cornerRadius = 5
        rateButton.layer.borderWidth = 1
        rateButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //Убираем полоски внизу
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        //Название в UINavigation
        title = restaurant.name
        
        //        //цвет таблицы
        //        tableView.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        //        //цвет разделителей
        //        tableView.separatorColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        //
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    //Создаем ячейку, которая переиспользуется
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateryDetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Название"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.keyLabel.text = "Тип"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.keyLabel.text = "Адрес"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.keyLabel.text = "Я там был?"
            cell.valueLabel.text = restaurant.isVisited ? "Да" : "Нет"
        default:
            cell.keyLabel.text = ""
            cell.valueLabel.text = ""
        }
        //слиятия фона ячейки с фоном таблицы
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    //Ячейка после нажатия
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Убираем выделение
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
