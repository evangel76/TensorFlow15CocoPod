

Pod::Spec.new do |s|

 
  s.name         = "TensorflowPod15"
  s.version      = "1.5"
  s.summary      = "Cocoapod based on Tensorflow1.5 (unofficial)"
  s.homepage     = "https://github.com/evangel76/TensorFlow15CocoPod"




  s.license      = "MIT"

 

  s.author             = { "Francois Piednoel" => "evangel76@yahoo.com" }

 

  s.platform     = :ios, "11.2"


  s.source = { :http => "https://raw.githubusercontent.com/evangel76/TensorFlow15CocoPod/master/tensorflow.tar.gz" }
  s.preserve_paths = "include/**"

 
  s.ios.framework  = "Accelerate"
  s.ios.vendored_libraries = "lib/libtensorflow-core.a", "lib/libprotobuf-lite.a", "lib/libprotobuf.a", "lib/libnsync.a"


  s.xcconfig = { 
    "HEADER_SEARCH_PATHS" => [
      "${PODS_ROOT}/#{s.name}/include",
      "${PODS_ROOT}/#{s.name}/include/tensorflow/contrib/makefile/downloads/protobuf/src",
      "${PODS_ROOT}/#{s.name}/include/tensorflow/contrib/makefile/downloads",
      "${PODS_ROOT}/#{s.name}/include/tensorflow/contrib/makefile/downloads/eigen",
      "${PODS_ROOT}/#{s.name}/include/tensorflow/contrib/makefile/gen/proto",
      "${PODS_ROOT}/#{s.name}/include/tensorflow/contrib/makefile/downloads/nsync/public",
    ],
    "OTHER_LDFLAGS" => "-force_load $(PODS_ROOT)/#{s.name}/lib/libtensorflow-core.a" 
  }
  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }

end
