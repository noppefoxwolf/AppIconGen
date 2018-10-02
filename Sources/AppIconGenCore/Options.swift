//
//  Options.swift
//  AppIconGen
//
//  Created by Tomoya Hirano on 2018/10/03.
//

import Foundation

public struct Options {
  let inputFilePath: URL
  let xcassetsLocation: URL
  let appIconName: String
  var appIconPath: URL {
    var url = xcassetsLocation
    url.appendPathComponent("\(appIconName).appiconset")
    return url
  }
  func filePathInAppIcon(fileName: String) -> URL {
    var url = appIconPath
    url.appendPathComponent(fileName)
    return url
  }
  
  public init(inputFilePath: URL, xcassetsLocation: URL, appIconName: String) {
    self.inputFilePath = inputFilePath
    self.xcassetsLocation = xcassetsLocation
    self.appIconName = appIconName
  }
}
