module Metalhead

using Flux
using Flux: Zygote, outputsize
using Functors
using BSON
using Artifacts, LazyArtifacts
using Statistics
using MLUtils
using PartialFunctions
using Random

import Functors

include("utilities.jl")

# Custom Layers
include("layers/Layers.jl")
using .Layers

# CNN models
## Builders
include("convnets/builders/invresmodel.jl")
include("convnets/builders/mbconv.jl")
include("convnets/builders/resblocks.jl")
include("convnets/builders/resnet.jl")
include("convnets/builders/stages.jl")
## AlexNet and VGG
include("convnets/alexnet.jl")
include("convnets/vgg.jl")
## ResNets
include("convnets/resnets/core.jl")
include("convnets/resnets/res2net.jl")
include("convnets/resnets/resnet.jl")
include("convnets/resnets/resnext.jl")
include("convnets/resnets/seresnet.jl")
## Inceptions
include("convnets/inceptions/googlenet.jl")
include("convnets/inceptions/inceptionv3.jl")
include("convnets/inceptions/inceptionv4.jl")
include("convnets/inceptions/inceptionresnetv2.jl")
include("convnets/inceptions/xception.jl")
## EfficientNets
include("convnets/efficientnets/efficientnet.jl")
include("convnets/efficientnets/efficientnetv2.jl")
## MobileNets
include("convnets/mobilenets/mobilenetv1.jl")
include("convnets/mobilenets/mobilenetv2.jl")
include("convnets/mobilenets/mobilenetv3.jl")
include("convnets/mobilenets/mnasnet.jl")
## Others
include("convnets/densenet.jl")
include("convnets/squeezenet.jl")
include("convnets/convnext.jl")
include("convnets/convmixer.jl")
include("convnets/unet.jl")

# Mixers
include("mixers/core.jl")
include("mixers/mlpmixer.jl")
include("mixers/resmlp.jl")
include("mixers/gmlp.jl")

# ViTs
include("vit-based/vit.jl")

# Load pretrained weights
include("pretrain.jl")

export AlexNet, VGG, VGG11, VGG13, VGG16, VGG19,
       ResNet, ResNet18, ResNet34, ResNet50, ResNet101, ResNet152,
       WideResNet, ResNeXt, SEResNet, SEResNeXt, Res2Net, Res2NeXt,
       DenseNet, DenseNet121, DenseNet161, DenseNet169, DenseNet201,
       GoogLeNet, Inception3, Inceptionv3, Inceptionv4, InceptionResNetv2, Xception,
       SqueezeNet, MobileNetv1, MobileNetv2, MobileNetv3, MNASNet,
       EfficientNet, EfficientNetv2, ConvMixer, ConvNeXt,
       MLPMixer, ResMLP, gMLP, ViT, UNet

# use Flux._big_show to pretty print large models
for T in (:AlexNet, :VGG, :SqueezeNet, :ResNet, :WideResNet, :ResNeXt,
          :SEResNet, :SEResNeXt, :Res2Net, :Res2NeXt, :GoogLeNet, :DenseNet,
          :Inceptionv3, :Inceptionv4, :InceptionResNetv2, :Xception,
          :MobileNetv1, :MobileNetv2, :MobileNetv3, :MNASNet,
          :EfficientNet, :EfficientNetv2, :ConvMixer, :ConvNeXt,
          :MLPMixer, :ResMLP, :gMLP, :ViT, :UNet)
    @eval Base.show(io::IO, ::MIME"text/plain", model::$T) = _maybe_big_show(io, model)
end

end # module
