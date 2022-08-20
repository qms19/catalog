package main

alertmanager: {
	name: "alertmanager"
	type: "webservice"
	properties: {
		image:           parameter["image"]
		imagePullPolicy: parameter["imagePullPolicy"]
		labels: {
			"app.kubernetes.io/name": "alertmanager"
			"prometheus.io/scrape":   "true"
		}
		ports: [{
			name:     "http"
			port:     9093
			protocol: "TCP"
		}]
		livenessProbe: httpGet: {
			path: "/"
			port: 9093
		}
		readinessProbe: httpGet: {
			path: "/"
			port: 9093
		}
		volumeMounts: configMap: [{
			name:      "alertmanager-conf"
			mountPath: "/etc/alertmanager"
			cmName:    "alertmanager-conf"
		}]
	}
	traits: [{
		type: "command"
		properties: args: [
			"--storage.path=/alertmanager",
			"--config.file=/etc/alertmanager/alertmanager.yml",
		]
	}, {
		type: "resource"
		properties: {
			cpu:    parameter["cpu"]
			memory: parameter["memory"]
		}
	}, {
		type: "expose"
		properties: {
			port: [9093]
			annotations: {
				"prometheus.io/port":   "9093"
				"prometheus.io/scrape": "true"
				"prometheus.io/path":   "/metrics"
			}
		}
	}, {
		type: "storage"
		properties: pvc: [{
			name:      "alertmanager-data"
			mountPath: "/alertmanager"
			accessModes: ["ReadWriteOnce"]
			resources: requests: storage: "50Mi"
		}]
	}]
}
