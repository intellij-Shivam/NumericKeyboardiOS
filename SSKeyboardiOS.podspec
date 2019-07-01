
Pod::Spec.new do |s|


  s.name         = "SSKeyboardiOS"
  s.version      = "0.0.5"
  s.summary      = "A Numeric Keyboard for iPads"
  s.description  = "A Numeric keyboard for iPads like android"
  s.homepage     = "https://github.com/intellij-Shivam"

  s.license      = "MIT"
  s.authors            = { "Shivam Saini" => "shivam27saini@gmail.com" }

  s.platform     = :ios, "9.0"


  s.source       = { :git => "https://github.com/intellij-Shivam/NumericKeyboardiOS.git", :tag => s.version.to_s }

  s.swift_version = "4.2" 
  s.source_files  = "NumericKeypad"
  s.resources = ["NumericKeyboardiOS/NumericKeypad/NumericKeyboard.xib","NumericKeyboardiOS/NumericKeypad/Media.xcassets/ic_backspace.imageset/backspace\ \(1\).png;"]

end
