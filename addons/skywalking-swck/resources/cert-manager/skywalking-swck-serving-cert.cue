package main
swckCertManager: [{
	apiVersion: "cert-manager.io/v1"
	kind:       "Certificate"
	metadata: {
		name:      "skywalking-swck-serving-cert"
		namespace: "skywalking-swck-system"
	}
	spec: {
		dnsNames: [
			"skywalking-swck-webhook-service.skywalking-swck-system.svc",
			"skywalking-swck-webhook-service.skywalking-swck-system.svc.cluster.local",
		]
		issuerRef: {
			kind: "Issuer"
			name: "skywalking-swck-selfsigned-issuer"
		}
		secretName: "skywalking-swck-controller-manager-cert"
	}
}, {
	apiVersion: "cert-manager.io/v1"
	kind:       "Issuer"
	metadata: {
		name:      "skywalking-swck-selfsigned-issuer"
		namespace: "skywalking-swck-system"
	}
	spec: selfSigned: {}
}
]