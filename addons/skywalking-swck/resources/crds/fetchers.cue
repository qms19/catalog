package main
fetchersCrd: {
	apiVersion: "apiextensions.k8s.io/v1"
	kind:       "CustomResourceDefinition"
	metadata: {
		annotations: {
			"cert-manager.io/inject-ca-from":        "skywalking-swck-system/skywalking-swck-serving-cert"
			"controller-gen.kubebuilder.io/version": "v0.7.0"
		}
		name: "fetchers.operator.skywalking.apache.org"
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
			kind:     "Fetcher"
			listKind: "FetcherList"
			plural:   "fetchers"
			singular: "fetcher"
		}
		scope: "Namespaced"
		versions: [{
			name: "v1alpha1"
			schema: openAPIV3Schema: {
				description: "Fetcher is the Schema for the fetchers API"
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
						description: "FetcherSpec defines the desired state of Fetcher"
						properties: {
							OAPServerAddress: {
								description: "OAPServerAddress is the address of backend OAPServers"
								type:        "string"
							}
							clusterName: {
								description: "ClusterName"
								type:        "string"
							}
							type: {
								description: "Fetcher is the type of how to fetch metrics from target."
								items: {
									description: "FetcherType Type string describes ingress methods for a service"

									type: "string"
								}
								type: "array"
							}
						}
						type: "object"
					}
					status: {
						description: "FetcherStatus defines the observed state of Fetcher"
						properties: {
							conditions: {
								description: "Represents the latest available observations of a fetcher's current state."

								items: {
									description: "FetcherCondition describes the state of a deployment at a certain point."

									properties: {
										lastTransitionTime: {
											description: "Last time the condition transitioned from one status to another."

											format: "date-time"
											type:   "string"
										}
										lastUpdateTime: {
											description: "The last time this condition was updated."
											format:      "date-time"
											type:        "string"
										}
										message: {
											description: "A human readable message indicating details about the transition."

											type: "string"
										}
										status: {
											description: "Status of the condition, one of True, False, Unknown."
											type:        "string"
										}
										type: {
											description: "Type of deployment condition."
											type:        "string"
										}
									}
									required: [
										"status",
										"type",
									]
									type: "object"
								}
								type: "array"
							}
							replicas: {
								description: "Replicas is currently not being set and might be removed in the next version."

								format: "int32"
								type:   "integer"
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