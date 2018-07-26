//
//  HomeVC.swift
//  UNIamoci
//
//  Created by Gabriele Ruini on 24/07/18.
//  Copyright © 2018 Gabriele Ruini. All rights reserved.
//

import UIKit

import Firebase
import FirebaseFirestore

class HomeVC: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var db : Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       addEvent()
        
    }
    
    func addEvent() {
        
        let citiesRef = db.collection("cities")
        
        citiesRef.document("SF").setData([
            "name": "San Francisco",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 860000
            ])
        
        
        /*
        // Add a new document with a generated ID
        var messageRef : DocumentReference? = nil
        
        db = Firestore.firestore()
        
        messageRef = db.collection("users").document("giacomo").collection("event").addDocument(data: ["luogo" : "Parma", "materia" : "FCA", "professore" : "Piazzi" ])
 
         */
    }


}
