package main
output: {
	apiVersion: "core.oam.dev/v1beta1"
	kind:       "Application"
	spec: {
		components: [
			{
				type: "k8s-objects"
				name: "swck-ns"
				properties: objects: [{
					apiVersion: "v1"
					kind:       "Namespace"
					metadata: name: "skywalking-swck-system"
					metadata: labels: "control-plane": "controller-manager"
				}]
			}, {
				type: "k8s-objects"
				name: "swck-rbac"
				properties: objects: rbac
			}, {
				type: "k8s-objects"
				name: "swck-crds"
				properties: objects: [
					fetchersCrd,
					javaagentsCrd,
					oapserversCrd,
					satellitesCrd,
					storagesCrd,
					uisCrd
				]
			}, {
				type: "k8s-objects"
				name: "swck-cert"
				properties: objects: swckCertManager
			}, {
				type: "k8s-objects"
				name: "swck-webhook"
				properties: objects: webhook
			}, {
				type: "k8s-objects"
				name: "swck-controller-manager"
				properties: objects: [
					javaAgentConfigmap,
					managerConfig
				] + controllerManager
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
				name: "deploy-fluxcd-ns"
				properties: {
					namespace: "skywalking-swck-system"
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
