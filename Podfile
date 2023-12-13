# Uncomment the next line to define a global platform for your project
platform :ios, '16.4'

def data_pod
  pod 'Alamofire'
  pod 'ObjectMapper'
end

def ui_pod
  pod 'SDWebImage'
end

target 'ios-theMealsApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  ui_pod
end

# Modules

target 'Domain' do
  use_frameworks!
  data_pod
end

target 'Data' do
  use_frameworks!
  data_pod
end

target 'Core' do
  use_frameworks!
  ui_pod
end

target 'Common' do
  use_frameworks!
  ui_pod
end

target 'Home' do
  use_frameworks!
  ui_pod
end

target 'Favorite' do
  use_frameworks!
  ui_pod
end

target 'Detail' do
  use_frameworks!
  ui_pod
end

target 'OnBoarding' do
  use_frameworks!
  ui_pod
end

target 'About' do
  use_frameworks!
  ui_pod
end
