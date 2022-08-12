#! /bin/sh
DIR=${1:-'services'}
FORMAT=${2:-'html'}
OUTPUT=${3:-'index.html'}
case $DIR in
  services)
    cd $DIR
    ;;
  *)
    echo "Unknown proto directory '$DIR'"   
    ;;
esac

docker run --rm \
  -v $(pwd):/out \
  -v $(pwd):/protos \
  pseudomuto/protoc-gen-doc:latest --doc_opt=${FORMAT},${OUTPUT}
mv $OUTPUT ../
