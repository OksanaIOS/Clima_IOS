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
    
//MARK: - UI elements
    private lazy var mainStackView: UIStackView  = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 10
        element.alignment = .trailing
        
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
        element.distribution = .fill
        element.alignment = .fill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private lazy var searchTextField: UITextField  = {
        let element = UITextField()
        element.placeholder = Constants.search
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var conditionalImageView: UIImageView  = {
        let element = UIImageView()
        element.image = UIImage(systemName: Constants.conditionSF)
        element.tintColor = UIColor(named: Constants.weatherColor)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private lazy var tempLabel: UILabel  = {
        let element = UILabel()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var tempTypeLabel: UILabel  = {
        let element = UILabel()
        element.tintColor = .label

        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var cityLabel: UILabel  = {
        let element = UILabel()
        element.tintColor = .label

        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var tempStackView: UIStackView  = {
        let element = UIStackView()
        element.axis = .horizontal
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var geoButton: UIButton  = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: Constants.geoSF), for: .normal)
        element.tintColor = .label
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var searchButton: UIButton  = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: Constants.searchSF), for: .normal)
        element.tintColor = .label

        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var emptyView: UIView = {
        var view = UIView()
        return view
    }()
   
   
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        
    }


}
//MARK: - Extensions

extension WeatherViewController {
    private func setViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(headerStackView)
        
        headerStackView.addArrangedSubview(geoButton)
        headerStackView.addArrangedSubview(searchTextField)
        headerStackView.addArrangedSubview(searchButton)
        
        mainStackView.addArrangedSubview(conditionalImageView)
        mainStackView.addArrangedSubview(tempStackView)
        
        tempStackView.addArrangedSubview(tempLabel)
        tempStackView.addArrangedSubview(tempTypeLabel)
        
        mainStackView.addArrangedSubview(cityLabel)
        mainStackView.addArrangedSubview(emptyView)

        
        tempLabel.text = "21"
        tempTypeLabel.text = Constants.celsius
        cityLabel.text = "London"
        
    }
    
    private func setupConstraints() {
       
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mainStackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(24)
            
        }
        headerStackView.snp.makeConstraints { make in
            make.width.equalTo(mainStackView.snp.width)
        }
        geoButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        searchButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        conditionalImageView.snp.makeConstraints { make in
            make.width.height.equalTo(120)
        }
    
        
    }
    
}


#Preview {
    WeatherViewController()
}
