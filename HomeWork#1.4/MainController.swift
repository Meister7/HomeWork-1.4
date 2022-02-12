
import UIKit
import SnapKit


class MainControoler: UIViewController {
    
    private lazy var clickBack: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.setTitle("<Exit", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(clickSignUp(view:)), for: .touchUpInside)
        return view
        
    }()
    
    private lazy var tableView: UITableView = {
            let view = UITableView()
            view.delegate = self
            view.dataSource = self
            return view
        }()
    @objc func clickSignUp(view: UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
    @objc func addMessages(){
        messagePhoto.append(UIImage(named: "Person1")!)
        message2.append("Person1")
    }
    
   
    
    private lazy var messagePhoto: [UIImage] = []
    private lazy var message2: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = .black
        tableView.separatorInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        view.backgroundColor = .white
        view.addSubview(clickBack)
        clickBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
        }
        setupView()
        setupConstraint()
        addMessages()
    }

private func setupView(){
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomUiTableViewCell")
        tableView.register(SecondCustomCell.self, forCellReuseIdentifier: "SecondCustomCell")
    }
    
    private func setupConstraint(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(clickBack.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
       
    }
}

extension MainControoler: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagePhoto.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let messageController = MessageController()
        messageController.title1.text = message2[indexPath.row]
        messageController.titlePhoto.image = messagePhoto[indexPath.row]
        present(messageController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomUiTableViewCell") as! CustomTableViewCell
        cell.title1.text = message2[index]
        cell.titlePhoto.image = messagePhoto[index]
      return cell
        }
    
    
    
    }
    

