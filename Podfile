# Uncomment the next line to define a global platform for your project
platform :ios, '14.5'

use_frameworks!

workspace 'CeibaParking'

target 'Presentation' do
  
  xcodeproj 'Presentation/Presentation.xcodeproj'

  # Pods for Presentation
  
  pod 'IQKeyboardManager'
  pod 'RealmSwift'
  
  target 'PresentationUITests' do
    # Pods for testing
  end

end

target 'DataAccessLocal' do
  
  xcodeproj 'DataAccessLocal/DataAccessLocal.xcodeproj'

  # Pods for DataAccessLocal
  pod 'RealmSwift'

end

target 'Domain' do
  
  xcodeproj 'Domain/Domain.xcodeproj'

  # Pods for Domain

  target 'DomainTests' do
    inherit! :search_paths
    # Pods for testing
   
  end

end
