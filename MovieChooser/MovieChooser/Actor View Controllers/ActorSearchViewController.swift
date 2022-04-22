//
//  ActorSearchViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 22.04.2022.
//

import UIKit

class ActorSearchViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
    }
    
    private func setupAppearance() {
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .secondarySystemBackground
    }

}
