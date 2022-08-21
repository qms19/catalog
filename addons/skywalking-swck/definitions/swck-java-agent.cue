"swck-java-agent": {
	alias: "sjat"
	annotations: {}
	attributes: {
		appliesToWorkloads: [
			"deployments.apps",
			"replicasets.apps",
		]
		conflictsWith: []
		podDisruptive:   false
		workloadRefPath: ""
	}
	description: "swck-java-agent trait description."
	labels: {}
	type: "trait"
}
template: {
	parameter: {param: ""}
	outputs: {sample: {}}
}
