package main
javaAgentConfigmap: {
	apiVersion: "v1"
	data: "agent.config": """
		# The service name in UI
		agent.service_name=${SW_AGENT_NAME:Your_ApplicationName}

		# Backend service addresses.
		collector.backend_service=${SW_AGENT_COLLECTOR_BACKEND_SERVICES:127.0.0.1:11800}

		# Please refer to https://skywalking.apache.org/docs/skywalking-java/latest/en/setup/service-agent/java-agent/configurations/#table-of-agent-configuration-properties to get more details.
		"""

	kind: "ConfigMap"
	metadata: {
		name:      "skywalking-swck-java-agent-configmap"
		namespace: "skywalking-swck-system"
	}
}