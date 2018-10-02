//
//  Models.swift
//  AppIconGen
//
//  Created by Tomoya Hirano on 2018/10/03.
//

import Foundation

struct Contents: Encodable {
  let images: [Content]
}

struct Content: Encodable {
  let size: String
  let expectedSize: String
  let expectedSizeNumber: Int
  let filename: String
  let folder: String
  let idiom: Idiom
  let scale: String
  
  
  init(size: String, expectedSize: Int, folder: String, idiom: Idiom, scale: String) {
    self.size = size
    self.expectedSize = String(expectedSize)
    self.expectedSizeNumber = expectedSize
    self.filename = "\(String(expectedSize)).png"
    self.folder = folder
    self.idiom = idiom
    self.scale = scale
  }
}

enum Idiom: String, Encodable {
  case iPhone = "iphone"
  case iPad = "ipad"
  case iosMarketing = "ios-marketing"
}
