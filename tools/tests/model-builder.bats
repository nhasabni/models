
setup()
{
  COMMANDS="$(model-builder commands)"
  MODELS_ALL="$(model-builder models)"
}

teardown()
{
  MODELS=()
}

last_built()
{
  local _image _created _os=$(uname -s)
  _image=$(docker images | grep $1 | head -1 | awk '{printf("%s:%s\n", $1, $2)}')
  _created="$(docker inspect $_image --format '{{.Created}}' | sed 's/T/ /g' | sed 's/\.[0-9]*Z$//')"
  case "$_os" in
    Darwin)
      echo $(( $(date +%s) - $(date -juf'%Y-%m-%d %H:%M:%S' "$_created" +%s) ))
      ;;
    Linux)
      echo $(( $(date +%s) - $(date --utc --date="$_created" '+%s') ))
      ;;
  esac
}

last_modified()
{
  local _os=$(uname -s)
  case "$_os" in
    Darwin)
      echo $(( $(date +%s) - $(stat -f%c $1) ))
      ;;
    Linux)
      expr $(date +%s) - $(stat -c %Y $1)
      ;;
  esac
}

@test "validate 'model-builder commands'" {
  run model-builder commands
  (( $status == 0 ))
  [[ $output == $COMMANDS ]]
}


@test "validate 'model-builder models'" {
  run model-builder models
  (( $status == 0 ))
  [[ $output == $MODELS_ALL ]]
}

#
# DO NOT EDIT BELOW THIS LINE - generated by model-builder-test-suite-generator Wed Aug 5 15:08:30 PDT 2020
# *** tests for generate-documentation ***
#

@test "validate generate-documentation for bert-large-fp32-inference creates quickstart/language_modeling/tensorflow/bert_large/inference/fp32/README.md" {
      run model-builder -q generate-documentation bert-large-fp32-inference
      (( $status == 0 ))
      (( $(last_modified quickstart/language_modeling/tensorflow/bert_large/inference/fp32/README.md) <= 50 ))
    }
@test "validate generate-documentation for bert-large-fp32-training creates quickstart/language_modeling/tensorflow/bert_large/training/fp32/README.md" {
      run model-builder -q generate-documentation bert-large-fp32-training
      (( $status == 0 ))
      (( $(last_modified quickstart/language_modeling/tensorflow/bert_large/training/fp32/README.md) <= 50 ))
    }
@test "validate generate-documentation for mobilenet-v1-fp32-inference creates quickstart/image_recognition/tensorflow/mobilenet_v1/inference/fp32/README.md" {
      run model-builder -q generate-documentation mobilenet-v1-fp32-inference
      (( $status == 0 ))
      (( $(last_modified quickstart/image_recognition/tensorflow/mobilenet_v1/inference/fp32/README.md) <= 50 ))
    }
@test "validate generate-documentation for resnet50-fp32-inference creates quickstart/image_recognition/tensorflow/resnet50/inference/fp32/README.md" {
      run model-builder -q generate-documentation resnet50-fp32-inference
      (( $status == 0 ))
      (( $(last_modified quickstart/image_recognition/tensorflow/resnet50/inference/fp32/README.md) <= 50 ))
    }
@test "validate generate-documentation for resnet50v1-5-fp32-inference creates quickstart/image_recognition/tensorflow/resnet50v1_5/inference/fp32/README.md" {
      run model-builder -q generate-documentation resnet50v1-5-fp32-inference
      (( $status == 0 ))
      (( $(last_modified quickstart/image_recognition/tensorflow/resnet50v1_5/inference/fp32/README.md) <= 50 ))
    }
@test "validate generate-documentation for resnet50v1-5-fp32-training creates quickstart/image_recognition/tensorflow/resnet50v1_5/training/fp32/README.md" {
      run model-builder -q generate-documentation resnet50v1-5-fp32-training
      (( $status == 0 ))
      (( $(last_modified quickstart/image_recognition/tensorflow/resnet50v1_5/training/fp32/README.md) <= 50 ))
    }
