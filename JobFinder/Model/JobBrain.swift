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
        Job(title: "iOS Software Engineer", description: "We are looking for an experienced iOS Software Engineer to join our team. You will be working with a team of experienced engineers to develop and implement our mobile applications.", track: "Swift", company: "ABC Corporation"),
        
        Job(title: "iOS Support Technician", description: "We are looking for an experienced iOS Support Technician to join our team and provide technical assistance to our customers. You will be responsible for troubleshooting and resolving customer issues related to our mobile applications. You will also be responsible for providing users with technical guidance and advice on how to use our mobile applications.", track: "Swift", company: "XYZ Corporation"),
        
        Job(title: "Android Developer", description: "We are looking for an experienced Android Developer to join our team. You will help create innovative mobile applications, design and develop new and existing apps, test, debug, and optimize code. Additionally, you will collaborate with UX/UI designers, product managers, and other stakeholders to ensure our products meet user needs.", track: "Java", company: "ABC Innovations"),
        
        Job(title: "UX/UI Designer", description: "Our team is seeking an experienced UX/UI Designer to join us in developing cutting-edge mobile applications. You will be in charge of designing attractive user interfaces and user experiences. Additionally, you will be collaborating with our software engineers, product managers, and other stakeholders to make certain our products satisfy our customers' requirements.", track: "Figma", company: "PQR Solutions")
    ]
    
    // Index of Job object in jobsList array
    var jobNumber = 0
    
    // Get the Job object at from array at index jobNumber
    func getJob() -> Job
    {
        var currentJob = jobsList[jobNumber]
        jobNumber += 1
        return currentJob
    }
    
    // Add new Job object to jobsList array
    func addJob(title: String, description: String, track: String, company: String)
    {
        jobsList.append(Job(title: title, description: description, track: track, company: company))
        print(jobsList)
        print("\n")
    }
    
}

var jobObjc = JobBrain()
