//
//  ViewController.swift
//  ExpandTableViewCell
//
//  Created by Vivek on 02/02/23.
//

import UIKit

class ViewController: UIViewController {

   

    
    @IBOutlet weak var tableView: UITableView!
    
    var expandedCell : IndexSet = []
    
    var nameArray = ["Anish", "Ravnish" , "Mohit", "Rockey"]
    
    var textArray : [String] = ["Swift is a compiled programming language that is general-purpose, multi-paradigm and was developed by Apple Inc. It is available for multiple OS platforms such as iOS, iPadOS, macOS, watchOS, tvOS, z/OS and also for Linux. Swift is primarily designed to work with Apple's Cocoa and Cocoa Touch frameworks along with a wide range of existing Objective-C code written for Apple products. Built with the open source LLVM compiler framework, Swift has been an inclusion in Xcode since version 6 that was released in 2014. On Apple platforms, it makes use of the Objective-C runtime library, thus allowing C, Objective-C, C++ and Swift code to run within one program."
        ,"iOS, iPadOS, macOS, watchOS, tvOS, z/OS and also for Linux. Swift is primarily designed to work with Apple's Cocoa and Cocoa Touch frameworks along with a wide range of existing Objective-C code written for Apple products. Built with the open source LLVM compiler framework, Swift has been an inclusion in Xcode since version 6 that was released in 2014. On Apple platforms, it makes use of the Objective-C runtime library, thus allowing C, Objective-C, C++ and Swift code to run within one program."
         ,
           "Swift is a compiled programming language that is general-purpose, multi-paradigm and was developed by Apple Inc. It is available for multiple OS platforms such as iOS, iPadOS, macOS, watchOS, tvOS, z/OS and also for Linux. Swift is primarily designed to work with Apple's Cocoa and Cocoa Touch frameworks along with a wide range of existing Objective-C code wre Objective-C runtime library, thus allowing C, Objective-C, C++ and Swift code to run within one program.",
        "Swift is a compiled programming language that is general-purpose, multi-paradigm and was developed by Apple Inc. It is available for multiple OS platforms such as iOS, iPadOS, macOS, watchOS, tvOS, z/OS and also for Linux. Swift is primarily designed to work with Apple's Cocoa and Cocoa Touch frameworks along with a wide range of existing Objective-C code written for Apple products. Built with the open source LLVM compiler framework, Swift has been an inclusion in Xcode since version 6 that was released in 2014. On Apple platforms, it makes use of the Objective-C runtime library, thus allowing C, Objective-C, C++ and Swift code to run within one program. "
                                
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        cell.detailTxt.text = textArray[indexPath.row]
        cell.titleLbl.text = nameArray[indexPath.row]
        
        if expandedCell.contains(indexPath.row) {
            cell.detailTxt.numberOfLines = 0
            cell.moreBtn.setTitle("See Less", for: .normal)
        }
        else {
            cell.detailTxt.numberOfLines = 3
        }
        
        
        
        // Button Action
        cell.moreBtnClicked = {
            
            if self.expandedCell.contains(indexPath.row) {
                self.expandedCell.remove(indexPath.row)
            }
            else {
                self.expandedCell.insert(indexPath.row)
            }
            
            tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if expandedCell.contains(indexPath.row) {
            expandedCell.remove(indexPath.row)
        }
        else{
            expandedCell.insert(indexPath.row)
        }
        
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
    
}