@test "validate generate-documentation for rfcn-fp32-inference creates quickstart/object_detection/tensorflow/rfcn/inference/fp32/README.md" {
      run model-builder -q generate-documentation rfcn-fp32-inference
      (( $status == 0 ))
      (( $(last_modified quickstart/object_detection/tensorflow/rfcn/inference/fp32/README.md) <= 50 ))
    }
@test "validate generate-documentation for ssd-mobilenet-fp32-inference creates quickstart/object_detection/tensorflow/ssd-mobilenet/inference/fp32/README.md" {
      run model-builder -q generate-documentation ssd-mobilenet-fp32-inference
      (( $status == 0 ))
      (( $(last_modified quickstart/object_detection/tensorflow/ssd-mobilenet/inference/fp32/README.md) <= 50 ))
    }
@test "validate generate-documentation for transformer-lt-official-fp32-inference creates quickstart/language_translation/tensorflow/transformer_lt_official/inference/fp32/README.md" {
      run model-builder -q generate-documentation transformer-lt-official-fp32-inference
      (( $status == 0 ))
      (( $(last_modified quickstart/language_translation/tensorflow/transformer_lt_official/inference/fp32/README.md) <= 50 ))
    }
@test "validate generate-documentation for wide-deep-fp32-inference creates quickstart/recommendation/tensorflow/wide_deep/inference/fp32/README.md" {
      run model-builder -q generate-documentation wide-deep-fp32-inference
      (( $status == 0 ))
      (( $(last_modified quickstart/recommendation/tensorflow/wide_deep/inference/fp32/README.md) <= 50 ))
    }
@test "validate generate-documentation for wide-deep-large-ds-fp32-training creates quickstart/recommendation/tensorflow/wide_deep_large_ds/training/fp32/README.md" {
      run model-builder -q generate-documentation wide-deep-large-ds-fp32-training
      (( $status == 0 ))
      (( $(last_modified quickstart/recommendation/tensorflow/wide_deep_large_ds/training/fp32/README.md) <= 50 ))
    }

#
# *** tests for generate-dockerfile ***
#

