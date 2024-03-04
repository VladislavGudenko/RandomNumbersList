//
//  ViewController.swift
//  RandomNumbersList
//
//  Created by Владислав Гуденко on 01.03.2024.
//

import UIKit
import SnapKit

// Без архитектуры - тут один экран и больше ничего
class MainViewController: UIViewController {
    
    let verticalTableView = UITableView()
    var timer: Timer?
    var data = [[Int]]()
    var scrollsPosition: [IndexPath] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        defer {
            data = generateRandomData()
            scrollsPosition =  Array(repeating: IndexPath(item: 0,
                                                          section: 0),
                                     count: data.count)
        }
        setupTableView()
        startTimer()
    }

    @objc func timerTick() {
        updateRandomdata()
        verticalTableView.reloadData()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(verticalTableView)
        verticalTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupTableView() {
        verticalTableView.delegate = self
        verticalTableView.dataSource = self
        verticalTableView.register(VerticalTableViewCell.self,
                                   forCellReuseIdentifier: "VerticalCell")
        verticalTableView.separatorStyle = .none
    }

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timerTick),
                                     userInfo: nil,
                                     repeats: true)
        RunLoop.current.add(timer!, forMode: .common)
    }

    func generateRandomData() -> [[Int]] {
        let numberOfRows = Int.random(in: 100...1000)
        for _ in 0..<numberOfRows {
            var row = [Int]()
            let numberOfCells = Int.random(in: 10...20)
            for _ in 0..<numberOfCells {
                row.append(Int.random(in: 1...100))
            }
            data.append(row)
        }
        return data
    }
    
    func updateRandomdata() {
        var currentIndex = 0
        data.forEach({ eachRow in
            let eachRowRandomElementIndex = Int.random(in: 0...eachRow.count - 1)
            data[currentIndex][eachRowRandomElementIndex] = Int.random(in: 1...100)
            currentIndex += 1
        })
    }
}
