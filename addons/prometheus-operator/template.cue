package main
output: {
	apiVersion: "core.oam.dev/v1beta1"
	kind:       "Application"
	spec: {
		components: [
			{
				type: "k8s-objects"
				name: "po-ns"
				properties: objects: [{
					apiVersion: "v1"
					kind:       "Namespace"
					metadata: name: parameter.namespace
				}]
			},  {
				type: "k8s-objects"
				name: "po-crds"
				properties: objects: [
					alertmanagerconfigsCrd,
					alertmanagersCrd,
					podmonitorsCrd,
					probesCrd,
					prometheusesCrd,
					prometheusrulesCrd,
					servicemonitorsCrd,
					thanosrulersCrd
				]
			}, {
				type: "k8s-objects"
				name: "po-server"
				properties: objects: prometheusOperator
				traits: [{
					type: "service-account"
					properties: {
						name:   "prometheus-operator"
						create: true
						privileges: [ for p in _clusterPrivileges {
							scope: "cluster"
							{p}
						}]
					}
				}]
			}
		]
		policies: [
			{
				type: "shared-resource"
				name: "namespace"
				properties: rules: [{
					selector: resourceTypes: ["Namespace"]
				}]
			},
			{
				type: "topology"
				name: "deploy-po-ns"
				properties: {
					namespace: parameter.namespace
					if parameter.clusters != _|_ {
						clusters: parameter.clusters
					}
					if parameter.clusters == _|_ {
						clusterLabelSelector: {}
					}
				}
			},
			{
				type: "garbage-collect"
				name: "not-gc-CRD"
				properties: {
					rules: [{
						selector: resourceTypes: ["CustomResourceDefinition"]
						strategy: "never"
					},
					]
				}
			},
			{
				type: "apply-once"
				name: "not-keep-CRD"
				properties: {
					rules: [{
						selector: resourceTypes: ["CustomResourceDefinition"]
						strategy: {
							path: ["*"]
						}
					},
					]
				}
			},
		]
	}
}

_clusterPrivileges: [{
	apiGroups: [
		"monitoring.coreos.com",
	]
	resources: [
		"alertmanagers",
		"alertmanagers/finalizers",
		"alertmanagerconfigs",
		"prometheuses",
		"prometheuses/finalizers",
		"prometheuses/status",
		"thanosrulers",
		"thanosrulers/finalizers",
		"servicemonitors",
		"podmonitors",
		"probes",
		"prometheusrules",
	]
	verbs: [
		"*",
	]
}, {
	apiGroups: [
		"apps",
	]
	resources: [
		"statefulsets",
	]
	verbs: [
		"*",
	]
}, {
	apiGroups: [
		"",
	]
	resources: [
		"configmaps",
		"secrets",
	]
	verbs: [
		"*",
	]
}, {
	apiGroups: [
		"",
	]
	resources: [
		"pods",
	]
	verbs: [
		"list",
		"delete",
	]
}, {
	apiGroups: [
		"",
	]
	resources: [
		"services",
		"services/finalizers",
		"endpoints",
	]
	verbs: [
		"get",
		"create",
		"update",
		"delete",
	]
}, {
	apiGroups: [
		"",
	]
	resources: [
		"nodes",
	]
	verbs: [
		"list",
		"watch",
	]
}, {
	apiGroups: [
		"",
	]
	resources: [
		"namespaces",
	]
	verbs: [
		"get",
		"list",
		"watch",
	]
}, {
	apiGroups: [
		"networking.k8s.io",
	]
	resources: [
		"ingresses",
	]
	verbs: [
		"get",
		"list",
		"watch",
	]
}, {
	apiGroups: [
		"authentication.k8s.io",
	]
	resources: [
		"tokenreviews",
	]
	verbs: [
		"create",
	]
}, {
	apiGroups: [
		"authorization.k8s.io",
	]
	resources: [
		"subjectaccessreviews",
	]
	verbs: ["create"]
}]