import Foundation

class UserBrain
{
    
    var usersList = [
        User(fullName: "Omar Ashraf", gender: "Male", company: "ITI", track: "Mobile Development", email: "oashrafouad@gmail.com", password: "omar"),
        User(fullName: "Tadros Nasr", gender: "Male", company: "ITI", track: "IT", email: "tadrosnasr@gmail.com", password: "tadros"),
        User(fullName: "Saeed Hassan", gender: "Male", company: "ITI", track: "UX/UI Design", email: "saeedhassan@gmail.com", password: "saeed")
    ]
    
    func addUser(fullName: String, gender: String, company: String, track: String, email: String, password: String)
    {
        userObjc.usersList.append(User(fullName: fullName, gender: gender, company: company, track: track, email: email, password: password))
    }
    
    func isUserFound(email: String, password: String) -> Bool
    {
        // This is a closure that searches through usersList and returns an array of User objects that have the same entered email and password. $0 is shorthand for the first (and only) argument passed to the closure, which is userObjc
        let foundUsers = userObjc.usersList.filter({$0.email == email && $0.password == password})
        
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
    
    // Make the user with these credentials be the current user
    func assignCurrentUser(email: String, password: String)
    {
        
        // This is a closure that searches through usersList and returns an array of User objects that have the same entered email and password. $0 is shorthand for the first (and only) argument passed to the closure, which is userObjc
        let users = userObjc.usersList.filter({$0.email == email && $0.password == password})
        
        // We are accessing the array at index 0 only because if it holds more than one value then it means duplicates are found. Our app can't handle duplicates for now so we only get the values at index 0
        currentUser = User(fullName: users[0].fullName, gender: users[0].gender, company: users[0].company, track: users[0].track, email: users[0].email, password: users[0].password)
    }
}

var userObjc = UserBrain()
var currentUser : User?
