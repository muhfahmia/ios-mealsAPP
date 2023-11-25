# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

use_frameworks!

def data_pod
  pod 'Alamofire'
  pod 'ObjectMapper'
end

def ui_pod
    pod 'SDWebImage'
end

target 'Core' do
  pod 'Domain'
end

target 'Home' do
  ui_pod
end

target 'Favorite' do
  ui_pod
end

target 'Detail' do
  ui_pod
end

target 'Data' do
  data_pod
end
