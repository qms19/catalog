package main

const: {
	// +usage=The name of the addon application
	name: "addon-alertmanager"
}

parameter: {

	// global parameters

	// +usage=The namespace of the alertmanager to be installed
	namespace: *"o11y-system" | string
	// +usage=The clusters to install
	clusters?: [...string]


	// +usage=Specify the image of alertmanager
	image: *"bitnami/alertmanager:0.24.0" | string
	// +usage=Specify the imagePullPolicy of the image
	imagePullPolicy: *"IfNotPresent" | "Never" | "Always"
	// +usage=Specify the number of CPU units
	cpu: *0.1 | number
	// +usage=Specifies the attributes of the memory resource required for the container.
	memory: *"250Mi" | string
}
