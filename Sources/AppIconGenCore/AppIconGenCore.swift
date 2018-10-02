import Foundation
import SwiftGD

public struct AppIconGen {
  private let options: Options
  private let fileManager = FileManager.default
  
  public init(options: Options) {
    self.options = options
  }
  
  public func process() {
    guard isSourceFilePathExists else {
      print("ERROR: Source file not found.")
      exit(0)
    }
    makeAppIconDirectory()
    let contents = defaultContentsFactory.make()
    writeContentJSON(contents: contents)
    writeImages(contents: contents)
  }
  
  var isSourceFilePathExists: Bool {
    return fileManager.fileExists(atPath: options.inputFilePath.path)
  }
  
  var defaultContentsFactory: ContentsFactory {
    return ContentsFactory(xcassets: options.inputFilePath.lastPathComponent, appIconName: options.appIconName)
  }
  
  private func makeAppIconDirectory(withIntermediateDirectories: Bool = true) {
    var xcassets = options.xcassetsLocation
    xcassets.appendPathComponent("\(options.appIconName).appiconset", isDirectory: true)
    try! fileManager.createDirectory(atPath: xcassets.path,
                                     withIntermediateDirectories: withIntermediateDirectories,
                                     attributes: nil)
  }
  
  private func writeContentJSON(contents: Contents) {
    let jsonData = try! JSONEncoder().encode(contents)
    let json = String(data: jsonData, encoding: .utf8)!
    let url = options.filePathInAppIcon(fileName: "Contents.json")
    try! json.write(to: url, atomically: true, encoding: .utf8)
  }
  
  private func writeImages(contents: Contents) {
    let image = Image(url: options.inputFilePath)!
    
    contents.images.forEach { (content) in
      self.writeImage(image, as: content)
    }
  }
  
  private func writeImage(_ image: Image, as content: Content) {
    let resizedImage = image.resizedTo(width: content.expectedSizeNumber, height: content.expectedSizeNumber)
    resizedImage?.write(to: options.filePathInAppIcon(fileName: content.filename))
  }
}

