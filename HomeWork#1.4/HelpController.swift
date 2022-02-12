

import Foundation
import UIKit
import SnapKit

class HelpController: UIViewController{
    private lazy var scrollView = UIScrollView()
    private lazy var HelpLayout = UIView()
  
    private lazy var clickBack: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.setTitle("Back", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(clickSignUp(view:)), for: .touchUpInside)
        return view
    }()
    
    private lazy var HelpText: UILabel = {
      let view = UILabel()
      view.textColor = .black
      view.text = "1.Open the AppStore. 2.Enter Telegram in search box. 3.Click download"
        view.numberOfLines = 0
      return view
    }()
    @objc func clickSignUp(view: UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
   
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        view.addSubview(HelpLayout)
        HelpLayout.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(200)
        }
                
        HelpLayout.addSubview(HelpText)
        HelpText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            
        }
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        view.addSubview(clickBack)
        clickBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
        }
    }
}

