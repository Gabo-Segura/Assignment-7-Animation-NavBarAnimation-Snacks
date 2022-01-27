//
//  ViewController.swift
//  Assignment7Animation
//
//  Created by Gabo on 1/24/22.
//  Copyright © 2022 Gabo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //@IBOutlet weak var topMenuBar: NSLayoutConstraint!
    @IBOutlet weak var topMenuBar: UIView!
    @IBOutlet weak var viewTopMenu: UIView!
    @IBOutlet weak var plusTopMenu: UIButton!
    
    var flowHeightConstraint: NSLayoutConstraint?
    var oreos = UIImageView()
    var pizzaPockets = UIImageView()
    var popTarts = UIImageView()
    var popsicle = UIImageView()
    var ramen = UIImageView()
    var stackViewElements = UIStackView()
    var label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // top menu bar
        //topMenuBar.constant = 80
        //topMenu.isActive = true
        
        
        // snacks title
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 190, y: 40)
        label.textAlignment = .center
        label.text = "SNACKS"
        label.isHidden = true
        self.view.addSubview(label)
        
        
        // oreos image
        let oreosImage: UIImage = UIImage(named: "oreos")!
        oreos = UIImageView(image: oreosImage)
        let oreoTapAdd = UITapGestureRecognizer(target: self, action: #selector(ViewController.oreoTapAdd))
        oreos.addGestureRecognizer(oreoTapAdd)
        oreos.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            oreos.widthAnchor.constraint(equalToConstant: CGFloat(80)),
            oreos.heightAnchor.constraint(equalToConstant: CGFloat(40))
        ])
        
        
        // pizza pockets image
        let pizzaPocketsImage: UIImage = UIImage(named: "pizza_pockets")!
        pizzaPockets = UIImageView(image: pizzaPocketsImage)
        let pizzaPocketsTapAdd = UITapGestureRecognizer(target: self, action: #selector(ViewController.pizzaPocketsTapAdd))
        pizzaPockets.addGestureRecognizer(pizzaPocketsTapAdd)
        pizzaPockets.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            pizzaPockets.widthAnchor.constraint(equalToConstant: CGFloat(80)),
            pizzaPockets.heightAnchor.constraint(equalToConstant: CGFloat(40))
            ])
        
        
        // pop tarts image
        let popTartsImage: UIImage = UIImage(named: "pop_tarts")!
        popTarts = UIImageView(image: popTartsImage)
        let popTartsTapAdd = UITapGestureRecognizer(target: self, action: #selector(ViewController.popTartsTapAdd))
        popTarts.addGestureRecognizer(popTartsTapAdd)
        popTarts.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            popTarts.widthAnchor.constraint(equalToConstant: CGFloat(80)),
            popTarts.heightAnchor.constraint(equalToConstant: CGFloat(40))
            ])
        
        
        // popsicle image
        let popsicleImage: UIImage = UIImage(named: "popsicle")!
        popsicle = UIImageView(image: popsicleImage)
        let popsicleTapAdd = UITapGestureRecognizer(target: self, action: #selector(ViewController.popsicleTapAdd))
        popsicle.addGestureRecognizer(popsicleTapAdd)
        popsicle.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            popTarts.widthAnchor.constraint(equalToConstant: CGFloat(80)),
            popTarts.heightAnchor.constraint(equalToConstant: CGFloat(40))
            ])
        
        
        // ramen image
        let ramenImage: UIImage = UIImage(named: "ramen")!
        ramen = UIImageView(image: ramenImage)
        let ramenTapAdd = UITapGestureRecognizer(target: self, action: #selector(ViewController.ramenTapAdd))
        ramen.addGestureRecognizer(ramenTapAdd)
        ramen.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            popTarts.widthAnchor.constraint(equalToConstant: CGFloat(80)),
            popTarts.heightAnchor.constraint(equalToConstant: CGFloat(40))
            ])
        
        
        // stackview
        stackViewElements = UIStackView(arrangedSubviews: [
            oreos,
            pizzaPockets,
            popTarts,
            popsicle,
            ramen
        ])
        
        stackViewElements.axis = .horizontal
        stackViewElements.distribution = .fillEqually
        stackViewElements.alignment = .fill
        stackViewElements.alignment = .bottom
        stackViewElements.spacing = 20
        stackViewElements.translatesAutoresizingMaskIntoConstraints = false
        stackViewElements.isHidden = true
        view.addSubview(stackViewElements)
        
        NSLayoutConstraint.activate([
            stackViewElements.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            stackViewElements.heightAnchor.constraint(equalToConstant: 80),
            //stackViewElements.bottomAnchor.constraint(equalTo: topMenuBar.bottomAnchor, constant: -5),
        ])
        
        
        // tableView
        self.tableViewContainer.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableViewContainer.dataSource = self as UITableViewDataSource
        self.tableViewContainer.delegate = self as UITableViewDelegate
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var close = true
    
    @IBAction func openMenu(_ sender: Any) {
        print("plus icon pressed")
        
        if close {
            UIView.animate(
                withDuration: 0.5,
                delay: 0.0,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0.5,
                options: .curveEaseInOut,
                animations: {
                    self.view.layoutIfNeeded()
                    self.tableViewContainer.transform = CGAffineTransform(translationX: 0, y: 120)
                    self.plusTopMenu.transform = CGAffineTransform(rotationAngle: 40)
                    self.stackViewElements.transform = CGAffineTransform(translationX: 0, y: 100)
                    self.stackViewElements.isHidden = false
                    self.label.isHidden = false
            })
        } else{
            UIView.animate(
                withDuration: 0.5,
                delay: 0.0,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0.5,
                options: .curveEaseInOut,
                animations: {
                    self.view.layoutIfNeeded()
                    self.plusTopMenu.transform = CGAffineTransform(rotationAngle: 0)
                    self.plusTopMenu.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    self.tableViewContainer.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.stackViewElements.isHidden = true
                    self.label.isHidden = true
            })
        }
        
        self.close = !close
        
    }
    
    
    // array of elements + display in tableView
    @IBOutlet weak var tableViewContainer: UITableView!
    var food: [String] = []
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewContainer.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel!.text = self.food[indexPath.row]
        self.tableViewContainer.reloadRows(at: [indexPath], with: .fade)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(food[indexPath.row])
        self.tableViewContainer.reloadRows(at: [indexPath], with: .fade)
    }
    
    func tableViewUpdateEverything(){
        tableViewContainer.beginUpdates()
        tableViewContainer.insertRows(at: [
            (NSIndexPath(row: food.count-1, section: 0) as IndexPath)], with: .automatic)
        tableViewContainer.endUpdates()
        print(food)
    }
    
    // Image tap functions
    @objc func oreoTapAdd(_ recognizer: UIGestureRecognizer){
        print("Oreo Click")
        food.append("Oreo")
        tableViewUpdateEverything()
    }
    
    @objc func pizzaPocketsTapAdd(_ recognizer: UIGestureRecognizer){
        print("Pizza Pockets Click")
        food.append("Pizza Pockets")
        tableViewUpdateEverything()
    }
    
    @objc func popTartsTapAdd(_ recognizer: UIGestureRecognizer){
        print("Pop Tarts Click")
        food.append("Pop Tarts")
        tableViewUpdateEverything()
    }
    
    @objc func popsicleTapAdd(_ recognizer: UIGestureRecognizer){
        print("Popsicle Click")
        food.append("Popsicle")
        tableViewUpdateEverything()
    }
    
    @objc func ramenTapAdd(_ recognizer: UIGestureRecognizer){
        print("Ramen Click")
        food.append("Ramen")
        tableViewUpdateEverything()
    }
    
    
}

