//
//  ViewController.swift
//  Profile
//
//  Created by Javier Sánchez on 14/03/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var back: UIImageView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var insta: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var edit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileViewModel = ProfileViewModel()
        let profile = profileViewModel.fetchProfile()
        
        setUpPicture(profile.picture)
        setUpProfile(profile)
        setUpEditButton()
        setUpBack()
    }
    
    private func setUpPicture(_ picture: String) {
        self.picture.layer.cornerRadius = 40
        self.picture.clipsToBounds = true
        self.picture.image = UIImage(named: picture)
    }
    
    private func setUpProfile(_ profile: Profile) {
        titleName.text = profile.name
        name.text = profile.name
        birthday.text = profile.birthday
        phone.text = profile.phone
        insta.text = profile.insta
        mail.text = profile.mail
    }
    
    private func setUpEditButton() {
        edit.translatesAutoresizingMaskIntoConstraints = false
        edit.widthAnchor.constraint(equalToConstant: 250).isActive = true
        edit.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setUpBack() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        back.addGestureRecognizer(tapGR)
        back.isUserInteractionEnabled = true
    }
    
    @IBAction func edit(_ sender: Any) {
        showAlert(message: "Botón para editar profile.")
    }
    
    @objc func backTapped() {
        showAlert(message: "Botón para regresar a la vista anterior.")
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Profile", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
