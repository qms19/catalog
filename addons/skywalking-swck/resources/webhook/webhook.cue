package main
webhook: [ {
	apiVersion: "admissionregistration.k8s.io/v1"
	kind:       "MutatingWebhookConfiguration"
	metadata: {
		annotations: "cert-manager.io/inject-ca-from": "skywalking-swck-system/skywalking-swck-serving-cert"
		name: "skywalking-swck-mutating-webhook-configuration"
	}
	webhooks: [{
		admissionReviewVersions: [
			"v1",
		]
		clientConfig: service: {
			name:      "skywalking-swck-webhook-service"
			namespace: "skywalking-swck-system"
			path:      "/mutate-v1-pod"
		}
		failurePolicy: "Fail"
		name:          "mpod.kb.io"
		namespaceSelector: matchLabels: "swck-injection": "enabled"
		rules: [{
			apiGroups: [
				"",
			]
			apiVersions: [
				"v1",
			]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: [
				"pods",
			]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: [
			"v1",
		]
		clientConfig: service: {
			name:      "skywalking-swck-webhook-service"
			namespace: "skywalking-swck-system"
			path:      "/mutate-operator-skywalking-apache-org-v1alpha1-fetcher"
		}
		failurePolicy: "Fail"
		name:          "mfetcher.kb.io"
		rules: [{
			apiGroups: [
				"operator.skywalking.apache.org",
			]
			apiVersions: [
				"v1alpha1",
			]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: [
				"fetchers",
			]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: [
			"v1",
		]
		clientConfig: service: {
			name:      "skywalking-swck-webhook-service"
			namespace: "skywalking-swck-system"
			path:      "/mutate-operator-skywalking-apache-org-v1alpha1-javaagent"
		}
		failurePolicy: "Fail"
		name:          "mjavaagent.kb.io"
		rules: [{
			apiGroups: [
				"operator.skywalking.apache.org",
			]
			apiVersions: [
				"v1alpha1",
			]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: [
				"javaagents",
			]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: [
			"v1",
		]
		clientConfig: service: {
			name:      "skywalking-swck-webhook-service"
			namespace: "skywalking-swck-system"
			path:      "/mutate-operator-skywalking-apache-org-v1alpha1-oapserver"
		}
		failurePolicy: "Fail"
		name:          "moapserver.kb.io"
		rules: [{
			apiGroups: [
				"operator.skywalking.apache.org",
			]
			apiVersions: [
				"v1alpha1",
			]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: [
				"oapservers",
			]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: [
			"v1",
		]
		clientConfig: service: {
			name:      "skywalking-swck-webhook-service"
			namespace: "skywalking-swck-system"
			path:      "/mutate-operator-skywalking-apache-org-v1alpha1-satellite"
		}
		failurePolicy: "Fail"
		name:          "msatellite.kb.io"
		rules: [{
			apiGroups: [
				"operator.skywalking.apache.org",
			]
			apiVersions: [
				"v1alpha1",
			]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: [
				"satellites",
			]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: [
			"v1",
		]
		clientConfig: service: {
			name:      "skywalking-swck-webhook-service"
			namespace: "skywalking-swck-system"
			path:      "/mutate-operator-skywalking-apache-org-v1alpha1-storage"
		}
		failurePolicy: "Fail"
		name:          "mstorage.kb.io"
		rules: [{
			apiGroups: [
				"operator.skywalking.apache.org",
			]
			apiVersions: [
				"v1alpha1",
			]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: [
				"storages",
			]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: [
			"v1",
		]
		clientConfig: service: {
			name:      "skywalking-swck-webhook-service"
			namespace: "skywalking-swck-system"
			path:      "/mutate-operator-skywalking-apache-org-v1alpha1-ui"
		}
		failurePolicy: "Fail"
		name:          "mui.kb.io"
		rules: [{
			apiGroups: [
				"operator.skywalking.apache.org",
			]
			apiVersions: [
				"v1alpha1",
			]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: [
				"uis",
			]
		}]
		sideEffects: "None"
	}]
}, {
	apiVersion: "admissionregistration.k8s.io/v1"
	kind:       "ValidatingWebhookConfiguration"
	metadata: {
		annotations: "cert-manager.io/inject-ca-from": "skywalking-swck-system/skywalking-swck-serving-cert"
		name: "skywalking-swck-validating-webhook-configuration"
	}
	webhooks: [{
		admissionReviewVersions: [
			"v1",
		]
		clientConfig: service: {
			name:      "skywalking-swck-webhook-service"
			namespace: "skywalking-swck-system"
			path:      "/validate-operator-skywalking-apache-org-v1alpha1-fetcher"
		}
		failurePolicy: "Fail"
		name:          "vfetcher.kb.io"
		rules: [{
			apiGroups: [
				"operator.skywalking.apache.org",
			]
			apiVersions: [
				"v1alpha1",
			]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: [
				"fetchers",
			]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: [
			"v1",
		]
		clientConfig: service: {
			name:      "skywalking-swck-webhook-service"
			namespace: "skywalking-swck-system"
			path:      "/validate-operator-skywalking-apache-org-v1alpha1-javaagent"
		}
		failurePolicy: "Fail"
		name:          "vjavaagent.kb.io"
		rules: [{
			apiGroups: [
				"operator.skywalking.apache.org",
			]
			apiVersions: [
				"v1alpha1",
			]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: [
				"javaagents",
			]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: [
			"v1",
		]
		clientConfig: service: {
			name:      "skywalking-swck-webhook-service"
			namespace: "skywalking-swck-system"
			path:      "/validate-operator-skywalking-apache-org-v1alpha1-oapserver"
		}
		failurePolicy: "Fail"
		name:          "voapserver.kb.io"
		rules: [{
			apiGroups: [
				"operator.skywalking.apache.org",
			]
			apiVersions: [
				"v1alpha1",
			]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: [
				"oapservers",
			]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: [
			"v1",
		]
		clientConfig: service: {
			name:      "skywalking-swck-webhook-service"
			namespace: "skywalking-swck-system"
			path:      "/validate-operator-skywalking-apache-org-v1alpha1-satellite"
		}
		failurePolicy: "Fail"
		name:          "vsatellite.kb.io"
		rules: [{
			apiGroups: [
				"operator.skywalking.apache.org",
			]
			apiVersions: [
				"v1alpha1",
			]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: [
				"satellites",
			]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: [
			"v1",
		]
		clientConfig: service: {
			name:      "skywalking-swck-webhook-service"
			namespace: "skywalking-swck-system"
			path:      "/validate-operator-skywalking-apache-org-v1alpha1-storage"
		}
		failurePolicy: "Fail"
		name:          "vstorage.kb.io"
		rules: [{
			apiGroups: [
				"operator.skywalking.apache.org",
			]
			apiVersions: [
				"v1alpha1",
			]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: [
				"storages",
			]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: [
			"v1",
		]
		clientConfig: service: {
			name:      "skywalking-swck-webhook-service"
			namespace: "skywalking-swck-system"
			path:      "/validate-operator-skywalking-apache-org-v1alpha1-ui"
		}
		failurePolicy: "Fail"
		name:          "vui.kb.io"
		rules: [{
			apiGroups: [
				"operator.skywalking.apache.org",
			]
			apiVersions: [
				"v1alpha1",
			]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: [
				"uis",
			]
		}]
		sideEffects: "None"
	}]
}]