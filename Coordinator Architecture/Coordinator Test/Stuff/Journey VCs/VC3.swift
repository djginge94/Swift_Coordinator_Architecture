//
//  VC3.swift
//  Coordinator Test
//
//  Created by Joshua Colley on 24/01/2019.
//  Copyright © 2019 Joshua Colley. All rights reserved.
//

import UIKit

class VC3: UIViewController, CoordinatorInjectionProtocol {

    var coordinator: JourneyCoordinatorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateModel()
        self.title = "VC 3"
        self.navigationItem.setHidesBackButton(true, animated: false)
    }

    fileprivate func updateModel() {
        guard let coordinator = self.coordinator else { return }
        coordinator.model.item3 = "Item 3"
    }

    // MARK: - Actions
    @IBAction func nextAction(_ sender: Any) {
        guard let vc = coordinator?.loadNextVC() as? UIViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func previousAction(_ sender: Any) {
        let _ = coordinator?.loadPreviousVC()
        self.navigationController?.popViewController(animated: true)
    }
}
