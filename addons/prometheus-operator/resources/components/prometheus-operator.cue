package main
prometheusOperator: [{
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		labels: {
			"app.kubernetes.io/component": "controller"
			"app.kubernetes.io/name":      "prometheus-operator"
			"app.kubernetes.io/part-of":   "kube-prometheus"
			"app.kubernetes.io/version":   "0.58.0"
		}
		name:      "prometheus-operator"
	}
	spec: {
		replicas: 1
		selector: matchLabels: {
			"app.kubernetes.io/component": "controller"
			"app.kubernetes.io/name":      "prometheus-operator"
			"app.kubernetes.io/part-of":   "kube-prometheus"
		}
		template: {
			metadata: {
				annotations: "kubectl.kubernetes.io/default-container": "prometheus-operator"
				labels: {
					"app.kubernetes.io/component": "controller"
					"app.kubernetes.io/name":      "prometheus-operator"
					"app.kubernetes.io/part-of":   "kube-prometheus"
					"app.kubernetes.io/version":   "0.58.0"
				}
			}
			spec: {
				automountServiceAccountToken: true
				containers: [{
					args: [
						"--kubelet-service=kube-system/kubelet",
						"--prometheus-config-reloader=quay.io/prometheus-operator/prometheus-config-reloader:v0.58.0",
					]
					image: parameter.image
					name:  "prometheus-operator"
					ports: [{
						containerPort: 8080
						name:          "http"
					}]
					resources: {
						limits: {
							cpu:    "200m"
							memory: "200Mi"
						}
						requests: {
							cpu:    "100m"
							memory: "100Mi"
						}
					}
					securityContext: {
						allowPrivilegeEscalation: false
						capabilities: drop: [
							"ALL",
						]
						readOnlyRootFilesystem: true
					}
				}, {
					args: [
						"--logtostderr",
						"--secure-listen-address=:8443",
						"--tls-cipher-suites=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305,TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305",
						"--upstream=http://127.0.0.1:8080/",
					]
					image: "quay.io/brancz/kube-rbac-proxy:v0.13.0"
					name:  "kube-rbac-proxy"
					ports: [{
						containerPort: 8443
						name:          "https"
					}]
					resources: {
						limits: {
							cpu:    "20m"
							memory: "40Mi"
						}
						requests: {
							cpu:    "10m"
							memory: "20Mi"
						}
					}
					securityContext: {
						allowPrivilegeEscalation: false
						capabilities: drop: [
							"ALL",
						]
						readOnlyRootFilesystem: true
						runAsGroup:             65532
						runAsNonRoot:           true
						runAsUser:              65532
					}
				}]
				nodeSelector: "kubernetes.io/os": "linux"
				securityContext: {
					runAsNonRoot: true
					runAsUser:    65534
				}
				serviceAccountName: "prometheus-operator"
			}
		}
	}
}, {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		labels: {
			"app.kubernetes.io/component": "controller"
			"app.kubernetes.io/name":      "prometheus-operator"
			"app.kubernetes.io/part-of":   "kube-prometheus"
			"app.kubernetes.io/version":   "0.58.0"
		}
		name:      "prometheus-operator"
	}
	spec: {
		clusterIP: "None"
		ports: [{
			name:       "https"
			port:       8443
			targetPort: "https"
		}]
		selector: {
			"app.kubernetes.io/component": "controller"
			"app.kubernetes.io/name":      "prometheus-operator"
			"app.kubernetes.io/part-of":   "kube-prometheus"
		}
	}
}, {
	apiVersion: "networking.k8s.io/v1"
	kind:       "NetworkPolicy"
	metadata: {
		labels: {
			"app.kubernetes.io/component": "controller"
			"app.kubernetes.io/name":      "prometheus-operator"
			"app.kubernetes.io/part-of":   "kube-prometheus"
			"app.kubernetes.io/version":   "0.58.0"
		}
		name:      "prometheus-operator"
	}
	spec: {
		egress: [ {}]
		ingress: [{
			from: [{
				podSelector: matchLabels: "app.kubernetes.io/name": "prometheus"
			}]
			ports: [{
				port:     8443
				protocol: "TCP"
			}]
		}]
		podSelector: matchLabels: {
			"app.kubernetes.io/component": "controller"
			"app.kubernetes.io/name":      "prometheus-operator"
			"app.kubernetes.io/part-of":   "kube-prometheus"
		}
		policyTypes: [
			"Egress",
			"Ingress",
		]
	}
}]
