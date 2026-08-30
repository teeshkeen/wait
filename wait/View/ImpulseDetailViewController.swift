//
//  ImpulseDetailViewController.swift
//  wait
//
//  Created by tee on 30.08.2026.
//

import Foundation
import UIKit

final class ImpulseDetailViewController: UIViewController {
    private let impulse: Impulse?
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = impulse?.title ?? " "
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "waiting"
        
        view.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: view.centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    init(impulse: Impulse?) {
        self.impulse = impulse
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
