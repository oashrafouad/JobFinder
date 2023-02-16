//
//  JobsList.swift
//  JobFinder
//
//  Created by Omar Ashraf on 12/02/2023.
//

import Foundation

struct JobBrain
{
    let jobsList = [
        Job(title: "iOS Software Engineer", description: "We are looking for an experienced iOS Software Engineer to join our team. You will be working with a team of experienced engineers to develop and implement our mobile applications.", technology: "Swift", company: "ABC Corporation"),
        
        Job(title: "iOS Support Technician", description: "We are looking for an experienced iOS Support Technician to join our team and provide technical assistance to our customers. You will be responsible for troubleshooting and resolving customer issues related to our mobile applications. You will also be responsible for providing users with technical guidance and advice on how to use our mobile applications.", technology: "Swift", company: "XYZ Corporation"),
        
        Job(title: "Android Developer", description: "We are looking for an experienced Android Developer to join our team. You will help create innovative mobile applications, design and develop new and existing apps, test, debug, and optimize code. Additionally, you will collaborate with UX/UI designers, product managers, and other stakeholders to ensure our products meet user needs.", technology: "Java", company: "ABC Innovations"),
        
        Job(title: "UX/UI Designer", description: "Our team is seeking an experienced UX/UI Designer to join us in developing cutting-edge mobile applications. You will be in charge of designing attractive user interfaces and user experiences. Additionally, you will be collaborating with our software engineers, product managers, and other stakeholders to make certain our products satisfy our customers' requirements.", technology: "Figma", company: "PQR Solutions")
    ]
    
    func getJobTitle() -> String
    {
        return jobsList[0].title
    }
    
    func getJobDescription() -> String
    {
        return jobsList[0].description
    }
    
    func getJobTechnology() -> String
    {
        return jobsList[0].technology
    }
    
    func getJobCompany() -> String
    {
        return jobsList[0].company
    }
}
