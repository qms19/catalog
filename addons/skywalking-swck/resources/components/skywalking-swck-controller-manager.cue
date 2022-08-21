package main
controllerManager: [ {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		labels: "control-plane": "controller-manager"
		name:      "skywalking-swck-controller-manager-metrics-service"
		namespace: "skywalking-swck-system"
	}
	spec: {
		ports: [{
			name:       "https"
			port:       8443
			protocol:   "TCP"
			targetPort: "https"
		}]
		selector: "control-plane": "controller-manager"
	}
}, {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name:      "skywalking-swck-webhook-service"
		namespace: "skywalking-swck-system"
	}
	spec: {
		ports: [{
			port:       443
			protocol:   "TCP"
			targetPort: 9443
		}]
		selector: "control-plane": "controller-manager"
	}
}, {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		labels: "control-plane": "controller-manager"
		name:      "skywalking-swck-controller-manager"
		namespace: "skywalking-swck-system"
	}
	spec: {
		replicas: 1
		selector: matchLabels: "control-plane": "controller-manager"
		template: {
			metadata: {
				annotations: "kubectl.kubernetes.io/default-container": "manager"
				labels: "control-plane": "controller-manager"
			}
			spec: {
				containers: [{
					args: [
						"--config=controller_manager_config.yaml",
					]
					command: [
						"/manager",
					]
					image:           "apache/skywalking-swck:v0.6.1"
					imagePullPolicy: "IfNotPresent"
					livenessProbe: {
						httpGet: {
							path: "/healthz"
							port: 8081
						}
						initialDelaySeconds: 15
						periodSeconds:       20
					}
					name: "manager"
					ports: [{
						containerPort: 9443
						name:          "webhook-server"
						protocol:      "TCP"
					}]
					readinessProbe: {
						httpGet: {
							path: "/readyz"
							port: 8081
						}
						initialDelaySeconds: 5
						periodSeconds:       10
					}
					resources: {
						limits: {
							cpu:    "500m"
							memory: "128Mi"
						}
						requests: {
							cpu:    "10m"
							memory: "64Mi"
						}
					}
					securityContext: allowPrivilegeEscalation: false
					volumeMounts: [{
						mountPath: "/tmp/k8s-webhook-server/serving-certs"
						name:      "cert"
						readOnly:  true
					}, {
						mountPath: "/controller_manager_config.yaml"
						name:      "manager-config"
						subPath:   "controller_manager_config.yaml"
					}]
				}, {
					args: [
						"--secure-listen-address=0.0.0.0:8443",
						"--upstream=http://127.0.0.1:8080/",
						"--logtostderr=true",
						"--v=10",
					]
					image: "gcr.io/kubebuilder/kube-rbac-proxy:v0.8.0"
					name:  "kube-rbac-proxy"
					ports: [{
						containerPort: 8443
						name:          "https"
						protocol:      "TCP"
					}]
				}]
				securityContext: runAsNonRoot: true
				serviceAccountName:            "skywalking-swck-controller-manager"
				terminationGracePeriodSeconds: 10
				volumes: [{
					name: "cert"
					secret: {
						defaultMode: 420
						secretName:  "skywalking-swck-controller-manager-cert"
					}
				}, {
					configMap: name: "skywalking-swck-manager-config"
					name: "manager-config"
				}]
			}
		}
	}
}
]