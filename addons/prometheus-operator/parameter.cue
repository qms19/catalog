package main

const: {
	// +usage=The name of the addon application
	name: "addon-prometheus-operator"
}

parameter: {

	// global parameters

	// +usage=The namespace of the prometheus-operator to be installed
	namespace: *"o11y-system" | string
	// +usage=The clusters to install
	clusters?: [...string]


	// +usage=Specify the image of prometheus-operator
	image: *"quay.io/prometheus-operator/prometheus-operator:v0.58.0" | string
}
