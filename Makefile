install:
	sudo cp hotspot-custom-region.sh /usr/bin/hotspot-custom-region.sh
	sudo chmod +x /usr/bin/hotspot-custom-region.sh

	sudo cp hotspot-custom-region.service /etc/systemd/system/hotspot-custom-region.service
	sudo chmod 644 /etc/systemd/system/hotspot-custom-region.service

	sudo systemctl enable hotspot-custom-region.service



