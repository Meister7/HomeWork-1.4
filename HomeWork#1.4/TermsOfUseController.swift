
import Foundation
import UIKit
import SnapKit

class TermsOfUseController: UIViewController{
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    private lazy var infoLayout = UIView()
  
    private lazy var infoText: UILabel = {
      let view = UILabel()
      view.textColor = .black
        view.text = "We welcome all developers to use our API and source code to create Telegram-like messaging applications on our platform free of charge. In order to ensure consistency and security across the Telegram ecosystem, all third-party client apps must comply with the following Terms of Service. 1. Privacy & Security 1.1. Telegram is a privacy-oriented platform. All client apps must, therefore, guard their users' privacy with utmost care and comply with our Security Guidelines. 1.2. Developers are welcome to add new features or improve and extend existing Telegram features provided that these modifications do not violate these Terms of Service. 1.3. As a client developer, you must make sure that all the basic features of the main Telegram apps function correctly and in an expected way both in your app and when users of your app communicate with other Telegram users. It is forbidden to force users of other Telegram clients to download your app in order to view certain messages and content sent using your app. 1.4. It is forbidden to interfere with the basic functionality of Telegram. This includes but is not limited to: making actions on behalf of the user without the user's knowledge and consent, preventing self-destructing content from disappearing, preventing last seen and online statuses from being displayed correctly, tampering with the 'read' statuses of messages (e.g. implementing a 'ghost mode'), preventing typing statuses from being sent/displayed, etc. 2. Transparency. 2.1. You must obtain your own api_id for your application. 2.2. We offer our API free of charge, but your users must be aware of the fact that your app uses the Telegram API and is part of the Telegram ecosystem. This fact must be featured prominently in the app's description in the app stores and in the in-app intro if your app has it. 2.3. To avoid confusion, the title of your app must not include the word “Telegram”. An exception can be made if the word “Telegram” is preceded with the word “Unofficial” in the title. 2.4. You must not use the official Telegram logo for your app. Both the Telegram brand and its logo are registered trademarks protected by law in almost every country. 3. Advertising & Monetization 3.1. Developers are allowed to monetize their coding efforts through advertising or other legitimate means. 3.2. If you decide to monetize your app, you must clearly mention all the methods of monetization that are used in your app in all its app store descriptions. 3.3. If your app allows accessing content from Telegram channels, you must include support for official sponsored messages in Telegram channels and may not interefere with this functionality. 4. Breach of terms 4.1. If your app violates these terms, we will notify the Telegram account responsible for the app about the breach of terms. 4.2. If you do not update the app to fix the highlighted issues within 10 days, we will have to discontinue your access to Telegram API and contact the app stores about the removal of your apps that are using the Telegram API in violation of these terms.We reserve the right to expand these terms and guidelines as the need arises. We will inform client developers of such changes via an in-app notification to their accounts connected to the app in question."
        view.numberOfLines = 0
      return view
    }()
    private lazy var clickBack: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.setTitle("<Exit", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(clickSignUp(view:)), for: .touchUpInside)
        return view
        
    }()
    @objc func clickSignUp(view: UIButton){
        navigationController?.pushViewController(ViewController(), animated: true)
    }

   
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        
        view.addSubview(clickBack)
        clickBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(16)
        }
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(clickBack.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-4)
        }
        
        scrollView.addSubview(infoLayout)
        infoLayout.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view.frame.width - 30)
            make.centerX.equalToSuperview()
        }
        
        stackView.addArrangedSubview(infoText)
        
        infoLayout.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-4)
            make.bottom.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        infoLayout.snp.makeConstraints { make in
            make.bottom.equalTo(infoText.snp.bottom).offset(4)
        }
    }
}
