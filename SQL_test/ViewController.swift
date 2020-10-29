//
//  ViewController.swift
//  SQL_test
//
//  Created by Andy Arilrve on 2020/10/29.
//
/* https://itisjoe.gitbooks.io/swiftgo/content/database/sqlite.html */
/* http://hsin.tw/swiftgo/database/sqlite.html */

import UIKit
import Swift
import SQLite3

class ViewController: UIViewController {
    var db :OpaquePointer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /* store sqlite's connection information */

        let sqliteURL : URL = {
            do{
                return try FileManager.default.url(
                    for: .documentDirectory,
                    in: .userDomainMask,
                    appropriateFor:nil,
                    create: true).appendingPathComponent("db.sqlite")
            }catch{
                    fatalError("Error getting file URL from document directory")
                }
            }()

        /* open connection */
        if sqlite3_open(sqliteURL.path, &db)==SQLITE_OK{
            print("Success")
        }else{
            print("Failed")
        }
        
        let sql = "Create table if not exists students"
                    + "( id integer primary key autoincrement, "
                    + "name text, height double)" as NSString
                    
        if sqlite3_exec(db, sql.utf8String, nil, nil, nil)
            == SQLITE_OK{
            print("Create Table Succes")
        }
        
    }
}

