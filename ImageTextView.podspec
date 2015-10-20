Pod::Spec.new do |s|

  s.name                  = "ImageTextView"
  s.version               = "1.0.1"
  s.summary               = "`ImageTextView` is a `UITextView` with images."

  s.description           = <<-DESC
                            `ImageTextView` is a subclass of `UITextView` that allows you to add `UIImage` elements.
                            It has a placeholder attribute as well. The demo showcases it in use.
                            DESC

  s.homepage              = "https://github.com/dehli/ImageTextView"

  s.license               = { :type => "MIT", :file => "LICENSE" }

  s.author                = { "Christian Paul Dehli" => "dehli@gatech.edu" }
  s.social_media_url      = "http://twitter.com/cpdehli"

  s.platform              = :ios
  s.ios.deployment_target = "8.0"

  s.source                = { :git => "https://github.com/dehli/ImageTextView.git", :tag => "#{s.version}"}
  s.source_files          = "ImageTextView/**/*.{swift}"

end
