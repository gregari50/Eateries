//
//  EatariesTableViewController.swift
//  Eateries
//
//  Created by Бойко Григорий on 25/04/2020.
//  Copyright © 2020 Бойко Григорий. All rights reserved.
//

import UIKit

class EateriesTableViewController: UITableViewController {

    var restaurants: [Restaurant] = [
    Restaurant(name: "Ogonёk Grill&Bar", type: "ресторан", location: "Уфа залупасранская 4е sadsssssssssssadasdsadasdsadasd asd asd sad as dasd", image: "ogonek.jpg", isVisited: false),
    Restaurant(name: "Елу", type: "ресторан", location: "Уфа", image: "elu.jpg", isVisited: false),
    Restaurant(name: "Bonsai", type: "ресторан", location: "Уфа", image: "bonsai.jpg", isVisited: false),
    Restaurant(name: "Дастархан", type: "ресторан", location: "Уфа", image: "dastarhan.jpg", isVisited: false),
    Restaurant(name: "Индокитай", type: "ресторан", location: "Уфа", image: "indokitay.jpg", isVisited: false),
    Restaurant(name: "X.O", type: "ресторан-клуб", location: "Уфа", image: "x.o.jpg", isVisited: false),
    Restaurant(name: "Балкан Гриль", type: "ресторан", location: "Уфа", image: "balkan.jpg", isVisited: false),
    Restaurant(name: "Respublica", type: "ресторан", location: "Уфа", image: "respublika.jpg", isVisited: false),
    Restaurant(name: "Speak Easy", type: "ресторанный комплекс", location: "Уфа", image: "speakeasy.jpg", isVisited: false),
    Restaurant(name: "Morris Pub", type: "ресторан", location: "Уфа", image: "morris.jpg", isVisited: false),
    Restaurant(name: "Вкусные истории", type: "ресторан", location: "Уфа", image: "istorii.jpg", isVisited: false),
    Restaurant(name: "Классик", type: "ресторан", location: "Уфа", image: "klassik.jpg", isVisited: false),
    Restaurant(name: "Love&Life", type: "ресторан", location: "Уфа", image: "love.jpg", isVisited: false),
    Restaurant(name: "Шок", type: "ресторан", location: "Уфа", image: "shok.jpg", isVisited: false),
    Restaurant(name: "Бочка", type: "ресторан", location:  "Уфа", image: "bochka.jpg", isVisited: false)]
    
    //До того как загрузится
    override func viewWillAppear(_ animated: Bool) {
        //отключаем скрытие бара
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Растягиваем ячейку по содержимому
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableView.automaticDimension
        //Настраиваем кнопку назад
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Обратно", style: .plain, target: nil, action: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //кол-во рядов
        return restaurants.count
    }

    //Создаем ячейку, которая переиспользуется
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        // as — приводим UITableViewCell к EateriesTableViewCell (который наследуется)
        
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        
        //Закругление картинки
        cell.thumbnailImageView.layer.cornerRadius = 32.5
        cell.thumbnailImageView.clipsToBounds = true
        
        //Чтоб не было проблем с галочками
        cell.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    }
    
    //Что делать, когда выделили ячейку
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //сообщение
        //AlertController в котором есть различные действия
        let ac = UIAlertController(title: nil, message: "Выберите действие", preferredStyle: .actionSheet)
        // 1 действие
        let call = UIAlertAction(title: "+7 999 999 99 9\(indexPath.row)", style: .default) {
            // handler = closure, что делать по нажатию
            (action : UIAlertAction) -> Void in
            let ac1 = UIAlertController(title: nil, message: "Позвонить невозможно", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            ac1.addAction(ok)
            self.present(ac1, animated: true, completion: nil)
        }
        // 2 действие
        let isVisitedTitle = self.restuarantIsVisited[indexPath.row] ? "Я не был здесь" : "Я здесь был"
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        // 3 действие
        let isVisited = UIAlertAction(title: isVisitedTitle, style: .default) { action in
            self.restuarantIsVisited[indexPath.row] = !self.restuarantIsVisited[indexPath.row]
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = self.restuarantIsVisited[indexPath.row] ? .checkmark : .none
        }
        ac.addAction(cancel)
        ac.addAction(call)
        ac.addAction(isVisited)
        //показать
        present(ac, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }*/
    
    /* стандартный свайп
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.restaurantImages.remove(at: indexPath.row)
            self.restaurantNames.remove(at: indexPath.row)
            self.restuarantIsVisited.remove(at: indexPath.row)
        }
        //tableView.reloadData()
        //Красиво удаляем
        tableView.deleteRows(at: [indexPath], with: .fade)
    }*/

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { (action, view, success) in
            self.restaurants.remove(at: indexPath.row)
            //Красиво удаляем
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let share = UIContextualAction(style: .destructive, title: "Поделиться") { (action, view, success) in
            let defaultText = "Я сейчас в " + self.restaurants[indexPath.row].name
            if let image = UIImage(named: self.restaurants[indexPath.row].image){
                let ac = UIActivityViewController(activityItems: [defaultText, image], applicationActivities: nil)
                self.present(ac, animated: true, completion: nil)
                
            }
        }
        share.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return UISwipeActionsConfiguration(actions: [deleteAction, share])
    }
    
    //Переход на другой экран
    //По нажатию на ячейку
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let dvc = segue.destination as! EateryDetailViewController
                dvc.restaurant = restaurants[indexPath.row]
            }
        }
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
