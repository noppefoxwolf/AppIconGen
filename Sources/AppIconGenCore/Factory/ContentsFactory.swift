//
//  ContentsFactory.swift
//  AppIconGen
//
//  Created by Tomoya Hirano on 2018/10/03.
//

import Foundation

struct ContentsFactory {
  private let folder: String
  
  init(xcassets: String = "Assets.xcassets", appIconName: String = "AppIcon") {
    let folder = "\(xcassets)/\(appIconName).appiconset/"
    self.folder = folder
  }
  
  func make() -> Contents {
    let contents = Contents(images: [
      Content(size: "60x60", expectedSize: 180, folder: folder, idiom: .iPhone, scale: "3x"),
      Content(size: "40x40", expectedSize: 80, folder: folder, idiom: .iPhone, scale: "2x"),
      Content(size: "40x40", expectedSize: 120, folder: folder, idiom: .iPhone, scale: "3x"),
      Content(size: "60x60", expectedSize: 120, folder: folder, idiom: .iPhone, scale: "2x"),
      Content(size: "57x57", expectedSize: 57, folder: folder, idiom: .iPhone, scale: "1x"),
      Content(size: "29x29", expectedSize: 58, folder: folder, idiom: .iPhone, scale: "2x"),
      Content(size: "29x29", expectedSize: 29, folder: folder, idiom: .iPhone, scale: "1x"),
      Content(size: "29x29", expectedSize: 87, folder: folder, idiom: .iPhone, scale: "3x"),
      Content(size: "57x57", expectedSize: 114, folder: folder, idiom: .iPhone, scale: "2x"),
      Content(size: "20x20", expectedSize: 40, folder: folder, idiom: .iPhone, scale: "2x"),
      Content(size: "20x20", expectedSize: 60, folder: folder, idiom: .iPhone, scale: "3x"),
      Content(size: "40x40", expectedSize: 80, folder: folder, idiom: .iPad, scale: "2x"),
      Content(size: "72x72", expectedSize: 72, folder: folder, idiom: .iPad, scale: "1x"),
      Content(size: "76x76", expectedSize: 152, folder: folder, idiom: .iPad, scale: "2x"),
      Content(size: "50x50", expectedSize: 100, folder: folder, idiom: .iPad, scale: "2x"),
      Content(size: "29x29", expectedSize: 58, folder: folder, idiom: .iPad, scale: "2x"),
      Content(size: "76x76", expectedSize: 76, folder: folder, idiom: .iPad, scale: "1x"),
      Content(size: "29x29", expectedSize: 29, folder: folder, idiom: .iPad, scale: "1x"),
      Content(size: "50x50", expectedSize: 50, folder: folder, idiom: .iPad, scale: "1x"),
      Content(size: "72x72", expectedSize: 144, folder: folder, idiom: .iPad, scale: "2x"),
      Content(size: "40x40", expectedSize: 40, folder: folder, idiom: .iPad, scale: "1x"),
      Content(size: "83.5x83.5", expectedSize: 167, folder: folder, idiom: .iPad, scale: "2x"),
      Content(size: "20x20", expectedSize: 20, folder: folder, idiom: .iPad, scale: "1x"),
      Content(size: "20x20", expectedSize: 40, folder: folder, idiom: .iPad, scale: "2x"),
      Content(size: "1024x1024", expectedSize: 1024, folder: folder, idiom: .iosMarketing, scale: "1x")])
    
    return contents
  }
}
