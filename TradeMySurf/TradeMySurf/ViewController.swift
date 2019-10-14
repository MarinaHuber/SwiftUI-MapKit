//
//  ViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 9/12/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cars = Surfs()

    @IBOutlet var stackView: UIStackView!
    @IBOutlet var model: UISegmentedControl!
    @IBOutlet var upgrades: UISegmentedControl!
    @IBOutlet var mileageLabel: UILabel!
    @IBOutlet var mileage: UISlider!
    @IBOutlet var condition: UISegmentedControl!
    @IBOutlet var valuation: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        stackView.setCustomSpacing(30, after: model)
        stackView.setCustomSpacing(30, after: upgrades)
        stackView.setCustomSpacing(30, after: mileage)
        stackView.setCustomSpacing(60, after: condition)

        calculateValue(self)
    }

    @IBAction func calculateValue(_ sender: Any) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let formattedMileage = formatter.string(for: mileage.value) ?? "0"
        mileageLabel.text = "MILEAGE (\(formattedMileage) miles)"

        if let prediction = try? cars.prediction(model: Double(model.selectedSegmentIndex), premium: Double(upgrades.selectedSegmentIndex), mileage: Double(mileage.value), condition: Double(condition.selectedSegmentIndex)) {
            let clampedValuation = max(2000, prediction.price)
            formatter.numberStyle = .currency
            valuation.text = formatter.string(for: clampedValuation)
        } else {
            valuation.text = "Error"
        }
    }


}

