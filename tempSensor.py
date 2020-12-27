import requests as req

uptime=43
headers = {'Authorization': 'Bearer !secret', 'content-type': 'application/json'}
url = 'http://localhost:8123/api/states/sensor.router_uptime'
data = '{"state": "'+str(uptime)+'", "attributes": {"unit_of_measurement": "hours", "icon": "mdi:clock-start", "friendly_name": "Router Uptime"}}'
response = req.post(url, headers=headers, data=data)
