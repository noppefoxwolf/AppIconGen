import Foundation
import AppIconGenCore
import Commander

let inputPathOption = Option("input", default: "iTunesArtwork.png")
let xcassetsLocation = Option("xcassets", default: "Assets.xcassets")
let appIconNameOption = Option("app-icon-name", default: "AppIcon")

let main = command(inputPathOption, xcassetsLocation, appIconNameOption) { (input, xcassetsLocation, appIconName) in
  let options = Options(inputFilePath: URL(fileURLWithPath: input),
                        xcassetsLocation: URL(fileURLWithPath: xcassetsLocation),
                        appIconName: appIconName)
  let tool = AppIconGen(options: options)
  tool.process()
}
main.run()
