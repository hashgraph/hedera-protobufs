#! /bin/sh
mkdir hedera
cp -r mirror/* services/* streams/* hedera
DIR=${1:-'hedera'}
case $DIR in
  hedera)
    cd $DIR
    ;;
  *)
    echo "Unknown proto directory '$DIR'"   
    ;;
esac

docker run --rm \
  -v $(pwd):/out \
  -v $(pwd):/protos \
  pseudomuto/protoc-gen-doc
mv index.html ../

cd -
rm -rf hedera
