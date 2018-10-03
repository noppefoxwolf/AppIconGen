import Foundation
import SwiftGD
import SwiftHash

public struct AppIconGen {
  private let options: Options
  private let fileManager = FileManager.default
  
  public init(options: Options) {
    self.options = options
  }
  
  public func process() {
    #warning("TODO: gd入ってるかチェック")
    guard isSourceFilePathExists else {
      print("ERROR: Source file not found.")
      exit(0)
    }
    guard isUpdatedNeeded() else {
      print("SUCCESS: Already updated.")
      exit(0)
    }
    makeAppIconDirectory()
    let contents = defaultContentsFactory.make()
    writeContentJSON(contents: contents)
    writeImages(contents: contents)
    updateMd5()
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
  
  private func isUpdatedNeeded() -> Bool {
    let image = md5(ofImage: options.inputFilePath)
    let saved = md5(ofSaved: options.filePathInAppIcon(fileName: ".md5"))
    return image != saved
  }
  
  private func md5(ofImage url: URL) -> String {
    let imageData = try! Data(contentsOf: url, options: .alwaysMapped)
    let imageString = String(data: imageData, encoding: .ascii)!
    return MD5(imageString)
  }
  
  private func md5(ofSaved url: URL) -> String? {
    guard let imageString = try? String(contentsOf: url, encoding: .utf8) else { return nil }
    return imageString
  }
  
  private func updateMd5() {
    let image = md5(ofImage: options.inputFilePath)
    let url = options.filePathInAppIcon(fileName: ".md5")
    try! image.write(to: url, atomically: true, encoding: .utf8)
  }
}

