package main
storagesCrd: {
	apiVersion: "apiextensions.k8s.io/v1"
	kind:       "CustomResourceDefinition"
	metadata: {
		annotations: {
			"cert-manager.io/inject-ca-from":        "skywalking-swck-system/skywalking-swck-serving-cert"
			"controller-gen.kubebuilder.io/version": "v0.7.0"
		}
		name: "storages.operator.skywalking.apache.org"
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
			kind:     "Storage"
			listKind: "StorageList"
			plural:   "storages"
			singular: "storage"
		}
		scope: "Namespaced"
		versions: [{
			additionalPrinterColumns: [{
				description: "The number of expected instance"
				jsonPath:    ".spec.instances"
				name:        "Instances"
				type:        "string"
			}, {
				description: "The type of storage"
				jsonPath:    ".spec.type"
				name:        "Type"
				type:        "string"
			}, {
				description: "The version"
				jsonPath:    ".spec.version"
				name:        "Version"
				type:        "string"
			}, {
				description: "the way to connect storage"
				jsonPath:    ".spec.connectType"
				name:        "ConnectType"
				type:        "string"
			}]
			name: "v1alpha1"
			schema: openAPIV3Schema: {
				description: "Storage is the Schema for the storages API"
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
						description: "StorageSpec defines the desired state of Storage"
						properties: {
							address: {
								description: "Address of external storage address."
								type:        "string"
							}
							config: {
								description: "Config holds the Storage configuration."
								items: {
									description: "EnvVar represents an environment variable present in a Container."

									properties: {
										name: {
											description: "Name of the environment variable. Must be a C_IDENTIFIER."
											type:        "string"
										}
										value: {
											description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. \"$$(VAR_NAME)\" will produce the string literal \"$(VAR_NAME)\". Escaped references will never be expanded, regardless of whether the variable exists or not. Defaults to \"\"."

											type: "string"
										}
										valueFrom: {
											description: "Source for the environment variable's value. Cannot be used if value is not empty."

											properties: {
												configMapKeyRef: {
													description: "Selects a key of a ConfigMap."
													properties: {
														key: {
															description: "The key to select."
															type:        "string"
														}
														name: {
															description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"

															type: "string"
														}
														optional: {
															description: "Specify whether the ConfigMap or its key must be defined"

															type: "boolean"
														}
													}
													required: [
														"key",
													]
													type: "object"
												}
												fieldRef: {
													description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status.podIP, status.podIPs."

													properties: {
														apiVersion: {
															description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."

															type: "string"
														}
														fieldPath: {
															description: "Path of the field to select in the specified API version."

															type: "string"
														}
													}
													required: [
														"fieldPath",
													]
													type: "object"
												}
												resourceFieldRef: {
													description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests.ephemeral-storage) are currently supported."

													properties: {
														containerName: {
															description: "Container name: required for volumes, optional for env vars"

															type: "string"
														}
														divisor: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description: "Specifies the output format of the exposed resources, defaults to \"1\""

															pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
															"x-kubernetes-int-or-string": true
														}
														resource: {
															description: "Required: resource to select"
															type:        "string"
														}
													}
													required: [
														"resource",
													]
													type: "object"
												}
												secretKeyRef: {
													description: "Selects a key of a secret in the pod's namespace"
													properties: {
														key: {
															description: "The key of the secret to select from.  Must be a valid secret key."

															type: "string"
														}
														name: {
															description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"

															type: "string"
														}
														optional: {
															description: "Specify whether the Secret or its key must be defined"

															type: "boolean"
														}
													}
													required: [
														"key",
													]
													type: "object"
												}
											}
											type: "object"
										}
									}
									required: [
										"name",
									]
									type: "object"
								}
								type: "array"
							}
							connectType: {
								description: "ConnectType is the way to connect storage(e.g. external,internal)."
								type:        "string"
							}
							image: {
								description: "Image is the storage Docker image to deploy."
								type:        "string"
							}
							instances: {
								description: "Instance is the number of storage."
								format:      "int32"
								type:        "integer"
							}
							resource: {
								description: "ResourceCnfig relevant settings"
								properties: {
									limit: type: "string"
									requests: type: "string"
								}
								type: "object"
							}
							security: {
								description: "Security relevant settings"
								properties: {
									tls: {
										description: "SSLConfig of  storage ."
										type:        "boolean"
									}
									user: {
										description: "UserConfig of storage ."
										properties: secretName: {
											description: "SecretName of storage user ."
											type:        "string"
										}
										type: "object"
									}
								}
								type: "object"
							}
							servicename: {
								description: "ServiceName relevant settings"
								type:        "string"
							}
							type: {
								description: "Type of storage."
								type:        "string"
							}
							version: {
								description: "Version of storage."
								type:        "string"
							}
						}
						type: "object"
					}
					status: {
						description: "StorageStatus defines the observed state of Storage"
						properties: conditions: {
							description: "Represents the latest available observations of the underlying statefulset's current state."

							items: {
								description: "StatefulSetCondition describes the state of a statefulset at a certain point."

								properties: {
									lastTransitionTime: {
										description: "Last time the condition transitioned from one status to another."

										format: "date-time"
										type:   "string"
									}
									message: {
										description: "A human readable message indicating details about the transition."

										type: "string"
									}
									reason: {
										description: "The reason for the condition's last transition."
										type:        "string"
									}
									status: {
										description: "Status of the condition, one of True, False, Unknown."
										type:        "string"
									}
									type: {
										description: "Type of statefulset condition."
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