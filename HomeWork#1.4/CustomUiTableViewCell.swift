//
//  CustomUiTableViewCell.swift
//  HomeWork#1.4
//
//  Created by Эмир Кармышев on 12/2/22.
//

import Foundation

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    private lazy var totalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var title1: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15, weight: .bold)
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    lazy var titlePhoto: UIImageView = {
        let view = UIImageView()
        view.image = .init(named: "person1")
        view.layer.cornerRadius = 45/2
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override func layoutSubviews() {
        
        backgroundColor = .black
        
        addSubview(totalView)
        totalView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-1)
        }
        
        totalView.addSubview(titlePhoto)
        titlePhoto.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.height.equalToSuperview().dividedBy(2)
            make.width.equalToSuperview().dividedBy(7)
            make.centerY.equalToSuperview()
        }
        
        totalView.addSubview(title1)
        title1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(titlePhoto.snp.right).offset(16)
        }
        
    }

}
