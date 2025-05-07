//
//  DatabaseHelper.swift
//  realDemo
//
//  Created by Vibha Kumari Dey on 06/05/25.
//

import RealmSwift
import UIKit

class DatabaseHelper {
    
    static let shared = DatabaseHelper()
    
    private var realm = try! Realm()
    func getDatabaseURL() -> URL {
        return Realm.Configuration.defaultConfiguration.fileURL!
    }
    func saveContact(contact: Contact){
        
           try! realm.write {
            realm.add(contact)
        }
        }
    //
    func fetchContacts() -> [Contact] {
        let contacts = realm.objects(Contact.self)
        return Array(contacts)
    }

    }

