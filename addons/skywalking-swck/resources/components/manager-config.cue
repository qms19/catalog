package main
managerConfig: {
	apiVersion: "v1"
	data: "controller_manager_config.yaml": """
		# Licensed to Apache Software Foundation (ASF) under one or more contributor
		# license agreements. See the NOTICE file distributed with
		# this work for additional information regarding copyright
		# ownership. Apache Software Foundation (ASF) licenses this file to you under
		# the Apache License, Version 2.0 (the \"License\"); you may
		# not use this file except in compliance with the License.
		# You may obtain a copy of the License at
		#
		#     http://www.apache.org/licenses/LICENSE-2.0
		#
		# Unless required by applicable law or agreed to in writing,
		# software distributed under the License is distributed on an
		# \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
		# KIND, either express or implied.  See the License for the
		# specific language governing permissions and limitations
		# under the License.
		#
		apiVersion: controller-runtime.sigs.k8s.io/v1alpha1
		kind: ControllerManagerConfig
		health:
		  healthProbeBindAddress: :8081
		metrics:
		  bindAddress: 127.0.0.1:8080
		webhook:
		  port: 9443
		leaderElection:
		  leaderElect: true
		  resourceName: v1alpha1.swck.skywalking.apache.org

		"""

	kind: "ConfigMap"
	metadata: {
		name:      "skywalking-swck-manager-config"
		namespace: "skywalking-swck-system"
	}
}