package main
prometheusesCrd: {
	apiVersion: "apiextensions.k8s.io/v1"
	kind:       "CustomResourceDefinition"
	metadata: {
		annotations: "controller-gen.kubebuilder.io/version": "v0.9.2"
		name: "prometheuses.monitoring.coreos.com"
	}
	spec: {
		group: "monitoring.coreos.com"
		names: {
			categories: [
				"prometheus-operator",
			]
			kind:     "Prometheus"
			listKind: "PrometheusList"
			plural:   "prometheuses"
			shortNames: [
				"prom",
			]
			singular: "prometheus"
		}
		scope: "Namespaced"
		versions: [{
			additionalPrinterColumns: [{
				jsonPath: ".spec.version"
				name:     "Version"
				type:     "string"
			}, {
				jsonPath: ".spec.replicas"
				name:     "Replicas"
				type:     "integer"
			}, {
				jsonPath: ".metadata.creationTimestamp"
				name:     "Age"
				type:     "date"
			}]
			name: "v1"
			schema: openAPIV3Schema: {
				properties: {
					apiVersion: type: "string"
					kind: type: "string"
					metadata: type: "object"
					spec: {
						properties: {
							additionalAlertManagerConfigs: {
								properties: {
									key: type: "string"
									name: type: "string"
									optional: type: "boolean"
								}
								required: [
									"key",
								]
								type:                    "object"
								"x-kubernetes-map-type": "atomic"
							}
							additionalAlertRelabelConfigs: {
								properties: {
									key: type: "string"
									name: type: "string"
									optional: type: "boolean"
								}
								required: [
									"key",
								]
								type:                    "object"
								"x-kubernetes-map-type": "atomic"
							}
							additionalArgs: {
								items: {
									properties: {
										name: {
											minLength: 1
											type:      "string"
										}
										value: type: "string"
									}
									required: [
										"name",
									]
									type: "object"
								}
								type: "array"
							}
							additionalScrapeConfigs: {
								properties: {
									key: type: "string"
									name: type: "string"
									optional: type: "boolean"
								}
								required: [
									"key",
								]
								type:                    "object"
								"x-kubernetes-map-type": "atomic"
							}
							affinity: {
								properties: {
									nodeAffinity: {
										properties: {
											preferredDuringSchedulingIgnoredDuringExecution: {
												items: {
													properties: {
														preference: {
															properties: {
																matchExpressions: {
																	items: {
																		properties: {
																			key: type: "string"
																			operator: type: "string"
																			values: {
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchFields: {
																	items: {
																		properties: {
																			key: type: "string"
																			operator: type: "string"
																			values: {
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														weight: {
															format: "int32"
															type:   "integer"
														}
													}
													required: [
														"preference",
														"weight",
													]
													type: "object"
												}
												type: "array"
											}
											requiredDuringSchedulingIgnoredDuringExecution: {
												properties: nodeSelectorTerms: {
													items: {
														properties: {
															matchExpressions: {
																items: {
																	properties: {
																		key: type: "string"
																		operator: type: "string"
																		values: {
																			items: type: "string"
																			type: "array"
																		}
																	}
																	required: [
																		"key",
																		"operator",
																	]
																	type: "object"
																}
																type: "array"
															}
															matchFields: {
																items: {
																	properties: {
																		key: type: "string"
																		operator: type: "string"
																		values: {
																			items: type: "string"
																			type: "array"
																		}
																	}
																	required: [
																		"key",
																		"operator",
																	]
																	type: "object"
																}
																type: "array"
															}
														}
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													type: "array"
												}
												required: [
													"nodeSelectorTerms",
												]
												type:                    "object"
												"x-kubernetes-map-type": "atomic"
											}
										}
										type: "object"
									}
									podAffinity: {
										properties: {
											preferredDuringSchedulingIgnoredDuringExecution: {
												items: {
													properties: {
														podAffinityTerm: {
															properties: {
																labelSelector: {
																	properties: {
																		matchExpressions: {
																			items: {
																				properties: {
																					key: type: "string"
																					operator: type: "string"
																					values: {
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			type: "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																namespaceSelector: {
																	properties: {
																		matchExpressions: {
																			items: {
																				properties: {
																					key: type: "string"
																					operator: type: "string"
																					values: {
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			type: "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																namespaces: {
																	items: type: "string"
																	type: "array"
																}
																topologyKey: type: "string"
															}
															required: [
																"topologyKey",
															]
															type: "object"
														}
														weight: {
															format: "int32"
															type:   "integer"
														}
													}
													required: [
														"podAffinityTerm",
														"weight",
													]
													type: "object"
												}
												type: "array"
											}
											requiredDuringSchedulingIgnoredDuringExecution: {
												items: {
													properties: {
														labelSelector: {
															properties: {
																matchExpressions: {
																	items: {
																		properties: {
																			key: type: "string"
																			operator: type: "string"
																			values: {
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchLabels: {
																	additionalProperties: type: "string"
																	type: "object"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														namespaceSelector: {
															properties: {
																matchExpressions: {
																	items: {
																		properties: {
																			key: type: "string"
																			operator: type: "string"
																			values: {
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchLabels: {
																	additionalProperties: type: "string"
																	type: "object"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														namespaces: {
															items: type: "string"
															type: "array"
														}
														topologyKey: type: "string"
													}
													required: [
														"topologyKey",
													]
													type: "object"
												}
												type: "array"
											}
										}
										type: "object"
									}
									podAntiAffinity: {
										properties: {
											preferredDuringSchedulingIgnoredDuringExecution: {
												items: {
													properties: {
														podAffinityTerm: {
															properties: {
																labelSelector: {
																	properties: {
																		matchExpressions: {
																			items: {
																				properties: {
																					key: type: "string"
																					operator: type: "string"
																					values: {
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			type: "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																namespaceSelector: {
																	properties: {
																		matchExpressions: {
																			items: {
																				properties: {
																					key: type: "string"
																					operator: type: "string"
																					values: {
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			type: "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																namespaces: {
																	items: type: "string"
																	type: "array"
																}
																topologyKey: type: "string"
															}
															required: [
																"topologyKey",
															]
															type: "object"
														}
														weight: {
															format: "int32"
															type:   "integer"
														}
													}
													required: [
														"podAffinityTerm",
														"weight",
													]
													type: "object"
												}
												type: "array"
											}
											requiredDuringSchedulingIgnoredDuringExecution: {
												items: {
													properties: {
														labelSelector: {
															properties: {
																matchExpressions: {
																	items: {
																		properties: {
																			key: type: "string"
																			operator: type: "string"
																			values: {
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchLabels: {
																	additionalProperties: type: "string"
																	type: "object"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														namespaceSelector: {
															properties: {
																matchExpressions: {
																	items: {
																		properties: {
																			key: type: "string"
																			operator: type: "string"
																			values: {
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchLabels: {
																	additionalProperties: type: "string"
																	type: "object"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														namespaces: {
															items: type: "string"
															type: "array"
														}
														topologyKey: type: "string"
													}
													required: [
														"topologyKey",
													]
													type: "object"
												}
												type: "array"
											}
										}
										type: "object"
									}
								}
								type: "object"
							}
							alerting: {
								properties: alertmanagers: {
									items: {
										properties: {
											apiVersion: type: "string"
											authorization: {
												properties: {
													credentials: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													type: type: "string"
												}
												type: "object"
											}
											bearerTokenFile: type: "string"
											name: type: "string"
											namespace: type: "string"
											pathPrefix: type: "string"
											port: {
												anyOf: [{
													type: "integer"
												}, {
													type: "string"
												}]
												"x-kubernetes-int-or-string": true
											}
											scheme: type: "string"
											timeout: {
												pattern: "^(0|(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?)$"
												type:    "string"
											}
											tlsConfig: {
												properties: {
													ca: {
														properties: {
															configMap: {
																properties: {
																	key: type: "string"
																	name: type: "string"
																	optional: type: "boolean"
																}
																required: [
																	"key",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															secret: {
																properties: {
																	key: type: "string"
																	name: type: "string"
																	optional: type: "boolean"
																}
																required: [
																	"key",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
														}
														type: "object"
													}
													caFile: type: "string"
													cert: {
														properties: {
															configMap: {
																properties: {
																	key: type: "string"
																	name: type: "string"
																	optional: type: "boolean"
																}
																required: [
																	"key",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															secret: {
																properties: {
																	key: type: "string"
																	name: type: "string"
																	optional: type: "boolean"
																}
																required: [
																	"key",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
														}
														type: "object"
													}
													certFile: type: "string"
													insecureSkipVerify: type: "boolean"
													keyFile: type: "string"
													keySecret: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													serverName: type: "string"
												}
												type: "object"
											}
										}
										required: [
											"name",
											"namespace",
											"port",
										]
										type: "object"
									}
									type: "array"
								}
								required: [
									"alertmanagers",
								]
								type: "object"
							}
							allowOverlappingBlocks: type: "boolean"
							apiserverConfig: {
								properties: {
									authorization: {
										properties: {
											credentials: {
												properties: {
													key: type: "string"
													name: type: "string"
													optional: type: "boolean"
												}
												required: [
													"key",
												]
												type:                    "object"
												"x-kubernetes-map-type": "atomic"
											}
											credentialsFile: type: "string"
											type: type: "string"
										}
										type: "object"
									}
									basicAuth: {
										properties: {
											password: {
												properties: {
													key: type: "string"
													name: type: "string"
													optional: type: "boolean"
												}
												required: [
													"key",
												]
												type:                    "object"
												"x-kubernetes-map-type": "atomic"
											}
											username: {
												properties: {
													key: type: "string"
													name: type: "string"
													optional: type: "boolean"
												}
												required: [
													"key",
												]
												type:                    "object"
												"x-kubernetes-map-type": "atomic"
											}
										}
										type: "object"
									}
									bearerToken: type: "string"
									bearerTokenFile: type: "string"
									host: type: "string"
									tlsConfig: {
										properties: {
											ca: {
												properties: {
													configMap: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													secret: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
												}
												type: "object"
											}
											caFile: type: "string"
											cert: {
												properties: {
													configMap: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													secret: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
												}
												type: "object"
											}
											certFile: type: "string"
											insecureSkipVerify: type: "boolean"
											keyFile: type: "string"
											keySecret: {
												properties: {
													key: type: "string"
													name: type: "string"
													optional: type: "boolean"
												}
												required: [
													"key",
												]
												type:                    "object"
												"x-kubernetes-map-type": "atomic"
											}
											serverName: type: "string"
										}
										type: "object"
									}
								}
								required: [
									"host",
								]
								type: "object"
							}
							arbitraryFSAccessThroughSMs: {
								properties: deny: type: "boolean"
								type: "object"
							}
							baseImage: type: "string"
							configMaps: {
								items: type: "string"
								type: "array"
							}
							containers: {
								items: {
									properties: {
										args: {
											items: type: "string"
											type: "array"
										}
										command: {
											items: type: "string"
											type: "array"
										}
										env: {
											items: {
												properties: {
													name: type: "string"
													value: type: "string"
													valueFrom: {
														properties: {
															configMapKeyRef: {
																properties: {
																	key: type: "string"
																	name: type: "string"
																	optional: type: "boolean"
																}
																required: [
																	"key",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															fieldRef: {
																properties: {
																	apiVersion: type: "string"
																	fieldPath: type: "string"
																}
																required: [
																	"fieldPath",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															resourceFieldRef: {
																properties: {
																	containerName: type: "string"
																	divisor: {
																		anyOf: [{
																			type: "integer"
																		}, {
																			type: "string"
																		}]
																		pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																		"x-kubernetes-int-or-string": true
																	}
																	resource: type: "string"
																}
																required: [
																	"resource",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															secretKeyRef: {
																properties: {
																	key: type: "string"
																	name: type: "string"
																	optional: type: "boolean"
																}
																required: [
																	"key",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
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
										envFrom: {
											items: {
												properties: {
													configMapRef: {
														properties: {
															name: type: "string"
															optional: type: "boolean"
														}
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													prefix: type: "string"
													secretRef: {
														properties: {
															name: type: "string"
															optional: type: "boolean"
														}
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
												}
												type: "object"
											}
											type: "array"
										}
										image: type: "string"
										imagePullPolicy: type: "string"
										lifecycle: {
											properties: {
												postStart: {
													properties: {
														exec: {
															properties: command: {
																items: type: "string"
																type: "array"
															}
															type: "object"
														}
														httpGet: {
															properties: {
																host: type: "string"
																httpHeaders: {
																	items: {
																		properties: {
																			name: type: "string"
																			value: type: "string"
																		}
																		required: [
																			"name",
																			"value",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																path: type: "string"
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	"x-kubernetes-int-or-string": true
																}
																scheme: type: "string"
															}
															required: [
																"port",
															]
															type: "object"
														}
														tcpSocket: {
															properties: {
																host: type: "string"
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	"x-kubernetes-int-or-string": true
																}
															}
															required: [
																"port",
															]
															type: "object"
														}
													}
													type: "object"
												}
												preStop: {
													properties: {
														exec: {
															properties: command: {
																items: type: "string"
																type: "array"
															}
															type: "object"
														}
														httpGet: {
															properties: {
																host: type: "string"
																httpHeaders: {
																	items: {
																		properties: {
																			name: type: "string"
																			value: type: "string"
																		}
																		required: [
																			"name",
																			"value",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																path: type: "string"
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	"x-kubernetes-int-or-string": true
																}
																scheme: type: "string"
															}
															required: [
																"port",
															]
															type: "object"
														}
														tcpSocket: {
															properties: {
																host: type: "string"
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	"x-kubernetes-int-or-string": true
																}
															}
															required: [
																"port",
															]
															type: "object"
														}
													}
													type: "object"
												}
											}
											type: "object"
										}
										livenessProbe: {
											properties: {
												exec: {
													properties: command: {
														items: type: "string"
														type: "array"
													}
													type: "object"
												}
												failureThreshold: {
													format: "int32"
													type:   "integer"
												}
												grpc: {
													properties: {
														port: {
															format: "int32"
															type:   "integer"
														}
														service: type: "string"
													}
													required: [
														"port",
													]
													type: "object"
												}
												httpGet: {
													properties: {
														host: type: "string"
														httpHeaders: {
															items: {
																properties: {
																	name: type: "string"
																	value: type: "string"
																}
																required: [
																	"name",
																	"value",
																]
																type: "object"
															}
															type: "array"
														}
														path: type: "string"
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															"x-kubernetes-int-or-string": true
														}
														scheme: type: "string"
													}
													required: [
														"port",
													]
													type: "object"
												}
												initialDelaySeconds: {
													format: "int32"
													type:   "integer"
												}
												periodSeconds: {
													format: "int32"
													type:   "integer"
												}
												successThreshold: {
													format: "int32"
													type:   "integer"
												}
												tcpSocket: {
													properties: {
														host: type: "string"
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															"x-kubernetes-int-or-string": true
														}
													}
													required: [
														"port",
													]
													type: "object"
												}
												terminationGracePeriodSeconds: {
													format: "int64"
													type:   "integer"
												}
												timeoutSeconds: {
													format: "int32"
													type:   "integer"
												}
											}
											type: "object"
										}
										name: type: "string"
										ports: {
											items: {
												properties: {
													containerPort: {
														format: "int32"
														type:   "integer"
													}
													hostIP: type: "string"
													hostPort: {
														format: "int32"
														type:   "integer"
													}
													name: type: "string"
													protocol: {
														default: "TCP"
														type:    "string"
													}
												}
												required: [
													"containerPort",
												]
												type: "object"
											}
											type: "array"
											"x-kubernetes-list-map-keys": [
												"containerPort",
												"protocol",
											]
											"x-kubernetes-list-type": "map"
										}
										readinessProbe: {
											properties: {
												exec: {
													properties: command: {
														items: type: "string"
														type: "array"
													}
													type: "object"
												}
												failureThreshold: {
													format: "int32"
													type:   "integer"
												}
												grpc: {
													properties: {
														port: {
															format: "int32"
															type:   "integer"
														}
														service: type: "string"
													}
													required: [
														"port",
													]
													type: "object"
												}
												httpGet: {
													properties: {
														host: type: "string"
														httpHeaders: {
															items: {
																properties: {
																	name: type: "string"
																	value: type: "string"
																}
																required: [
																	"name",
																	"value",
																]
																type: "object"
															}
															type: "array"
														}
														path: type: "string"
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															"x-kubernetes-int-or-string": true
														}
														scheme: type: "string"
													}
													required: [
														"port",
													]
													type: "object"
												}
												initialDelaySeconds: {
													format: "int32"
													type:   "integer"
												}
												periodSeconds: {
													format: "int32"
													type:   "integer"
												}
												successThreshold: {
													format: "int32"
													type:   "integer"
												}
												tcpSocket: {
													properties: {
														host: type: "string"
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															"x-kubernetes-int-or-string": true
														}
													}
													required: [
														"port",
													]
													type: "object"
												}
												terminationGracePeriodSeconds: {
													format: "int64"
													type:   "integer"
												}
												timeoutSeconds: {
													format: "int32"
													type:   "integer"
												}
											}
											type: "object"
										}
										resources: {
											properties: {
												limits: {
													additionalProperties: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
														"x-kubernetes-int-or-string": true
													}
													type: "object"
												}
												requests: {
													additionalProperties: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
														"x-kubernetes-int-or-string": true
													}
													type: "object"
												}
											}
											type: "object"
										}
										securityContext: {
											properties: {
												allowPrivilegeEscalation: type: "boolean"
												capabilities: {
													properties: {
														add: {
															items: type: "string"
															type: "array"
														}
														drop: {
															items: type: "string"
															type: "array"
														}
													}
													type: "object"
												}
												privileged: type: "boolean"
												procMount: type: "string"
												readOnlyRootFilesystem: type: "boolean"
												runAsGroup: {
													format: "int64"
													type:   "integer"
												}
												runAsNonRoot: type: "boolean"
												runAsUser: {
													format: "int64"
													type:   "integer"
												}
												seLinuxOptions: {
													properties: {
														level: type: "string"
														role: type: "string"
														type: type: "string"
														user: type: "string"
													}
													type: "object"
												}
												seccompProfile: {
													properties: {
														localhostProfile: type: "string"
														type: type: "string"
													}
													required: [
														"type",
													]
													type: "object"
												}
												windowsOptions: {
													properties: {
														gmsaCredentialSpec: type: "string"
														gmsaCredentialSpecName: type: "string"
														hostProcess: type: "boolean"
														runAsUserName: type: "string"
													}
													type: "object"
												}
											}
											type: "object"
										}
										startupProbe: {
											properties: {
												exec: {
													properties: command: {
														items: type: "string"
														type: "array"
													}
													type: "object"
												}
												failureThreshold: {
													format: "int32"
													type:   "integer"
												}
												grpc: {
													properties: {
														port: {
															format: "int32"
															type:   "integer"
														}
														service: type: "string"
													}
													required: [
														"port",
													]
													type: "object"
												}
												httpGet: {
													properties: {
														host: type: "string"
														httpHeaders: {
															items: {
																properties: {
																	name: type: "string"
																	value: type: "string"
																}
																required: [
																	"name",
																	"value",
																]
																type: "object"
															}
															type: "array"
														}
														path: type: "string"
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															"x-kubernetes-int-or-string": true
														}
														scheme: type: "string"
													}
													required: [
														"port",
													]
													type: "object"
												}
												initialDelaySeconds: {
													format: "int32"
													type:   "integer"
												}
												periodSeconds: {
													format: "int32"
													type:   "integer"
												}
												successThreshold: {
													format: "int32"
													type:   "integer"
												}
												tcpSocket: {
													properties: {
														host: type: "string"
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															"x-kubernetes-int-or-string": true
														}
													}
													required: [
														"port",
													]
													type: "object"
												}
												terminationGracePeriodSeconds: {
													format: "int64"
													type:   "integer"
												}
												timeoutSeconds: {
													format: "int32"
													type:   "integer"
												}
											}
											type: "object"
										}
										stdin: type: "boolean"
										stdinOnce: type: "boolean"
										terminationMessagePath: type: "string"
										terminationMessagePolicy: type: "string"
										tty: type: "boolean"
										volumeDevices: {
											items: {
												properties: {
													devicePath: type: "string"
													name: type: "string"
												}
												required: [
													"devicePath",
													"name",
												]
												type: "object"
											}
											type: "array"
										}
										volumeMounts: {
											items: {
												properties: {
													mountPath: type: "string"
													mountPropagation: type: "string"
													name: type: "string"
													readOnly: type: "boolean"
													subPath: type: "string"
													subPathExpr: type: "string"
												}
												required: [
													"mountPath",
													"name",
												]
												type: "object"
											}
											type: "array"
										}
										workingDir: type: "string"
									}
									required: [
										"name",
									]
									type: "object"
								}
								type: "array"
							}
							disableCompaction: type: "boolean"
							enableAdminAPI: type: "boolean"
							enableFeatures: {
								items: type: "string"
								type: "array"
							}
							enableRemoteWriteReceiver: type: "boolean"
							enforcedBodySizeLimit: {
								pattern: "(^0|([0-9]*[.])?[0-9]+((K|M|G|T|E|P)i?)?B)$"
								type:    "string"
							}
							enforcedLabelLimit: {
								format: "int64"
								type:   "integer"
							}
							enforcedLabelNameLengthLimit: {
								format: "int64"
								type:   "integer"
							}
							enforcedLabelValueLengthLimit: {
								format: "int64"
								type:   "integer"
							}
							enforcedNamespaceLabel: type: "string"
							enforcedSampleLimit: {
								format: "int64"
								type:   "integer"
							}
							enforcedTargetLimit: {
								format: "int64"
								type:   "integer"
							}
							evaluationInterval: {
								default: "30s"
								pattern: "^(0|(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?)$"
								type:    "string"
							}
							excludedFromEnforcement: {
								items: {
									properties: {
										group: {
											default: "monitoring.coreos.com"
											enum: [
												"monitoring.coreos.com",
											]
											type: "string"
										}
										name: type: "string"
										namespace: {
											minLength: 1
											type:      "string"
										}
										resource: {
											enum: [
												"prometheusrules",
												"servicemonitors",
												"podmonitors",
												"probes",
											]
											type: "string"
										}
									}
									required: [
										"namespace",
										"resource",
									]
									type: "object"
								}
								type: "array"
							}
							exemplars: {
								properties: maxSize: {
									format: "int64"
									type:   "integer"
								}
								type: "object"
							}
							externalLabels: {
								additionalProperties: type: "string"
								type: "object"
							}
							externalUrl: type: "string"
							hostAliases: {
								items: {
									properties: {
										hostnames: {
											items: type: "string"
											type: "array"
										}
										ip: type: "string"
									}
									required: [
										"hostnames",
										"ip",
									]
									type: "object"
								}
								type: "array"
								"x-kubernetes-list-map-keys": [
									"ip",
								]
								"x-kubernetes-list-type": "map"
							}
							ignoreNamespaceSelectors: type: "boolean"
							image: type: "string"
							imagePullSecrets: {
								items: {
									properties: name: type: "string"
									type:                    "object"
									"x-kubernetes-map-type": "atomic"
								}
								type: "array"
							}
							initContainers: {
								items: {
									properties: {
										args: {
											items: type: "string"
											type: "array"
										}
										command: {
											items: type: "string"
											type: "array"
										}
										env: {
											items: {
												properties: {
													name: type: "string"
													value: type: "string"
													valueFrom: {
														properties: {
															configMapKeyRef: {
																properties: {
																	key: type: "string"
																	name: type: "string"
																	optional: type: "boolean"
																}
																required: [
																	"key",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															fieldRef: {
																properties: {
																	apiVersion: type: "string"
																	fieldPath: type: "string"
																}
																required: [
																	"fieldPath",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															resourceFieldRef: {
																properties: {
																	containerName: type: "string"
																	divisor: {
																		anyOf: [{
																			type: "integer"
																		}, {
																			type: "string"
																		}]
																		pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																		"x-kubernetes-int-or-string": true
																	}
																	resource: type: "string"
																}
																required: [
																	"resource",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															secretKeyRef: {
																properties: {
																	key: type: "string"
																	name: type: "string"
																	optional: type: "boolean"
																}
																required: [
																	"key",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
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
										envFrom: {
											items: {
												properties: {
													configMapRef: {
														properties: {
															name: type: "string"
															optional: type: "boolean"
														}
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													prefix: type: "string"
													secretRef: {
														properties: {
															name: type: "string"
															optional: type: "boolean"
														}
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
												}
												type: "object"
											}
											type: "array"
										}
										image: type: "string"
										imagePullPolicy: type: "string"
										lifecycle: {
											properties: {
												postStart: {
													properties: {
														exec: {
															properties: command: {
																items: type: "string"
																type: "array"
															}
															type: "object"
														}
														httpGet: {
															properties: {
																host: type: "string"
																httpHeaders: {
																	items: {
																		properties: {
																			name: type: "string"
																			value: type: "string"
																		}
																		required: [
																			"name",
																			"value",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																path: type: "string"
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	"x-kubernetes-int-or-string": true
																}
																scheme: type: "string"
															}
															required: [
																"port",
															]
															type: "object"
														}
														tcpSocket: {
															properties: {
																host: type: "string"
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	"x-kubernetes-int-or-string": true
																}
															}
															required: [
																"port",
															]
															type: "object"
														}
													}
													type: "object"
												}
												preStop: {
													properties: {
														exec: {
															properties: command: {
																items: type: "string"
																type: "array"
															}
															type: "object"
														}
														httpGet: {
															properties: {
																host: type: "string"
																httpHeaders: {
																	items: {
																		properties: {
																			name: type: "string"
																			value: type: "string"
																		}
																		required: [
																			"name",
																			"value",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																path: type: "string"
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	"x-kubernetes-int-or-string": true
																}
																scheme: type: "string"
															}
															required: [
																"port",
															]
															type: "object"
														}
														tcpSocket: {
															properties: {
																host: type: "string"
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	"x-kubernetes-int-or-string": true
																}
															}
															required: [
																"port",
															]
															type: "object"
														}
													}
													type: "object"
												}
											}
											type: "object"
										}
										livenessProbe: {
											properties: {
												exec: {
													properties: command: {
														items: type: "string"
														type: "array"
													}
													type: "object"
												}
												failureThreshold: {
													format: "int32"
													type:   "integer"
												}
												grpc: {
													properties: {
														port: {
															format: "int32"
															type:   "integer"
														}
														service: type: "string"
													}
													required: [
														"port",
													]
													type: "object"
												}
												httpGet: {
													properties: {
														host: type: "string"
														httpHeaders: {
															items: {
																properties: {
																	name: type: "string"
																	value: type: "string"
																}
																required: [
																	"name",
																	"value",
																]
																type: "object"
															}
															type: "array"
														}
														path: type: "string"
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															"x-kubernetes-int-or-string": true
														}
														scheme: type: "string"
													}
													required: [
														"port",
													]
													type: "object"
												}
												initialDelaySeconds: {
													format: "int32"
													type:   "integer"
												}
												periodSeconds: {
													format: "int32"
													type:   "integer"
												}
												successThreshold: {
													format: "int32"
													type:   "integer"
												}
												tcpSocket: {
													properties: {
														host: type: "string"
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															"x-kubernetes-int-or-string": true
														}
													}
													required: [
														"port",
													]
													type: "object"
												}
												terminationGracePeriodSeconds: {
													format: "int64"
													type:   "integer"
												}
												timeoutSeconds: {
													format: "int32"
													type:   "integer"
												}
											}
											type: "object"
										}
										name: type: "string"
										ports: {
											items: {
												properties: {
													containerPort: {
														format: "int32"
														type:   "integer"
													}
													hostIP: type: "string"
													hostPort: {
														format: "int32"
														type:   "integer"
													}
													name: type: "string"
													protocol: {
														default: "TCP"
														type:    "string"
													}
												}
												required: [
													"containerPort",
												]
												type: "object"
											}
											type: "array"
											"x-kubernetes-list-map-keys": [
												"containerPort",
												"protocol",
											]
											"x-kubernetes-list-type": "map"
										}
										readinessProbe: {
											properties: {
												exec: {
													properties: command: {
														items: type: "string"
														type: "array"
													}
													type: "object"
												}
												failureThreshold: {
													format: "int32"
													type:   "integer"
												}
												grpc: {
													properties: {
														port: {
															format: "int32"
															type:   "integer"
														}
														service: type: "string"
													}
													required: [
														"port",
													]
													type: "object"
												}
												httpGet: {
													properties: {
														host: type: "string"
														httpHeaders: {
															items: {
																properties: {
																	name: type: "string"
																	value: type: "string"
																}
																required: [
																	"name",
																	"value",
																]
																type: "object"
															}
															type: "array"
														}
														path: type: "string"
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															"x-kubernetes-int-or-string": true
														}
														scheme: type: "string"
													}
													required: [
														"port",
													]
													type: "object"
												}
												initialDelaySeconds: {
													format: "int32"
													type:   "integer"
												}
												periodSeconds: {
													format: "int32"
													type:   "integer"
												}
												successThreshold: {
													format: "int32"
													type:   "integer"
												}
												tcpSocket: {
													properties: {
														host: type: "string"
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															"x-kubernetes-int-or-string": true
														}
													}
													required: [
														"port",
													]
													type: "object"
												}
												terminationGracePeriodSeconds: {
													format: "int64"
													type:   "integer"
												}
												timeoutSeconds: {
													format: "int32"
													type:   "integer"
												}
											}
											type: "object"
										}
										resources: {
											properties: {
												limits: {
													additionalProperties: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
														"x-kubernetes-int-or-string": true
													}
													type: "object"
												}
												requests: {
													additionalProperties: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
														"x-kubernetes-int-or-string": true
													}
													type: "object"
												}
											}
											type: "object"
										}
										securityContext: {
											properties: {
												allowPrivilegeEscalation: type: "boolean"
												capabilities: {
													properties: {
														add: {
															items: type: "string"
															type: "array"
														}
														drop: {
															items: type: "string"
															type: "array"
														}
													}
													type: "object"
												}
												privileged: type: "boolean"
												procMount: type: "string"
												readOnlyRootFilesystem: type: "boolean"
												runAsGroup: {
													format: "int64"
													type:   "integer"
												}
												runAsNonRoot: type: "boolean"
												runAsUser: {
													format: "int64"
													type:   "integer"
												}
												seLinuxOptions: {
													properties: {
														level: type: "string"
														role: type: "string"
														type: type: "string"
														user: type: "string"
													}
													type: "object"
												}
												seccompProfile: {
													properties: {
														localhostProfile: type: "string"
														type: type: "string"
													}
													required: [
														"type",
													]
													type: "object"
												}
												windowsOptions: {
													properties: {
														gmsaCredentialSpec: type: "string"
														gmsaCredentialSpecName: type: "string"
														hostProcess: type: "boolean"
														runAsUserName: type: "string"
													}
													type: "object"
												}
											}
											type: "object"
										}
										startupProbe: {
											properties: {
												exec: {
													properties: command: {
														items: type: "string"
														type: "array"
													}
													type: "object"
												}
												failureThreshold: {
													format: "int32"
													type:   "integer"
												}
												grpc: {
													properties: {
														port: {
															format: "int32"
															type:   "integer"
														}
														service: type: "string"
													}
													required: [
														"port",
													]
													type: "object"
												}
												httpGet: {
													properties: {
														host: type: "string"
														httpHeaders: {
															items: {
																properties: {
																	name: type: "string"
																	value: type: "string"
																}
																required: [
																	"name",
																	"value",
																]
																type: "object"
															}
															type: "array"
														}
														path: type: "string"
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															"x-kubernetes-int-or-string": true
														}
														scheme: type: "string"
													}
													required: [
														"port",
													]
													type: "object"
												}
												initialDelaySeconds: {
													format: "int32"
													type:   "integer"
												}
												periodSeconds: {
													format: "int32"
													type:   "integer"
												}
												successThreshold: {
													format: "int32"
													type:   "integer"
												}
												tcpSocket: {
													properties: {
														host: type: "string"
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															"x-kubernetes-int-or-string": true
														}
													}
													required: [
														"port",
													]
													type: "object"
												}
												terminationGracePeriodSeconds: {
													format: "int64"
													type:   "integer"
												}
												timeoutSeconds: {
													format: "int32"
													type:   "integer"
												}
											}
											type: "object"
										}
										stdin: type: "boolean"
										stdinOnce: type: "boolean"
										terminationMessagePath: type: "string"
										terminationMessagePolicy: type: "string"
										tty: type: "boolean"
										volumeDevices: {
											items: {
												properties: {
													devicePath: type: "string"
													name: type: "string"
												}
												required: [
													"devicePath",
													"name",
												]
												type: "object"
											}
											type: "array"
										}
										volumeMounts: {
											items: {
												properties: {
													mountPath: type: "string"
													mountPropagation: type: "string"
													name: type: "string"
													readOnly: type: "boolean"
													subPath: type: "string"
													subPathExpr: type: "string"
												}
												required: [
													"mountPath",
													"name",
												]
												type: "object"
											}
											type: "array"
										}
										workingDir: type: "string"
									}
									required: [
										"name",
									]
									type: "object"
								}
								type: "array"
							}
							listenLocal: type: "boolean"
							logFormat: {
								enum: [
									"",
									"logfmt",
									"json",
								]
								type: "string"
							}
							logLevel: {
								enum: [
									"",
									"debug",
									"info",
									"warn",
									"error",
								]
								type: "string"
							}
							minReadySeconds: {
								format: "int32"
								type:   "integer"
							}
							nodeSelector: {
								additionalProperties: type: "string"
								type: "object"
							}
							overrideHonorLabels: type: "boolean"
							overrideHonorTimestamps: type: "boolean"
							paused: type: "boolean"
							podMetadata: {
								properties: {
									annotations: {
										additionalProperties: type: "string"
										type: "object"
									}
									labels: {
										additionalProperties: type: "string"
										type: "object"
									}
									name: type: "string"
								}
								type: "object"
							}
							podMonitorNamespaceSelector: {
								properties: {
									matchExpressions: {
										items: {
											properties: {
												key: type: "string"
												operator: type: "string"
												values: {
													items: type: "string"
													type: "array"
												}
											}
											required: [
												"key",
												"operator",
											]
											type: "object"
										}
										type: "array"
									}
									matchLabels: {
										additionalProperties: type: "string"
										type: "object"
									}
								}
								type:                    "object"
								"x-kubernetes-map-type": "atomic"
							}
							podMonitorSelector: {
								properties: {
									matchExpressions: {
										items: {
											properties: {
												key: type: "string"
												operator: type: "string"
												values: {
													items: type: "string"
													type: "array"
												}
											}
											required: [
												"key",
												"operator",
											]
											type: "object"
										}
										type: "array"
									}
									matchLabels: {
										additionalProperties: type: "string"
										type: "object"
									}
								}
								type:                    "object"
								"x-kubernetes-map-type": "atomic"
							}
							portName: type: "string"
							priorityClassName: type: "string"
							probeNamespaceSelector: {
								properties: {
									matchExpressions: {
										items: {
											properties: {
												key: type: "string"
												operator: type: "string"
												values: {
													items: type: "string"
													type: "array"
												}
											}
											required: [
												"key",
												"operator",
											]
											type: "object"
										}
										type: "array"
									}
									matchLabels: {
										additionalProperties: type: "string"
										type: "object"
									}
								}
								type:                    "object"
								"x-kubernetes-map-type": "atomic"
							}
							probeSelector: {
								properties: {
									matchExpressions: {
										items: {
											properties: {
												key: type: "string"
												operator: type: "string"
												values: {
													items: type: "string"
													type: "array"
												}
											}
											required: [
												"key",
												"operator",
											]
											type: "object"
										}
										type: "array"
									}
									matchLabels: {
										additionalProperties: type: "string"
										type: "object"
									}
								}
								type:                    "object"
								"x-kubernetes-map-type": "atomic"
							}
							prometheusExternalLabelName: type: "string"
							prometheusRulesExcludedFromEnforce: {
								items: {
									properties: {
										ruleName: type: "string"
										ruleNamespace: type: "string"
									}
									required: [
										"ruleName",
										"ruleNamespace",
									]
									type: "object"
								}
								type: "array"
							}
							query: {
								properties: {
									lookbackDelta: type: "string"
									maxConcurrency: {
										format: "int32"
										type:   "integer"
									}
									maxSamples: {
										format: "int32"
										type:   "integer"
									}
									timeout: {
										pattern: "^(0|(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?)$"
										type:    "string"
									}
								}
								type: "object"
							}
							queryLogFile: type: "string"
							remoteRead: {
								items: {
									properties: {
										authorization: {
											properties: {
												credentials: {
													properties: {
														key: type: "string"
														name: type: "string"
														optional: type: "boolean"
													}
													required: [
														"key",
													]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												credentialsFile: type: "string"
												type: type: "string"
											}
											type: "object"
										}
										basicAuth: {
											properties: {
												password: {
													properties: {
														key: type: "string"
														name: type: "string"
														optional: type: "boolean"
													}
													required: [
														"key",
													]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												username: {
													properties: {
														key: type: "string"
														name: type: "string"
														optional: type: "boolean"
													}
													required: [
														"key",
													]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
											}
											type: "object"
										}
										bearerToken: type: "string"
										bearerTokenFile: type: "string"
										headers: {
											additionalProperties: type: "string"
											type: "object"
										}
										name: type: "string"
										oauth2: {
											properties: {
												clientId: {
													properties: {
														configMap: {
															properties: {
																key: type: "string"
																name: type: "string"
																optional: type: "boolean"
															}
															required: [
																"key",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secret: {
															properties: {
																key: type: "string"
																name: type: "string"
																optional: type: "boolean"
															}
															required: [
																"key",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
												clientSecret: {
													properties: {
														key: type: "string"
														name: type: "string"
														optional: type: "boolean"
													}
													required: [
														"key",
													]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												endpointParams: {
													additionalProperties: type: "string"
													type: "object"
												}
												scopes: {
													items: type: "string"
													type: "array"
												}
												tokenUrl: {
													minLength: 1
													type:      "string"
												}
											}
											required: [
												"clientId",
												"clientSecret",
												"tokenUrl",
											]
											type: "object"
										}
										proxyUrl: type: "string"
										readRecent: type: "boolean"
										remoteTimeout: {
											pattern: "^(0|(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?)$"
											type:    "string"
										}
										requiredMatchers: {
											additionalProperties: type: "string"
											type: "object"
										}
										tlsConfig: {
											properties: {
												ca: {
													properties: {
														configMap: {
															properties: {
																key: type: "string"
																name: type: "string"
																optional: type: "boolean"
															}
															required: [
																"key",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secret: {
															properties: {
																key: type: "string"
																name: type: "string"
																optional: type: "boolean"
															}
															required: [
																"key",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
												caFile: type: "string"
												cert: {
													properties: {
														configMap: {
															properties: {
																key: type: "string"
																name: type: "string"
																optional: type: "boolean"
															}
															required: [
																"key",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secret: {
															properties: {
																key: type: "string"
																name: type: "string"
																optional: type: "boolean"
															}
															required: [
																"key",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
												certFile: type: "string"
												insecureSkipVerify: type: "boolean"
												keyFile: type: "string"
												keySecret: {
													properties: {
														key: type: "string"
														name: type: "string"
														optional: type: "boolean"
													}
													required: [
														"key",
													]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												serverName: type: "string"
											}
											type: "object"
										}
										url: type: "string"
									}
									required: [
										"url",
									]
									type: "object"
								}
								type: "array"
							}
							remoteWrite: {
								items: {
									properties: {
										authorization: {
											properties: {
												credentials: {
													properties: {
														key: type: "string"
														name: type: "string"
														optional: type: "boolean"
													}
													required: [
														"key",
													]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												credentialsFile: type: "string"
												type: type: "string"
											}
											type: "object"
										}
										basicAuth: {
											properties: {
												password: {
													properties: {
														key: type: "string"
														name: type: "string"
														optional: type: "boolean"
													}
													required: [
														"key",
													]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												username: {
													properties: {
														key: type: "string"
														name: type: "string"
														optional: type: "boolean"
													}
													required: [
														"key",
													]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
											}
											type: "object"
										}
										bearerToken: type: "string"
										bearerTokenFile: type: "string"
										headers: {
											additionalProperties: type: "string"
											type: "object"
										}
										metadataConfig: {
											properties: {
												send: type: "boolean"
												sendInterval: {
													pattern: "^(0|(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?)$"
													type:    "string"
												}
											}
											type: "object"
										}
										name: type: "string"
										oauth2: {
											properties: {
												clientId: {
													properties: {
														configMap: {
															properties: {
																key: type: "string"
																name: type: "string"
																optional: type: "boolean"
															}
															required: [
																"key",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secret: {
															properties: {
																key: type: "string"
																name: type: "string"
																optional: type: "boolean"
															}
															required: [
																"key",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
												clientSecret: {
													properties: {
														key: type: "string"
														name: type: "string"
														optional: type: "boolean"
													}
													required: [
														"key",
													]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												endpointParams: {
													additionalProperties: type: "string"
													type: "object"
												}
												scopes: {
													items: type: "string"
													type: "array"
												}
												tokenUrl: {
													minLength: 1
													type:      "string"
												}
											}
											required: [
												"clientId",
												"clientSecret",
												"tokenUrl",
											]
											type: "object"
										}
										proxyUrl: type: "string"
										queueConfig: {
											properties: {
												batchSendDeadline: type: "string"
												capacity: type: "integer"
												maxBackoff: type: "string"
												maxRetries: type: "integer"
												maxSamplesPerSend: type: "integer"
												maxShards: type: "integer"
												minBackoff: type: "string"
												minShards: type: "integer"
												retryOnRateLimit: type: "boolean"
											}
											type: "object"
										}
										remoteTimeout: {
											pattern: "^(0|(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?)$"
											type:    "string"
										}
										sendExemplars: type: "boolean"
										sigv4: {
											properties: {
												accessKey: {
													properties: {
														key: type: "string"
														name: type: "string"
														optional: type: "boolean"
													}
													required: [
														"key",
													]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												profile: type: "string"
												region: type: "string"
												roleArn: type: "string"
												secretKey: {
													properties: {
														key: type: "string"
														name: type: "string"
														optional: type: "boolean"
													}
													required: [
														"key",
													]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
											}
											type: "object"
										}
										tlsConfig: {
											properties: {
												ca: {
													properties: {
														configMap: {
															properties: {
																key: type: "string"
																name: type: "string"
																optional: type: "boolean"
															}
															required: [
																"key",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secret: {
															properties: {
																key: type: "string"
																name: type: "string"
																optional: type: "boolean"
															}
															required: [
																"key",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
												caFile: type: "string"
												cert: {
													properties: {
														configMap: {
															properties: {
																key: type: "string"
																name: type: "string"
																optional: type: "boolean"
															}
															required: [
																"key",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secret: {
															properties: {
																key: type: "string"
																name: type: "string"
																optional: type: "boolean"
															}
															required: [
																"key",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
												certFile: type: "string"
												insecureSkipVerify: type: "boolean"
												keyFile: type: "string"
												keySecret: {
													properties: {
														key: type: "string"
														name: type: "string"
														optional: type: "boolean"
													}
													required: [
														"key",
													]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												serverName: type: "string"
											}
											type: "object"
										}
										url: type: "string"
										writeRelabelConfigs: {
											items: {
												properties: {
													action: {
														default: "replace"
														enum: [
															"replace",
															"Replace",
															"keep",
															"Keep",
															"drop",
															"Drop",
															"hashmod",
															"HashMod",
															"labelmap",
															"LabelMap",
															"labeldrop",
															"LabelDrop",
															"labelkeep",
															"LabelKeep",
															"lowercase",
															"Lowercase",
															"uppercase",
															"Uppercase",
														]
														type: "string"
													}
													modulus: {
														format: "int64"
														type:   "integer"
													}
													regex: type: "string"
													replacement: type: "string"
													separator: type: "string"
													sourceLabels: {
														items: {
															pattern: "^[a-zA-Z_][a-zA-Z0-9_]*$"
															type:    "string"
														}
														type: "array"
													}
													targetLabel: type: "string"
												}
												type: "object"
											}
											type: "array"
										}
									}
									required: [
										"url",
									]
									type: "object"
								}
								type: "array"
							}
							replicaExternalLabelName: type: "string"
							replicas: {
								format: "int32"
								type:   "integer"
							}
							resources: {
								properties: {
									limits: {
										additionalProperties: {
											anyOf: [{
												type: "integer"
											}, {
												type: "string"
											}]
											pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
											"x-kubernetes-int-or-string": true
										}
										type: "object"
									}
									requests: {
										additionalProperties: {
											anyOf: [{
												type: "integer"
											}, {
												type: "string"
											}]
											pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
											"x-kubernetes-int-or-string": true
										}
										type: "object"
									}
								}
								type: "object"
							}
							retention: {
								pattern: "^(0|(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?)$"
								type:    "string"
							}
							retentionSize: {
								pattern: "(^0|([0-9]*[.])?[0-9]+((K|M|G|T|E|P)i?)?B)$"
								type:    "string"
							}
							routePrefix: type: "string"
							ruleNamespaceSelector: {
								properties: {
									matchExpressions: {
										items: {
											properties: {
												key: type: "string"
												operator: type: "string"
												values: {
													items: type: "string"
													type: "array"
												}
											}
											required: [
												"key",
												"operator",
											]
											type: "object"
										}
										type: "array"
									}
									matchLabels: {
										additionalProperties: type: "string"
										type: "object"
									}
								}
								type:                    "object"
								"x-kubernetes-map-type": "atomic"
							}
							ruleSelector: {
								properties: {
									matchExpressions: {
										items: {
											properties: {
												key: type: "string"
												operator: type: "string"
												values: {
													items: type: "string"
													type: "array"
												}
											}
											required: [
												"key",
												"operator",
											]
											type: "object"
										}
										type: "array"
									}
									matchLabels: {
										additionalProperties: type: "string"
										type: "object"
									}
								}
								type:                    "object"
								"x-kubernetes-map-type": "atomic"
							}
							rules: {
								properties: alert: {
									properties: {
										forGracePeriod: type: "string"
										forOutageTolerance: type: "string"
										resendDelay: type: "string"
									}
									type: "object"
								}
								type: "object"
							}
							scrapeInterval: {
								default: "30s"
								pattern: "^(0|(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?)$"
								type:    "string"
							}
							scrapeTimeout: {
								pattern: "^(0|(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?)$"
								type:    "string"
							}
							secrets: {
								items: type: "string"
								type: "array"
							}
							securityContext: {
								properties: {
									fsGroup: {
										format: "int64"
										type:   "integer"
									}
									fsGroupChangePolicy: type: "string"
									runAsGroup: {
										format: "int64"
										type:   "integer"
									}
									runAsNonRoot: type: "boolean"
									runAsUser: {
										format: "int64"
										type:   "integer"
									}
									seLinuxOptions: {
										properties: {
											level: type: "string"
											role: type: "string"
											type: type: "string"
											user: type: "string"
										}
										type: "object"
									}
									seccompProfile: {
										properties: {
											localhostProfile: type: "string"
											type: type: "string"
										}
										required: [
											"type",
										]
										type: "object"
									}
									supplementalGroups: {
										items: {
											format: "int64"
											type:   "integer"
										}
										type: "array"
									}
									sysctls: {
										items: {
											properties: {
												name: type: "string"
												value: type: "string"
											}
											required: [
												"name",
												"value",
											]
											type: "object"
										}
										type: "array"
									}
									windowsOptions: {
										properties: {
											gmsaCredentialSpec: type: "string"
											gmsaCredentialSpecName: type: "string"
											hostProcess: type: "boolean"
											runAsUserName: type: "string"
										}
										type: "object"
									}
								}
								type: "object"
							}
							serviceAccountName: type: "string"
							serviceMonitorNamespaceSelector: {
								properties: {
									matchExpressions: {
										items: {
											properties: {
												key: type: "string"
												operator: type: "string"
												values: {
													items: type: "string"
													type: "array"
												}
											}
											required: [
												"key",
												"operator",
											]
											type: "object"
										}
										type: "array"
									}
									matchLabels: {
										additionalProperties: type: "string"
										type: "object"
									}
								}
								type:                    "object"
								"x-kubernetes-map-type": "atomic"
							}
							serviceMonitorSelector: {
								properties: {
									matchExpressions: {
										items: {
											properties: {
												key: type: "string"
												operator: type: "string"
												values: {
													items: type: "string"
													type: "array"
												}
											}
											required: [
												"key",
												"operator",
											]
											type: "object"
										}
										type: "array"
									}
									matchLabels: {
										additionalProperties: type: "string"
										type: "object"
									}
								}
								type:                    "object"
								"x-kubernetes-map-type": "atomic"
							}
							sha: type: "string"
							shards: {
								format: "int32"
								type:   "integer"
							}
							storage: {
								properties: {
									disableMountSubPath: type: "boolean"
									emptyDir: {
										properties: {
											medium: type: "string"
											sizeLimit: {
												anyOf: [{
													type: "integer"
												}, {
													type: "string"
												}]
												pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
												"x-kubernetes-int-or-string": true
											}
										}
										type: "object"
									}
									ephemeral: {
										properties: volumeClaimTemplate: {
											properties: {
												metadata: type: "object"
												spec: {
													properties: {
														accessModes: {
															items: type: "string"
															type: "array"
														}
														dataSource: {
															properties: {
																apiGroup: type: "string"
																kind: type: "string"
																name: type: "string"
															}
															required: [
																"kind",
																"name",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														dataSourceRef: {
															properties: {
																apiGroup: type: "string"
																kind: type: "string"
																name: type: "string"
															}
															required: [
																"kind",
																"name",
															]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														resources: {
															properties: {
																limits: {
																	additionalProperties: {
																		anyOf: [{
																			type: "integer"
																		}, {
																			type: "string"
																		}]
																		pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																		"x-kubernetes-int-or-string": true
																	}
																	type: "object"
																}
																requests: {
																	additionalProperties: {
																		anyOf: [{
																			type: "integer"
																		}, {
																			type: "string"
																		}]
																		pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																		"x-kubernetes-int-or-string": true
																	}
																	type: "object"
																}
															}
															type: "object"
														}
														selector: {
															properties: {
																matchExpressions: {
																	items: {
																		properties: {
																			key: type: "string"
																			operator: type: "string"
																			values: {
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchLabels: {
																	additionalProperties: type: "string"
																	type: "object"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														storageClassName: type: "string"
														volumeMode: type: "string"
														volumeName: type: "string"
													}
													type: "object"
												}
											}
											required: [
												"spec",
											]
											type: "object"
										}
										type: "object"
									}
									volumeClaimTemplate: {
										properties: {
											apiVersion: type: "string"
											kind: type: "string"
											metadata: {
												properties: {
													annotations: {
														additionalProperties: type: "string"
														type: "object"
													}
													labels: {
														additionalProperties: type: "string"
														type: "object"
													}
													name: type: "string"
												}
												type: "object"
											}
											spec: {
												properties: {
													accessModes: {
														items: type: "string"
														type: "array"
													}
													dataSource: {
														properties: {
															apiGroup: type: "string"
															kind: type: "string"
															name: type: "string"
														}
														required: [
															"kind",
															"name",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													dataSourceRef: {
														properties: {
															apiGroup: type: "string"
															kind: type: "string"
															name: type: "string"
														}
														required: [
															"kind",
															"name",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													resources: {
														properties: {
															limits: {
																additionalProperties: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
																type: "object"
															}
															requests: {
																additionalProperties: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
																type: "object"
															}
														}
														type: "object"
													}
													selector: {
														properties: {
															matchExpressions: {
																items: {
																	properties: {
																		key: type: "string"
																		operator: type: "string"
																		values: {
																			items: type: "string"
																			type: "array"
																		}
																	}
																	required: [
																		"key",
																		"operator",
																	]
																	type: "object"
																}
																type: "array"
															}
															matchLabels: {
																additionalProperties: type: "string"
																type: "object"
															}
														}
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													storageClassName: type: "string"
													volumeMode: type: "string"
													volumeName: type: "string"
												}
												type: "object"
											}
											status: {
												properties: {
													accessModes: {
														items: type: "string"
														type: "array"
													}
													allocatedResources: {
														additionalProperties: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
															"x-kubernetes-int-or-string": true
														}
														type: "object"
													}
													capacity: {
														additionalProperties: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
															"x-kubernetes-int-or-string": true
														}
														type: "object"
													}
													conditions: {
														items: {
															properties: {
																lastProbeTime: {
																	format: "date-time"
																	type:   "string"
																}
																lastTransitionTime: {
																	format: "date-time"
																	type:   "string"
																}
																message: type: "string"
																reason: type: "string"
																status: type: "string"
																type: type: "string"
															}
															required: [
																"status",
																"type",
															]
															type: "object"
														}
														type: "array"
													}
													phase: type: "string"
													resizeStatus: type: "string"
												}
												type: "object"
											}
										}
										type: "object"
									}
								}
								type: "object"
							}
							tag: type: "string"
							thanos: {
								properties: {
									additionalArgs: {
										items: {
											properties: {
												name: {
													minLength: 1
													type:      "string"
												}
												value: type: "string"
											}
											required: [
												"name",
											]
											type: "object"
										}
										type: "array"
									}
									baseImage: type: "string"
									grpcServerTlsConfig: {
										properties: {
											ca: {
												properties: {
													configMap: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													secret: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
												}
												type: "object"
											}
											caFile: type: "string"
											cert: {
												properties: {
													configMap: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													secret: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
												}
												type: "object"
											}
											certFile: type: "string"
											insecureSkipVerify: type: "boolean"
											keyFile: type: "string"
											keySecret: {
												properties: {
													key: type: "string"
													name: type: "string"
													optional: type: "boolean"
												}
												required: [
													"key",
												]
												type:                    "object"
												"x-kubernetes-map-type": "atomic"
											}
											serverName: type: "string"
										}
										type: "object"
									}
									image: type: "string"
									listenLocal: type: "boolean"
									logFormat: {
										enum: [
											"",
											"logfmt",
											"json",
										]
										type: "string"
									}
									logLevel: {
										enum: [
											"",
											"debug",
											"info",
											"warn",
											"error",
										]
										type: "string"
									}
									minTime: type: "string"
									objectStorageConfig: {
										properties: {
											key: type: "string"
											name: type: "string"
											optional: type: "boolean"
										}
										required: [
											"key",
										]
										type:                    "object"
										"x-kubernetes-map-type": "atomic"
									}
									objectStorageConfigFile: type: "string"
									readyTimeout: {
										pattern: "^(0|(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?)$"
										type:    "string"
									}
									resources: {
										properties: {
											limits: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												type: "object"
											}
											requests: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												type: "object"
											}
										}
										type: "object"
									}
									sha: type: "string"
									tag: type: "string"
									tracingConfig: {
										properties: {
											key: type: "string"
											name: type: "string"
											optional: type: "boolean"
										}
										required: [
											"key",
										]
										type:                    "object"
										"x-kubernetes-map-type": "atomic"
									}
									tracingConfigFile: type: "string"
									version: type: "string"
									volumeMounts: {
										items: {
											properties: {
												mountPath: type: "string"
												mountPropagation: type: "string"
												name: type: "string"
												readOnly: type: "boolean"
												subPath: type: "string"
												subPathExpr: type: "string"
											}
											required: [
												"mountPath",
												"name",
											]
											type: "object"
										}
										type: "array"
									}
								}
								type: "object"
							}
							tolerations: {
								items: {
									properties: {
										effect: type: "string"
										key: type: "string"
										operator: type: "string"
										tolerationSeconds: {
											format: "int64"
											type:   "integer"
										}
										value: type: "string"
									}
									type: "object"
								}
								type: "array"
							}
							topologySpreadConstraints: {
								items: {
									properties: {
										labelSelector: {
											properties: {
												matchExpressions: {
													items: {
														properties: {
															key: type: "string"
															operator: type: "string"
															values: {
																items: type: "string"
																type: "array"
															}
														}
														required: [
															"key",
															"operator",
														]
														type: "object"
													}
													type: "array"
												}
												matchLabels: {
													additionalProperties: type: "string"
													type: "object"
												}
											}
											type:                    "object"
											"x-kubernetes-map-type": "atomic"
										}
										maxSkew: {
											format: "int32"
											type:   "integer"
										}
										minDomains: {
											format: "int32"
											type:   "integer"
										}
										topologyKey: type: "string"
										whenUnsatisfiable: type: "string"
									}
									required: [
										"maxSkew",
										"topologyKey",
										"whenUnsatisfiable",
									]
									type: "object"
								}
								type: "array"
							}
							version: type: "string"
							volumeMounts: {
								items: {
									properties: {
										mountPath: type: "string"
										mountPropagation: type: "string"
										name: type: "string"
										readOnly: type: "boolean"
										subPath: type: "string"
										subPathExpr: type: "string"
									}
									required: [
										"mountPath",
										"name",
									]
									type: "object"
								}
								type: "array"
							}
							volumes: {
								items: {
									properties: {
										awsElasticBlockStore: {
											properties: {
												fsType: type: "string"
												partition: {
													format: "int32"
													type:   "integer"
												}
												readOnly: type: "boolean"
												volumeID: type: "string"
											}
											required: [
												"volumeID",
											]
											type: "object"
										}
										azureDisk: {
											properties: {
												cachingMode: type: "string"
												diskName: type: "string"
												diskURI: type: "string"
												fsType: type: "string"
												kind: type: "string"
												readOnly: type: "boolean"
											}
											required: [
												"diskName",
												"diskURI",
											]
											type: "object"
										}
										azureFile: {
											properties: {
												readOnly: type: "boolean"
												secretName: type: "string"
												shareName: type: "string"
											}
											required: [
												"secretName",
												"shareName",
											]
											type: "object"
										}
										cephfs: {
											properties: {
												monitors: {
													items: type: "string"
													type: "array"
												}
												path: type: "string"
												readOnly: type: "boolean"
												secretFile: type: "string"
												secretRef: {
													properties: name: type: "string"
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												user: type: "string"
											}
											required: [
												"monitors",
											]
											type: "object"
										}
										cinder: {
											properties: {
												fsType: type: "string"
												readOnly: type: "boolean"
												secretRef: {
													properties: name: type: "string"
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												volumeID: type: "string"
											}
											required: [
												"volumeID",
											]
											type: "object"
										}
										configMap: {
											properties: {
												defaultMode: {
													format: "int32"
													type:   "integer"
												}
												items: {
													items: {
														properties: {
															key: type: "string"
															mode: {
																format: "int32"
																type:   "integer"
															}
															path: type: "string"
														}
														required: [
															"key",
															"path",
														]
														type: "object"
													}
													type: "array"
												}
												name: type: "string"
												optional: type: "boolean"
											}
											type:                    "object"
											"x-kubernetes-map-type": "atomic"
										}
										csi: {
											properties: {
												driver: type: "string"
												fsType: type: "string"
												nodePublishSecretRef: {
													properties: name: type: "string"
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												readOnly: type: "boolean"
												volumeAttributes: {
													additionalProperties: type: "string"
													type: "object"
												}
											}
											required: [
												"driver",
											]
											type: "object"
										}
										downwardAPI: {
											properties: {
												defaultMode: {
													format: "int32"
													type:   "integer"
												}
												items: {
													items: {
														properties: {
															fieldRef: {
																properties: {
																	apiVersion: type: "string"
																	fieldPath: type: "string"
																}
																required: [
																	"fieldPath",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															mode: {
																format: "int32"
																type:   "integer"
															}
															path: type: "string"
															resourceFieldRef: {
																properties: {
																	containerName: type: "string"
																	divisor: {
																		anyOf: [{
																			type: "integer"
																		}, {
																			type: "string"
																		}]
																		pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																		"x-kubernetes-int-or-string": true
																	}
																	resource: type: "string"
																}
																required: [
																	"resource",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
														}
														required: [
															"path",
														]
														type: "object"
													}
													type: "array"
												}
											}
											type: "object"
										}
										emptyDir: {
											properties: {
												medium: type: "string"
												sizeLimit: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
											}
											type: "object"
										}
										ephemeral: {
											properties: volumeClaimTemplate: {
												properties: {
													metadata: type: "object"
													spec: {
														properties: {
															accessModes: {
																items: type: "string"
																type: "array"
															}
															dataSource: {
																properties: {
																	apiGroup: type: "string"
																	kind: type: "string"
																	name: type: "string"
																}
																required: [
																	"kind",
																	"name",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															dataSourceRef: {
																properties: {
																	apiGroup: type: "string"
																	kind: type: "string"
																	name: type: "string"
																}
																required: [
																	"kind",
																	"name",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															resources: {
																properties: {
																	limits: {
																		additionalProperties: {
																			anyOf: [{
																				type: "integer"
																			}, {
																				type: "string"
																			}]
																			pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																			"x-kubernetes-int-or-string": true
																		}
																		type: "object"
																	}
																	requests: {
																		additionalProperties: {
																			anyOf: [{
																				type: "integer"
																			}, {
																				type: "string"
																			}]
																			pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																			"x-kubernetes-int-or-string": true
																		}
																		type: "object"
																	}
																}
																type: "object"
															}
															selector: {
																properties: {
																	matchExpressions: {
																		items: {
																			properties: {
																				key: type: "string"
																				operator: type: "string"
																				values: {
																					items: type: "string"
																					type: "array"
																				}
																			}
																			required: [
																				"key",
																				"operator",
																			]
																			type: "object"
																		}
																		type: "array"
																	}
																	matchLabels: {
																		additionalProperties: type: "string"
																		type: "object"
																	}
																}
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															storageClassName: type: "string"
															volumeMode: type: "string"
															volumeName: type: "string"
														}
														type: "object"
													}
												}
												required: [
													"spec",
												]
												type: "object"
											}
											type: "object"
										}
										fc: {
											properties: {
												fsType: type: "string"
												lun: {
													format: "int32"
													type:   "integer"
												}
												readOnly: type: "boolean"
												targetWWNs: {
													items: type: "string"
													type: "array"
												}
												wwids: {
													items: type: "string"
													type: "array"
												}
											}
											type: "object"
										}
										flexVolume: {
											properties: {
												driver: type: "string"
												fsType: type: "string"
												options: {
													additionalProperties: type: "string"
													type: "object"
												}
												readOnly: type: "boolean"
												secretRef: {
													properties: name: type: "string"
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
											}
											required: [
												"driver",
											]
											type: "object"
										}
										flocker: {
											properties: {
												datasetName: type: "string"
												datasetUUID: type: "string"
											}
											type: "object"
										}
										gcePersistentDisk: {
											properties: {
												fsType: type: "string"
												partition: {
													format: "int32"
													type:   "integer"
												}
												pdName: type: "string"
												readOnly: type: "boolean"
											}
											required: [
												"pdName",
											]
											type: "object"
										}
										gitRepo: {
											properties: {
												directory: type: "string"
												repository: type: "string"
												revision: type: "string"
											}
											required: [
												"repository",
											]
											type: "object"
										}
										glusterfs: {
											properties: {
												endpoints: type: "string"
												path: type: "string"
												readOnly: type: "boolean"
											}
											required: [
												"endpoints",
												"path",
											]
											type: "object"
										}
										hostPath: {
											properties: {
												path: type: "string"
												type: type: "string"
											}
											required: [
												"path",
											]
											type: "object"
										}
										iscsi: {
											properties: {
												chapAuthDiscovery: type: "boolean"
												chapAuthSession: type: "boolean"
												fsType: type: "string"
												initiatorName: type: "string"
												iqn: type: "string"
												iscsiInterface: type: "string"
												lun: {
													format: "int32"
													type:   "integer"
												}
												portals: {
													items: type: "string"
													type: "array"
												}
												readOnly: type: "boolean"
												secretRef: {
													properties: name: type: "string"
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												targetPortal: type: "string"
											}
											required: [
												"iqn",
												"lun",
												"targetPortal",
											]
											type: "object"
										}
										name: type: "string"
										nfs: {
											properties: {
												path: type: "string"
												readOnly: type: "boolean"
												server: type: "string"
											}
											required: [
												"path",
												"server",
											]
											type: "object"
										}
										persistentVolumeClaim: {
											properties: {
												claimName: type: "string"
												readOnly: type: "boolean"
											}
											required: [
												"claimName",
											]
											type: "object"
										}
										photonPersistentDisk: {
											properties: {
												fsType: type: "string"
												pdID: type: "string"
											}
											required: [
												"pdID",
											]
											type: "object"
										}
										portworxVolume: {
											properties: {
												fsType: type: "string"
												readOnly: type: "boolean"
												volumeID: type: "string"
											}
											required: [
												"volumeID",
											]
											type: "object"
										}
										projected: {
											properties: {
												defaultMode: {
													format: "int32"
													type:   "integer"
												}
												sources: {
													items: {
														properties: {
															configMap: {
																properties: {
																	items: {
																		items: {
																			properties: {
																				key: type: "string"
																				mode: {
																					format: "int32"
																					type:   "integer"
																				}
																				path: type: "string"
																			}
																			required: [
																				"key",
																				"path",
																			]
																			type: "object"
																		}
																		type: "array"
																	}
																	name: type: "string"
																	optional: type: "boolean"
																}
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															downwardAPI: {
																properties: items: {
																	items: {
																		properties: {
																			fieldRef: {
																				properties: {
																					apiVersion: type: "string"
																					fieldPath: type: "string"
																				}
																				required: [
																					"fieldPath",
																				]
																				type:                    "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			mode: {
																				format: "int32"
																				type:   "integer"
																			}
																			path: type: "string"
																			resourceFieldRef: {
																				properties: {
																					containerName: type: "string"
																					divisor: {
																						anyOf: [{
																							type: "integer"
																						}, {
																							type: "string"
																						}]
																						pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																						"x-kubernetes-int-or-string": true
																					}
																					resource: type: "string"
																				}
																				required: [
																					"resource",
																				]
																				type:                    "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																		}
																		required: [
																			"path",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																type: "object"
															}
															secret: {
																properties: {
																	items: {
																		items: {
																			properties: {
																				key: type: "string"
																				mode: {
																					format: "int32"
																					type:   "integer"
																				}
																				path: type: "string"
																			}
																			required: [
																				"key",
																				"path",
																			]
																			type: "object"
																		}
																		type: "array"
																	}
																	name: type: "string"
																	optional: type: "boolean"
																}
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															serviceAccountToken: {
																properties: {
																	audience: type: "string"
																	expirationSeconds: {
																		format: "int64"
																		type:   "integer"
																	}
																	path: type: "string"
																}
																required: [
																	"path",
																]
																type: "object"
															}
														}
														type: "object"
													}
													type: "array"
												}
											}
											type: "object"
										}
										quobyte: {
											properties: {
												group: type: "string"
												readOnly: type: "boolean"
												registry: type: "string"
												tenant: type: "string"
												user: type: "string"
												volume: type: "string"
											}
											required: [
												"registry",
												"volume",
											]
											type: "object"
										}
										rbd: {
											properties: {
												fsType: type: "string"
												image: type: "string"
												keyring: type: "string"
												monitors: {
													items: type: "string"
													type: "array"
												}
												pool: type: "string"
												readOnly: type: "boolean"
												secretRef: {
													properties: name: type: "string"
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												user: type: "string"
											}
											required: [
												"image",
												"monitors",
											]
											type: "object"
										}
										scaleIO: {
											properties: {
												fsType: type: "string"
												gateway: type: "string"
												protectionDomain: type: "string"
												readOnly: type: "boolean"
												secretRef: {
													properties: name: type: "string"
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												sslEnabled: type: "boolean"
												storageMode: type: "string"
												storagePool: type: "string"
												system: type: "string"
												volumeName: type: "string"
											}
											required: [
												"gateway",
												"secretRef",
												"system",
											]
											type: "object"
										}
										secret: {
											properties: {
												defaultMode: {
													format: "int32"
													type:   "integer"
												}
												items: {
													items: {
														properties: {
															key: type: "string"
															mode: {
																format: "int32"
																type:   "integer"
															}
															path: type: "string"
														}
														required: [
															"key",
															"path",
														]
														type: "object"
													}
													type: "array"
												}
												optional: type: "boolean"
												secretName: type: "string"
											}
											type: "object"
										}
										storageos: {
											properties: {
												fsType: type: "string"
												readOnly: type: "boolean"
												secretRef: {
													properties: name: type: "string"
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												volumeName: type: "string"
												volumeNamespace: type: "string"
											}
											type: "object"
										}
										vsphereVolume: {
											properties: {
												fsType: type: "string"
												storagePolicyID: type: "string"
												storagePolicyName: type: "string"
												volumePath: type: "string"
											}
											required: [
												"volumePath",
											]
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
							walCompression: type: "boolean"
							web: {
								properties: {
									httpConfig: {
										properties: {
											headers: {
												properties: {
													contentSecurityPolicy: type: "string"
													strictTransportSecurity: type: "string"
													xContentTypeOptions: {
														enum: [
															"",
															"NoSniff",
														]
														type: "string"
													}
													xFrameOptions: {
														enum: [
															"",
															"Deny",
															"SameOrigin",
														]
														type: "string"
													}
													xXSSProtection: type: "string"
												}
												type: "object"
											}
											http2: type: "boolean"
										}
										type: "object"
									}
									pageTitle: type: "string"
									tlsConfig: {
										properties: {
											cert: {
												properties: {
													configMap: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													secret: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
												}
												type: "object"
											}
											cipherSuites: {
												items: type: "string"
												type: "array"
											}
											client_ca: {
												properties: {
													configMap: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													secret: {
														properties: {
															key: type: "string"
															name: type: "string"
															optional: type: "boolean"
														}
														required: [
															"key",
														]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
												}
												type: "object"
											}
											clientAuthType: type: "string"
											curvePreferences: {
												items: type: "string"
												type: "array"
											}
											keySecret: {
												properties: {
													key: type: "string"
													name: type: "string"
													optional: type: "boolean"
												}
												required: [
													"key",
												]
												type:                    "object"
												"x-kubernetes-map-type": "atomic"
											}
											maxVersion: type: "string"
											minVersion: type: "string"
											preferServerCipherSuites: type: "boolean"
										}
										required: [
											"cert",
											"keySecret",
										]
										type: "object"
									}
								}
								type: "object"
							}
						}
						type: "object"
					}
					status: {
						properties: {
							availableReplicas: {
								format: "int32"
								type:   "integer"
							}
							conditions: {
								items: {
									properties: {
										lastTransitionTime: {
											format: "date-time"
											type:   "string"
										}
										message: type: "string"
										reason: type: "string"
										status: type: "string"
										type: type: "string"
									}
									required: [
										"lastTransitionTime",
										"status",
										"type",
									]
									type: "object"
								}
								type: "array"
								"x-kubernetes-list-map-keys": [
									"type",
								]
								"x-kubernetes-list-type": "map"
							}
							paused: type: "boolean"
							replicas: {
								format: "int32"
								type:   "integer"
							}
							shardStatuses: {
								items: {
									properties: {
										availableReplicas: {
											format: "int32"
											type:   "integer"
										}
										replicas: {
											format: "int32"
											type:   "integer"
										}
										shardID: type: "string"
										unavailableReplicas: {
											format: "int32"
											type:   "integer"
										}
										updatedReplicas: {
											format: "int32"
											type:   "integer"
										}
									}
									required: [
										"availableReplicas",
										"replicas",
										"shardID",
										"unavailableReplicas",
										"updatedReplicas",
									]
									type: "object"
								}
								type: "array"
								"x-kubernetes-list-map-keys": [
									"shardID",
								]
								"x-kubernetes-list-type": "map"
							}
							unavailableReplicas: {
								format: "int32"
								type:   "integer"
							}
							updatedReplicas: {
								format: "int32"
								type:   "integer"
							}
						}
						required: [
							"availableReplicas",
							"paused",
							"replicas",
							"unavailableReplicas",
							"updatedReplicas",
						]
						type: "object"
					}
				}
				required: [
					"spec",
				]
				type: "object"
			}
			served:  true
			storage: true
			subresources: status: {}
		}]
	}
}