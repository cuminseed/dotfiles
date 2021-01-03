vagrant destroy -f && rmdir /q /s .vagrant && del /q /s package.box && vagrant up && vagrant halt && vagrant package
