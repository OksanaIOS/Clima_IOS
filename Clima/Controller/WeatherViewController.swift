//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    

//    @IBOutlet weak var conditionImageView: UIImageView!
//    @IBOutlet weak var temperatureLabel: UILabel!
//    @IBOutlet weak var cityLabel: UILabel!
    
    private lazy var mainStackView: UIStackView  = {
        let element = UIStackView()
        element.axis = .vertical
        element.backgroundColor = .blue
        element.distribution = .fillProportionally
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var backgroundImageView: UIImageView  = {
        let element = UIImageView()
        element.image = UIImage(named: Constants.background)
        element.contentMode = .scaleAspectFill
        
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var headerStackView: UIStackView  = {
        let element = UIStackView()
        element.axis = .horizontal
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        
    }


}

extension WeatherViewController {
    private func setViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        
    }
    
    private func setupConstraints() {
       
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mainStackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(24)
            
        }
        
    }
    
}


#Preview {
    WeatherViewController()
}
