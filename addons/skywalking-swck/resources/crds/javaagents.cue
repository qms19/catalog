package main
javaagentsCrd: {
	apiVersion: "apiextensions.k8s.io/v1"
	kind:       "CustomResourceDefinition"
	metadata: {
		annotations: {
			"cert-manager.io/inject-ca-from":        "skywalking-swck-system/skywalking-swck-serving-cert"
			"controller-gen.kubebuilder.io/version": "v0.7.0"
		}
		name: "javaagents.operator.skywalking.apache.org"
	}
	spec: {
		conversion: {
			strategy: "Webhook"
			webhook: {
				clientConfig: service: {
					name:      "skywalking-swck-webhook-service"
					namespace: "skywalking-swck-system"
					path:      "/convert"
				}
				conversionReviewVersions: [
					"v1",
				]
			}
		}
		group: "operator.skywalking.apache.org"
		names: {
			kind:     "JavaAgent"
			listKind: "JavaAgentList"
			plural:   "javaagents"
			singular: "javaagent"
		}
		scope: "Namespaced"
		versions: [{
			additionalPrinterColumns: [{
				description: "The selector label of injected Pod"
				jsonPath:    ".spec.podSelector"
				name:        "PodSelector"
				type:        "string"
			}, {
				description: "The name of service in the injected agent"
				jsonPath:    ".spec.serviceName"
				name:        "ServiceName"
				type:        "string"
			}, {
				description: "The backend service in the injected agent"
				jsonPath:    ".spec.backendService"
				name:        "BackendService"
				type:        "string"
			}]
			name: "v1alpha1"
			schema: openAPIV3Schema: {
				description: "JavaAgent is the Schema for the javaagents API"
				properties: {
					apiVersion: {
						description: "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"

						type: "string"
					}
					kind: {
						description: "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"

						type: "string"
					}
					metadata: type: "object"
					spec: {
						description: "JavaAgentSpec defines the desired state of JavaAgent"
						properties: {
							agentConfiguration: {
								additionalProperties: type: "string"
								description: "AgentConfiguration is the injected agent's final configuration"
								type:        "object"
							}
							backendService: {
								description: "BackendService is the backend service in the injected agent, which need to be printed"

								type: "string"
							}
							podSelector: {
								description: "PodSelector is the selector label of injected Pod"
								type:        "string"
							}
							serviceName: {
								description: "ServiceName is the name of service in the injected agent, which need to be printed"

								type: "string"
							}
						}
						type: "object"
					}
					status: {
						description: "JavaAgentStatus defines the observed state of JavaAgent"
						properties: {
							creationTime: {
								description: "The time the JavaAgent was created."
								format:      "date-time"
								type:        "string"
							}
							expectedInjectiedNum: {
								description: "The number of pods that need to be injected"
								type:        "integer"
							}
							lastUpdateTime: {
								description: "The last time this condition was updated."
								format:      "date-time"
								type:        "string"
							}
							realInjectedNum: {
								description: "The number of pods that injected successfully"
								type:        "integer"
							}
						}
						type: "object"
					}
				}
				type: "object"
			}
			served:  true
			storage: true
			subresources: status: {}
		}]
	}
	status: {
		acceptedNames: {
			kind:   ""
			plural: ""
		}
		conditions: []
		storedVersions: []
	}
}