//
//  UserBrain.swift
//  JobFinder
//
//  Created by Omar Ashraf on 18/02/2023.
//

import Foundation

class UserBrain
{
    var usersList : [User] = [
    User(fullName: "Omar Ashraf", gender: "Male", company: "ITI", track: "iOS", email: "oashrafouad@gmail.com", password: "omar"),
    User(fullName: "Omar Ashraf", gender: "Male", company: "ITI", track: "iOS", email: "oashrafouad@gmail.com", password: "omar"),
    User(fullName: "Tadros Nasr", gender: "Male", company: "ITI", track: "iOS", email: "tadrosnasr@gmail.com", password: "tadros"),
    User(fullName: "Saeed Hassan", gender: "Male", company: "ITI", track: "iOS", email: "saeedhassan@gmail.com", password: "saeed")
    ]
    
    func addUser(fullName: String, gender: String, company: String, track: String, email: String, password: String)
    {
        userObjc.usersList.append(User(fullName: fullName, gender: gender, company: company, track: track, email: email, password: password))
        print(userObjc.usersList)
        print("\n")
    }
    
    func isUserFound(email: String, password: String) -> Bool
    {
        // This is a closure that searches through usersList and returns an array of User objects that have the same entered email and password. $0 is shorthand for the first (and only) argument passed to the closure, which is userObjc
        var foundUsers = userObjc.usersList.filter({$0.email == email && $0.password == password})
        
        // If the array is empty, then no users exist with the entered credentials
        if foundUsers.isEmpty
        {
            return false
        }
        else
        {
            return true
        }
    }
}

var userObjc = UserBrain()
