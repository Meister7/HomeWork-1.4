

import Foundation
import UIKit

class SignUpController: UIViewController{
    
    private lazy var titleSignUp: UILabel = {
            let view = UILabel()
            view.textColor = .black
            view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            view.text = "Sign up to Telegram"
            return view
        }()
    
    private lazy var clickBack: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.setTitle("<Back", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(clickBack(sender:)), for: .touchUpInside)
        return view
    }()
    
    private lazy var nameSignUp: UITextField = {
        let view = UITextField()
        view.placeholder = "Username"
        view.font = UIFont.systemFont(ofSize: 20)
        view.textColor = .black
        return view
    }()
    private lazy var phoneSignUp: UITextField = {
        let view = UITextField()
        view.placeholder = "Phone number"
        view.font = UIFont.systemFont(ofSize: 20)
        view.textColor = .black
        return view
    }()
    private lazy var emailSignUp: UITextField = {
        let view = UITextField()
        view.placeholder = "email"
        view.font = UIFont.systemFont(ofSize: 20)
        view.textColor = .black
        return view
    }()
    private lazy var passwordSignUp: UITextField = {
        let view = UITextField()
        view.placeholder = "New password"
        view.font = UIFont.systemFont(ofSize: 20)
        view.isSecureTextEntry = true
        view.textColor = .black
        return view
    }()
    private lazy var repeatpasswordSignUP: UITextField = {
        let view = UITextField()
        view.placeholder = "Repeat password"
        view.font = UIFont.systemFont(ofSize: 20)
        view.isSecureTextEntry = true
        view.textColor = .black
        return view
    }()
    private lazy var buttonSignUp: UIButton = {
        let view = UIButton()
        view.setTitle("Done", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.addTarget(self, action: #selector(clickRegister(view:)), for: .touchUpInside)
        view.layer.cornerRadius = 30 / 2
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var  registerLayout = UIView()
    func validLogin(myLogin: String) -> Bool
        {
            let login =  ("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
            let loginTesting = NSPredicate(format: "SELF MATCHES %@", login)
            return loginTesting.evaluate(with: myLogin)
        }
    

    
            
            
        
    @objc func clickRegister(view: UIButton){
        let login = validLogin(myLogin: emailSignUp.text!)
        
        let textpassword = passwordSignUp.text!.count
        let repeatPassword = passwordSignUp.text! == repeatpasswordSignUP.text!
        let textCount = (nameSignUp.text!.count != 0) && phoneSignUp.text!.count >= 7
        
        if (textpassword >= 7) && login && repeatPassword && textCount{
            navigationController?.popToRootViewController(animated: true)
           
        }else {
            let alertController = UIAlertController(title: "Error", message: "make sure the text is correct", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(alertAction)
            
            self.present(alertController, animated: true)
           
       
        
        }
        
    }
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        
        view.addSubview(clickBack)
        clickBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.frame.width / 20)
            make.left.equalToSuperview().offset(view.frame.width / 30)
        }
        
        view.addSubview(registerLayout)
        registerLayout.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(380)
        }
        
        registerLayout.addSubview(titleSignUp)
        titleSignUp.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        registerLayout.addSubview(nameSignUp)
        nameSignUp.snp.makeConstraints { make in
            make.top.equalTo(titleSignUp.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        registerLayout.addSubview(phoneSignUp)
        phoneSignUp.snp.makeConstraints { make in
            make.top.equalTo(nameSignUp.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        registerLayout.addSubview(emailSignUp)
        emailSignUp.snp.makeConstraints { make in
            make.top.equalTo(phoneSignUp.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        registerLayout.addSubview(passwordSignUp)
        passwordSignUp.snp.makeConstraints { make in
            make.top.equalTo(emailSignUp.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        registerLayout.addSubview(repeatpasswordSignUP)
        repeatpasswordSignUP.snp.makeConstraints { make in
            make.top.equalTo(passwordSignUp.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        registerLayout.addSubview(buttonSignUp)
        buttonSignUp.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-30)
            make.height.equalTo(40)
            
            
        }
        
    }
    
    @objc func clickBack(sender: UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
}