@test "validate generate-dockerfile for bert-large-fp32-inference creates intel-tf-language-modeling-bert-large-fp32-inference.Dockerfile" {
    run model-builder -q generate-dockerfile bert-large-fp32-inference
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-language-modeling-bert-large-fp32-inference.Dockerfile ]]
    (( $(last_modified dockerfiles/model_containers/intel-tf-language-modeling-bert-large-fp32-inference.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for bert-large-fp32-training creates intel-tf-language-modeling-bert-large-fp32-training.Dockerfile" {
    run model-builder -q generate-dockerfile bert-large-fp32-training
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-language-modeling-bert-large-fp32-training.Dockerfile ]]
    (( $(last_modified dockerfiles/model_containers/intel-tf-language-modeling-bert-large-fp32-training.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for image-recognition creates intel-tf-image-recognition.Dockerfile" {
    run model-builder -q generate-dockerfile image-recognition
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-image-recognition.Dockerfile ]]
    (( $(last_modified dockerfiles/intel-tf-image-recognition.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for language-modeling creates intel-tf-language-modeling.Dockerfile" {
    run model-builder -q generate-dockerfile language-modeling
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-language-modeling.Dockerfile ]]
    (( $(last_modified dockerfiles/intel-tf-language-modeling.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for language-translation creates intel-tf-language-translation.Dockerfile" {
    run model-builder -q generate-dockerfile language-translation
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-language-translation.Dockerfile ]]
    (( $(last_modified dockerfiles/intel-tf-language-translation.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for mobilenet-v1-fp32-inference creates intel-tf-image-recognition-mobilenet-v1-fp32-inference.Dockerfile" {
    run model-builder -q generate-dockerfile mobilenet-v1-fp32-inference
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-image-recognition-mobilenet-v1-fp32-inference.Dockerfile ]]
    (( $(last_modified dockerfiles/model_containers/intel-tf-image-recognition-mobilenet-v1-fp32-inference.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for object-detection creates intel-tf-object-detection.Dockerfile" {
    run model-builder -q generate-dockerfile object-detection
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-object-detection.Dockerfile ]]
    (( $(last_modified dockerfiles/intel-tf-object-detection.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for preprocess-coco-val creates intel-tf-object-detection-preprocess-coco-val.Dockerfile" {
    run model-builder -q generate-dockerfile preprocess-coco-val
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-object-detection-preprocess-coco-val.Dockerfile ]]
    (( $(last_modified dockerfiles/dataset_containers/intel-tf-object-detection-preprocess-coco-val.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for resnet50-fp32-inference creates intel-tf-image-recognition-resnet50-fp32-inference.Dockerfile" {
    run model-builder -q generate-dockerfile resnet50-fp32-inference
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-image-recognition-resnet50-fp32-inference.Dockerfile ]]
    (( $(last_modified dockerfiles/model_containers/intel-tf-image-recognition-resnet50-fp32-inference.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for resnet50v1-5-fp32-inference creates intel-tf-image-recognition-resnet50v1-5-fp32-inference.Dockerfile" {
    run model-builder -q generate-dockerfile resnet50v1-5-fp32-inference
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-image-recognition-resnet50v1-5-fp32-inference.Dockerfile ]]
    (( $(last_modified dockerfiles/model_containers/intel-tf-image-recognition-resnet50v1-5-fp32-inference.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for resnet50v1-5-fp32-training creates intel-tf-image-recognition-resnet50v1-5-fp32-training.Dockerfile" {
    run model-builder -q generate-dockerfile resnet50v1-5-fp32-training
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-image-recognition-resnet50v1-5-fp32-training.Dockerfile ]]
    (( $(last_modified dockerfiles/model_containers/intel-tf-image-recognition-resnet50v1-5-fp32-training.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for rfcn-fp32-inference creates intel-tf-object-detection-rfcn-fp32-inference.Dockerfile" {
    run model-builder -q generate-dockerfile rfcn-fp32-inference
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-object-detection-rfcn-fp32-inference.Dockerfile ]]
    (( $(last_modified dockerfiles/model_containers/intel-tf-object-detection-rfcn-fp32-inference.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for ssd-mobilenet-fp32-inference creates intel-tf-object-detection-ssd-mobilenet-fp32-inference.Dockerfile" {
    run model-builder -q generate-dockerfile ssd-mobilenet-fp32-inference
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-object-detection-ssd-mobilenet-fp32-inference.Dockerfile ]]
    (( $(last_modified dockerfiles/model_containers/intel-tf-object-detection-ssd-mobilenet-fp32-inference.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for transformer-lt-official-fp32-inference creates intel-tf-language-translation-transformer-lt-official-fp32-inference.Dockerfile" {
    run model-builder -q generate-dockerfile transformer-lt-official-fp32-inference
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-language-translation-transformer-lt-official-fp32-inference.Dockerfile ]]
    (( $(last_modified dockerfiles/model_containers/intel-tf-language-translation-transformer-lt-official-fp32-inference.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for wide-deep-fp32-inference creates intel-tf-recommendation-wide-deep-fp32-inference.Dockerfile" {
    run model-builder -q generate-dockerfile wide-deep-fp32-inference
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-recommendation-wide-deep-fp32-inference.Dockerfile ]]
    (( $(last_modified dockerfiles/model_containers/intel-tf-recommendation-wide-deep-fp32-inference.Dockerfile) <= 50 ))
  }
@test "validate generate-dockerfile for wide-deep-large-ds-fp32-training creates intel-tf-recommendation-wide-deep-large-ds-fp32-training.Dockerfile" {
    run model-builder -q generate-dockerfile wide-deep-large-ds-fp32-training
    (( $status == 0 ))
    [[ "${lines[@]}" =~ intel-tf-recommendation-wide-deep-large-ds-fp32-training.Dockerfile ]]
    (( $(last_modified dockerfiles/model_containers/intel-tf-recommendation-wide-deep-large-ds-fp32-training.Dockerfile) <= 50 ))
  }

#
# *** tests for package ***
#

@test "validate package for bert-large-fp32-inference creates bert-large-fp32-inference.tar.gz" {
      run model-builder -q package bert-large-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ bert-large-fp32-inference.tar.gz ]]
      (( $(last_modified output/bert-large-fp32-inference.tar.gz) <= 50 ))
    }
@test "validate package for bert-large-fp32-training creates bert-large-fp32-training.tar.gz" {
      run model-builder -q package bert-large-fp32-training
      (( $status == 0 ))
      [[ "${lines[@]}" =~ bert-large-fp32-training.tar.gz ]]
      (( $(last_modified output/bert-large-fp32-training.tar.gz) <= 50 ))
    }
@test "validate package for mobilenet-v1-fp32-inference creates mobilenet-v1-fp32-inference.tar.gz" {
      run model-builder -q package mobilenet-v1-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ mobilenet-v1-fp32-inference.tar.gz ]]
      (( $(last_modified output/mobilenet-v1-fp32-inference.tar.gz) <= 50 ))
    }
@test "validate package for resnet50-fp32-inference creates resnet50-fp32-inference.tar.gz" {
      run model-builder -q package resnet50-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ resnet50-fp32-inference.tar.gz ]]
      (( $(last_modified output/resnet50-fp32-inference.tar.gz) <= 50 ))
    }
@test "validate package for resnet50v1-5-fp32-inference creates resnet50v1-5-fp32-inference.tar.gz" {
      run model-builder -q package resnet50v1-5-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ resnet50v1-5-fp32-inference.tar.gz ]]
      (( $(last_modified output/resnet50v1-5-fp32-inference.tar.gz) <= 50 ))
    }
@test "validate package for resnet50v1-5-fp32-training creates resnet50v1-5-fp32-training.tar.gz" {
      run model-builder -q package resnet50v1-5-fp32-training
      (( $status == 0 ))
      [[ "${lines[@]}" =~ resnet50v1-5-fp32-training.tar.gz ]]
      (( $(last_modified output/resnet50v1-5-fp32-training.tar.gz) <= 50 ))
    }
@test "validate package for rfcn-fp32-inference creates rfcn-fp32-inference.tar.gz" {
      run model-builder -q package rfcn-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ rfcn-fp32-inference.tar.gz ]]
      (( $(last_modified output/rfcn-fp32-inference.tar.gz) <= 50 ))
    }
@test "validate package for ssd-mobilenet-fp32-inference creates ssd-mobilenet-fp32-inference.tar.gz" {
      run model-builder -q package ssd-mobilenet-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ ssd-mobilenet-fp32-inference.tar.gz ]]
      (( $(last_modified output/ssd-mobilenet-fp32-inference.tar.gz) <= 50 ))
    }
@test "validate package for transformer-lt-official-fp32-inference creates transformer-lt-official-fp32-inference.tar.gz" {
      run model-builder -q package transformer-lt-official-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ transformer-lt-official-fp32-inference.tar.gz ]]
      (( $(last_modified output/transformer-lt-official-fp32-inference.tar.gz) <= 50 ))
    }
