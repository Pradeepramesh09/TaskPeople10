//
//  TaskTests.swift
//  TaskTests
//
//  Created by Pradeep_Ramesh on 26/05/20.
//  Copyright © 2020 Pradeep ramesh. All rights reserved.
//

import Foundation
import XCTest
@testable import Task


class Restuarents: Codable {
    
  let name: String
  let category: String
  let backgroundImageURL: String
}

class APIRepository {
    
  var session: URLSession!

    
  func getRestuarents(completion: @escaping ([Restuarents]?, Error?) -> Void) {
    
    guard let url = URL(string: "https://s3.amazonaws.com/br-codingexams/restaurants.json")
    else { fatalError() }
    session.dataTask(with: url) { (_, _, _) in }

    
  }
}

class TaskTests: XCTestCase {

    func testGetRestuarentssWithExpectedURLHostAndPath() {
        
      let apiRespository = APIRepository()
      let mockURLSession  = MockURLSession()
      apiRespository.session = mockURLSession
      apiRespository.getRestuarents() { restuarents, error in }
      XCTAssertEqual(mockURLSession.cachedUrl?.host, "s3.amazonaws.com")
      XCTAssertEqual(mockURLSession.cachedUrl?.path, "/br-codingexams/restaurants.json")
    }
    
}

class MockURLSession: URLSession {
  var cachedUrl: URL?
  override func dataTask(with url: URL, completionHandler:@escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    self.cachedUrl = url
    return URLSessionDataTask()
  }
}

