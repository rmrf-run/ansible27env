# Vagrant Stuff below
# removed brew install python to not interfere with existing install
# prep will take a while
# Only tested on a Mac
prep:
	brew cask install vagrant
	brew cask install VirtualBox
	brew cask install virtualbox-extension-pack
	vagrant plugin install vagrant-guest_ansible
up:
	vagrant up
down:
	vagrant suspend
destroy:
	vagrant destroy -f