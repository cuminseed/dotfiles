set -v
vagrant destroy -f && rm -rf .vagrant && rm -f package.box && vagrant up && vagrant halt && vagrant package