@test "validate package for wide-deep-fp32-inference creates wide-deep-fp32-inference.tar.gz" {
      run model-builder -q package wide-deep-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ wide-deep-fp32-inference.tar.gz ]]
      (( $(last_modified output/wide-deep-fp32-inference.tar.gz) <= 50 ))
    }
@test "validate package for wide-deep-large-ds-fp32-training creates wide-deep-large-ds-fp32-training.tar.gz" {
      run model-builder -q package wide-deep-large-ds-fp32-training
      (( $status == 0 ))
      [[ "${lines[@]}" =~ wide-deep-large-ds-fp32-training.tar.gz ]]
      (( $(last_modified output/wide-deep-large-ds-fp32-training.tar.gz) <= 50 ))
    }

#
# *** tests for build ***
#

@test "validate build image for bert-large-fp32-inference creates model-zoo:2.3.0-language-modeling-bert-large-fp32-inference" {
      run model-builder -q --nocache build bert-large-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ bert-large-fp32-inference ]]
    }
@test "validate build image for bert-large-fp32-training creates model-zoo:2.3.0-language-modeling-bert-large-fp32-training" {
      run model-builder -q --nocache build bert-large-fp32-training
      (( $status == 0 ))
      [[ "${lines[@]}" =~ bert-large-fp32-training ]]
    }
@test "validate build image for image-recognition creates model-zoo:2.3.0-image-recognition" {
      run model-builder -q --nocache build image-recognition
      (( $status == 0 ))
      [[ "${lines[@]}" =~ image-recognition ]]
    }
