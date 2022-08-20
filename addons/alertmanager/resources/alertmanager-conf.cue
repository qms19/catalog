package main

alertmanagerConf: {
	name: "alertmanager-conf"
	type: "k8s-objects"
	properties: objects: [{
		apiVersion: "v1"
		kind:       "ConfigMap"
		metadata: name: "alertmanager-conf"
		data: "alertmanager.yml": """
		global: {}
		receivers:
		- name: default-receiver
		route:
		  group_interval: 5m
		  group_wait: 15s
		  receiver: default-receiver
		  repeat_interval: 1h
		templates:
		- /etc/alertmanager/*.tmpl

		"""
	}]
}
