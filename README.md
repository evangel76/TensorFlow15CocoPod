# TensorflowPod1.5

## Build Tensorflow for iOS 11.2 on macOS
Only ARM64 libraries provided into the tar. The all libs are on all iOS variations, including x86 simulator for your MAC
are here: https://www.dropbox.com/s/9upcgpwzquber4p/tensorflow.tar.gz?dl=0
(gitnub does not allow such large libraries)
* [Prerequsite] Install xcode cli tools
    ```
    $ xcode-select --install
    ```

* [Prerequsite] Install automake and libtool
    ```
    $ brew install automake libtool
    ```

* Clone TensorFlow repository
    ```
    $ cd ~/Code
    $ git clone https://github.com/tensorflow/tensorflow/
    ```

* Clone TensorflowPod repository
    ```
    $ cd ~/Code
    $ git clone https://github.com/evangel76/TensorFlow15CocoPod
    ```
    Remove limitations for TensorFlow for iOS:
    ```
    open build_all_ios.sh into tensorflow/tensorflow/contrib/makefile
    remove all  instances of "ANDROID_TYPE" into the iOS section of the makefile, 
    this will remove the limitation tensorflow has on operations in iOS. 
    Notice that it will increase dramatically the size of the library. 
    I recommand to only do this if you need advanced features like back propagation,
    or CNN/RNN, and you are targetting mostly ARM64 only.
   
    ```


* Compile TensorFlow 
    ```
    $ cd ~/Code/tensorflow
    $ tensorflow/contrib/makefile/build_all_ios.sh
    ```

* Pack necessary header and static library
    ```
    $ cd ~/Code/tensorflow
    $ ~/Code/TensorflowPod/pack.sh
    $ ls tensorflow.tar.gz
    ```

## Integrate TensorFlow as Pod

* [Prerequsite] Install Cocoapods
    ```
    sudo gem install cocoapods
    ```

* Create or add pod into your project ```Podfile```, which should look like
Don't forget to edit "DemoApp" as your own project name, otherwise, cocopod will fail to add it to your project.
    ```
    target 'DemoApp' do
        # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
        use_frameworks!

        # Pods for DemoApp
        pod 'TensorflowPod', :podspec => 'https://raw.githubusercontent.com/evangel76/TensorFlow15CocoPod/blob/master/TensorflowPod.podspec'

    end
    ```

* Install Pod
    ```
    pod install
    ```

* Follow official demo app to develop, [link](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/examples/ios)
    ```
    #include "google/protobuf/message_lite.h"
    #include "tensorflow/core/framework/tensor.h"
    #include "tensorflow/core/public/session.h"

    tensorflow::GraphDef graph;
    ...
]


