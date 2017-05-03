//
//  ViewController.swift
//  QA_App
//
//  Created by john john on 2017/5/1.
//  Copyright © 2017年 John. All rights reserved.
//

import UIKit

var nameAry = ["monkey","cat","dog","elephant","dolphin","shrimp","crab","shark","octopus","eagle","zebra","human","ant","butterfly","crocodile","reevesi","elk","alpaca","frog","mice","reindeer"]

var n = Int(arc4random()) % nameAry.count
var i = Int(arc4random()) % 3 + 1

var numberAry = [n,(n + i) % nameAry.count,Int(sqrt(Double((n - i)*(n - i)))) % nameAry.count,(n + 2 * i) % nameAry.count]

var A = nameAry[numberAry[0]]
var B = nameAry[numberAry[1]]
var C = nameAry[numberAry[2]]
var D = nameAry[numberAry[3]]

var answerAry = [A,B,C,D]

var answer = "\(answerAry[Int(arc4random()) % answerAry.count])"

var sum = 1
var correct = 0

class mainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Let's guess"
        
        self.view.backgroundColor = UIColor(red: 234/255, green: 178/255, blue: 207/255, alpha: 1)
        
        self.view.addSubview(name1)
        self.view.addSubview(name2)
        self.view.addSubview(name3)
        self.view.addSubview(name4)
        self.view.addSubview(photo)
        self.view.addSubview(number)
        self.view.addSubview(answerNumber)
        
        setupBtn()
        setupPhoto()
        setupNumberAndCount()
        
        name1.setTitle(A, for: .normal)
        name2.setTitle(B, for: .normal)
        name3.setTitle(C, for: .normal)
        name4.setTitle(D, for: .normal)
        photo.image = UIImage(named: answer)

    }
    
    let photo: UIImageView = {
        let pv = UIImageView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.contentMode = .scaleAspectFill
        pv.layer.masksToBounds = true
        return pv
    }()
    
    func setupPhoto() {
        photo.bottomAnchor.constraint(equalTo: name4.topAnchor, constant: -25).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 250).isActive = true
        photo.widthAnchor.constraint(equalToConstant: 250).isActive = true
        photo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    let name1: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(pushAnswer1), for: .touchUpInside)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        return btn
    }()
    
    let name2: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(pushAnswer2), for: .touchUpInside)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        return btn
    }()
    
    let name3: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(pushAnswer3), for: .touchUpInside)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        return btn
    }()
    
    let name4: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(pushAnswer4), for: .touchUpInside)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        return btn
    }()
    
    let number: UILabel = {
        let nl = UILabel()
        nl.text = "第\(sum)題"
        nl.font = UIFont.boldSystemFont(ofSize: 20)
        nl.textColor = UIColor.white
        nl.translatesAutoresizingMaskIntoConstraints = false
        return nl
    }()
    
    let answerNumber: UILabel = {
        let nl = UILabel()
        nl.text = "答對 : \(correct)"
        nl.font = UIFont.boldSystemFont(ofSize: 20)
        nl.textColor = UIColor.white
        nl.translatesAutoresizingMaskIntoConstraints = false
        return nl
    }()
    
    //setting summary
    func setupNumberAndCount() {
        number.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        number.widthAnchor.constraint(equalToConstant: 80).isActive = true
        number.bottomAnchor.constraint(equalTo: photo.topAnchor, constant: -28).isActive = true
        number.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        answerNumber.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        answerNumber.widthAnchor.constraint(equalToConstant: 90).isActive = true
        answerNumber.bottomAnchor.constraint(equalTo: photo.topAnchor, constant: -28).isActive = true
        answerNumber.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    //btn1's action
    func pushAnswer1() {
        
        if name1.titleLabel?.text == answer
        {
          if correct <= 20 {
            
                correct += 1
                
                answerNumber.text = "答對 : \(correct)"
            }
        }
        nextQuestion()
    }
    
    //btn2's action
    func pushAnswer2() {
        
        if name2.titleLabel?.text == answer
        {
            if correct <= 20 {
                
                correct += 1
                
                answerNumber.text = "答對 : \(correct)"
            }
        }
        nextQuestion()
    }
    
    //btn3's action
    func pushAnswer3() {
        
        if name3.titleLabel?.text == answer
        {
            if correct <= 20 {
                
                correct += 1
                
                answerNumber.text = "答對 : \(correct)"
            }
        }
        nextQuestion()
    }
    
    //btn4's action
    func pushAnswer4() {
        
        if name4.titleLabel?.text == answer
        {
            if correct <= 20 {
                
                correct += 1
                
                answerNumber.text = "答對 : \(correct)"
            }
        }
        nextQuestion()
    }
    
    func nextQuestion() {
        
        sum += 1
        
        if sum <= 20
        {
            initialQuestion()
            
            self.number.text = "第\(sum)題"
        }
        
        else if sum == 21 {
            let alert = UIAlertController(title: "測驗結束", message: "一共答對\(correct)題，答對率\((Float(correct) / 20.0) * 100)%", preferredStyle: .alert)
            let btn1 = UIAlertAction(title: "再玩一次", style: .default, handler: { (btn1) in
                
                self.initialQuestion()
                
                sum = 1
                correct = 0
                
                self.answerNumber.text = "答對 : \(correct)"
                self.number.text = "第\(sum)題"
                
            })
            let btn2 = UIAlertAction(title: "結束", style: .default, handler: { (btn2) in
                
            })
            alert.addAction(btn1)
            alert.addAction(btn2)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func initialQuestion() {
        
        let a = Int(arc4random()) % (nameAry.count - 2) + 2
        let b = Int(arc4random()) % 3 + 1
        
        n = a
        i = b
        
        numberAry = [n,(n + i) % nameAry.count,Int(sqrt(Double((n - i)*(n - i)))) % nameAry.count,(n + 2 * i) % nameAry.count]
        
        A = nameAry[numberAry[0]]
        B = nameAry[numberAry[1]]
        C = nameAry[numberAry[2]]
        D = nameAry[numberAry[3]]
        
        answerAry = [A,B,C,D]
        
        answer = "\(answerAry[Int(arc4random()) % answerAry.count])"
        
        self.name1.setTitle(A, for: .normal)
        self.name2.setTitle(B, for: .normal)
        self.name3.setTitle(C, for: .normal)
        self.name4.setTitle(D, for: .normal)
        self.photo.image = UIImage(named: answer)
    }
    
    // setting button
    func setupBtn() {
        
        name1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        name1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        name1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        name1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        name2.bottomAnchor.constraint(equalTo: name1.topAnchor, constant: -20).isActive = true
        name2.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        name2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        name2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        name3.bottomAnchor.constraint(equalTo: name2.topAnchor, constant: -20).isActive = true
        name3.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        name3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        name3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        name4.bottomAnchor.constraint(equalTo: name3.topAnchor, constant: -20).isActive = true
        name4.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        name4.heightAnchor.constraint(equalToConstant: 40).isActive = true
        name4.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
}

