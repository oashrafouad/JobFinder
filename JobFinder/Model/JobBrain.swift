//
//  JobsList.swift
//  JobFinder
//
//  Created by Omar Ashraf on 12/02/2023.
//

import Foundation

class JobBrain
{
    
    var jobsList = [
        Job(title: "iOS Software Engineer", description: "We are looking for an experienced iOS Software Engineer to join our team. You will be working with a team of experienced engineers to develop and implement our mobile applications.", track: "Mobile Development", company: "ABC Corporation"),
        
        Job(title: "iOS Support Technician", description: "We are looking for an experienced iOS Support Technician to join our team and provide technical assistance to our customers. You will be responsible for troubleshooting and resolving customer issues related to our mobile applications. You will also be responsible for providing users with technical guidance and advice on how to use our mobile applications.", track: "Mobile Development", company: "XYZ Corporation"),
        
        Job(title: "Android Developer", description: "We are looking for an experienced Android Developer to join our team. You will help create innovative mobile applications, design and develop new and existing apps, test, debug, and optimize code. Additionally, you will collaborate with UX/UI designers, product managers, and other stakeholders to ensure our products meet user needs.", track: "Mobile Development", company: "ABC Innovations"),
        
        Job(title: "UX/UI Designer", description: "Our team is seeking an experienced UX/UI Designer to join us in developing cutting-edge mobile applications. You will be in charge of designing attractive user interfaces and user experiences. Additionally, you will be collaborating with our software engineers, product managers, and other stakeholders to make certain our products satisfy our customers' requirements.", track: "UX/UI Design", company: "PQR Solutions"),
        
        Job(title: "iOS UX Designer", description: "We are looking for an experienced iOS UX Designer to join our team. You will help design user experiences and interfaces for our mobile applications. You will collaborate with developers, product managers, and other stakeholders to ensure an intuitive and seamless user experience.", track: "UX/UI Design", company: "ABC Corporation"),
        
        Job(title: "Web UI Designer", description: "We are looking for an experienced Web UI Designer to join our team. You will design user interfaces for our web applications. You will collaborate with UX designers, developers, and other stakeholders to create intuitive and visually appealing interfaces.", track: "UX/UI Design", company: "XYZ Technologies")
    ]
    
    // List of tracks available to choose from in Register and Post Job screens
    let tracksList = ["Mobile Development", "Web Development", "Machine Learning", "UX/UI Design", "Game Development", "Data Analysis", "IT"]
    
    // Get the Job object at from array at index jobNumber
    func getJobAtIndex(index: Int) -> Job
    {
        return jobObjc.jobsList[index]
    }
    
    func getJobsInCurrentUserTrack() -> [Job]
    {
        let currentTrack = currentUser!.track
        
        // This is a closure that searches through usersList and returns an array of Job objects that have the same track as the track of the current user. $0 is shorthand for the first (and only) argument passed to the closure, which is jobObjc
        let jobs = jobObjc.jobsList.filter({$0.track == currentTrack})
        return jobs
    }
    
    // Add new Job object to jobsList array
    func addJob(title: String, description: String, track: String, company: String)
    {
        jobObjc.jobsList.append(Job(title: title, description: description, track: track, company: company))
    }
}

var jobObjc = JobBrain()
var jobsOfCurrentUser : [Job]!
