## Hotspot Custom Region

A very simple adhoc script to force my raspberry pi to set the wifi-region to US. 

### Why
This is to enable 5 Ghz wifi channel that is disabled in my country. I configured my raspberry wlan0 as an access point. Using 2.4 GHz, the AP client can only get up to 4 Mbps download speed. By having this 5 GHz channel as the AP, the download speed is improved significantly (slightly above the download speed of my internet speed).  

## Install as Systemd Service
 `make install` then reboot. Otherwise you can start manually (without reboot) by `sudo systemctl start hotspot-custom-region.service`

## Troubleshoot
- Logging to `/var/log/syslog`. You can filter by `custom-region` string.
- You can check the status with `sudo systemctl status hotspot-custom-region.service` 
 
