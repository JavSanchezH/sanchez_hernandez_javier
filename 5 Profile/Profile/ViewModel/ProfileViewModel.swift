//
//  ProfileViewModel.swift
//  Profile
//
//  Created by Javier Sánchez on 15/03/24.
//

import Foundation

class ProfileViewModel {
    
    let profile = Profile(name: "Anna Avetsiyan", birthday: "01/01/2000", phone: "442 123 4566", insta: "@aavetsiyan", mail: "aavetsiyan@gmail.com", picture: "picture.png")
    
    func fetchProfile() -> Profile {
        return profile
    }
    
}
