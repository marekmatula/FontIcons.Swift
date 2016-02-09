#
# Be sure to run `pod lib lint FontIcons.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FontIcons"
  s.version          = "1.1.0"
  s.summary          = "Swift Font icon library"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
Universal library for Font icons. Default implementation for FontAwesome and Vaadin Icons.
Easy extensible to other fonts.
                       DESC

  s.homepage         = "https://github.com/marekmatula/FontIcons.Swift"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Marek Matula" => "marek.matula@gmail.com" }
  s.source           = { :git => "https://github.com/marekmatula/FontIcons.Swift.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.subspec 'Core' do |core|
    core.source_files = 'Pod/Classes/FontIcons.swift', 'Pod/Classes/Extensions.swift'
  end

  s.subspec 'FontAwesome' do |fa|
    fa.dependency 'FontIcons/Core'
    fa.source_files = 'Pod/Classes/FontAwesome.swift'
    fa.resource_bundles = {
        'FontAwesome' => ['Pod/Assets/FontAwesome.ttf']
    }
  end

  s.subspec 'VaadinIcons' do |vi|
    vi.dependency 'FontIcons/Core'
    vi.source_files = 'Pod/Classes/VaadinIcons.swift'
    vi.resource_bundles = {
        'VaadinIcons' => ['Pod/Assets/Vaadin-Icons.ttf']
    }
  end

  s.subspec 'MaterialDesign' do |md|
    md.dependency 'FontIcons/Core'
    md.source_files = 'Pod/Classes/MaterialDesignIcons.swift'
    md.resource_bundles = {
        'MaterialDesignIcons' => ['Pod/Assets/MaterialIcons-Regular.ttf']
    }
  end


  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
