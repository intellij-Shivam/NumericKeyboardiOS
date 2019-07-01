
Pod::Spec.new do |s|


  s.name         = "Keyboard"
  s.version      = "0.0.2"
  s.summary      = "A Numeric Keyboard for iPads"
  s.description  = "A Numeric keyboard for iPads like android"
  s.homepage     = "https://github.com/intellij-Shivam"

  s.license      = "MIT"
  s.authors            = { "Shivam Saini" => "shivam27saini@gmail.com" }

  s.platform     = :ios, "9.0"


  s.source       = { :git => "https://github.com/intellij-Shivam/NumericKeyboardiOS.git", :tag => s.version.to_s }

  s.swift_version = "4.2" 
  s.source_files  = "NumericKeypad"

end