@test "validate build image for language-modeling creates model-zoo:2.3.0-language-modeling" {
      run model-builder -q --nocache build language-modeling
      (( $status == 0 ))
      [[ "${lines[@]}" =~ language-modeling ]]
    }
@test "validate build image for language-translation creates model-zoo:2.3.0-language-translation" {
      run model-builder -q --nocache build language-translation
      (( $status == 0 ))
      [[ "${lines[@]}" =~ language-translation ]]
    }
@test "validate build image for mobilenet-v1-fp32-inference creates model-zoo:2.3.0-image-recognition-mobilenet-v1-fp32-inference" {
      run model-builder -q --nocache build mobilenet-v1-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ mobilenet-v1-fp32-inference ]]
    }
@test "validate build image for object-detection creates model-zoo:2.3.0-object-detection" {
      run model-builder -q --nocache build object-detection
      (( $status == 0 ))
      [[ "${lines[@]}" =~ object-detection ]]
    }
@test "validate build image for resnet50-fp32-inference creates model-zoo:2.3.0-image-recognition-resnet50-fp32-inference" {
      run model-builder -q --nocache build resnet50-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ resnet50-fp32-inference ]]
    }
@test "validate build image for resnet50v1-5-fp32-inference creates model-zoo:2.3.0-image-recognition-resnet50v1-5-fp32-inference" {
      run model-builder -q --nocache build resnet50v1-5-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ resnet50v1-5-fp32-inference ]]
    }
@test "validate build image for resnet50v1-5-fp32-training creates model-zoo:2.3.0-image-recognition-resnet50v1-5-fp32-training" {
      run model-builder -q --nocache build resnet50v1-5-fp32-training
      (( $status == 0 ))
      [[ "${lines[@]}" =~ resnet50v1-5-fp32-training ]]
    }
@test "validate build image for resnet50v1-5-int8-inference creates model-zoo:2.3.0-image-recognition-resnet50v1-5-int8-inference" {
      run model-builder -q --nocache build resnet50v1-5-int8-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ resnet50v1-5-int8-inference ]]
    }
@test "validate build image for rfcn-fp32-inference creates model-zoo:2.3.0-object-detection-rfcn-fp32-inference" {
      run model-builder -q --nocache build rfcn-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ rfcn-fp32-inference ]]
    }
@test "validate build image for ssd-mobilenet-fp32-inference creates model-zoo:2.3.0-object-detection-ssd-mobilenet-fp32-inference" {
      run model-builder -q --nocache build ssd-mobilenet-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ ssd-mobilenet-fp32-inference ]]
    }
@test "validate build image for ssd-resnet34-fp32-inference creates model-zoo:2.3.0-object-detection-ssd-resnet34-fp32-inference" {
      run model-builder -q --nocache build ssd-resnet34-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ ssd-resnet34-fp32-inference ]]
    }
@test "validate build image for ssd-resnet34-int8-inference creates model-zoo:2.3.0-object-detection-ssd-resnet34-int8-inference" {
      run model-builder -q --nocache build ssd-resnet34-int8-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ ssd-resnet34-int8-inference ]]
    }
@test "validate build image for transformer-lt-official-fp32-inference creates model-zoo:2.3.0-language-translation-transformer-lt-official-fp32-inference" {
      run model-builder -q --nocache build transformer-lt-official-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ transformer-lt-official-fp32-inference ]]
    }
@test "validate build image for wide-deep-fp32-inference creates model-zoo:2.3.0-recommendation-wide-deep-fp32-inference" {
      run model-builder -q --nocache build wide-deep-fp32-inference
      (( $status == 0 ))
      [[ "${lines[@]}" =~ wide-deep-fp32-inference ]]
    }
@test "validate build image for wide-deep-large-ds-fp32-training creates model-zoo:2.3.0-recommendation-wide-deep-large-ds-fp32-training" {
      run model-builder -q --nocache build wide-deep-large-ds-fp32-training
      (( $status == 0 ))
      [[ "${lines[@]}" =~ wide-deep-large-ds-fp32-training ]]
    }
