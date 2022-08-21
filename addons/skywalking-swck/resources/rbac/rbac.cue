package main
rbac: [{
	apiVersion: "v1"
	kind:       "ServiceAccount"
	metadata: {
		name:      "skywalking-swck-controller-manager"
		namespace: "skywalking-swck-system"
	}
}, {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "Role"
	metadata: {
		name:      "skywalking-swck-leader-election-role"
		namespace: "skywalking-swck-system"
	}
	rules: [{
		apiGroups: [
			"",
		]
		resources: [
			"configmaps",
		]
		verbs: [
			"get",
			"list",
			"watch",
			"create",
			"update",
			"patch",
			"delete",
		]
	}, {
		apiGroups: [
			"coordination.k8s.io",
		]
		resources: [
			"leases",
		]
		verbs: [
			"get",
			"list",
			"watch",
			"create",
			"update",
			"patch",
			"delete",
		]
	}, {
		apiGroups: [
			"",
		]
		resources: [
			"events",
		]
		verbs: [
			"create",
			"patch",
		]
	}]
}, {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "ClusterRole"
	metadata: {
		creationTimestamp: null
		name:              "skywalking-swck-manager-role"
	}
	rules: [{
		apiGroups: [
			"certificates.k8s.io",
		]
		resourceNames: [
			"kubernetes.io/*",
		]
		resources: [
			"signers",
		]
		verbs: [
			"approve",
		]
	}, {
		apiGroups: [
			"",
		]
		resources: [
			"configmaps",
		]
		verbs: [
			"create",
			"delete",
			"get",
			"list",
			"patch",
			"update",
			"watch",
		]
	}, {
		apiGroups: [
			"",
		]
		resources: [
			"configmaps/status",
		]
		verbs: [
			"get",
			"patch",
			"update",
		]
	}, {
		apiGroups: [
			"",
		]
		resources: [
			"events",
		]
		verbs: [
			"create",
			"patch",
		]
	}, {
		apiGroups: [
			"",
		]
		resources: [
			"pods",
		]
		verbs: [
			"create",
			"get",
			"list",
			"patch",
			"update",
			"watch",
		]
	}, {
		apiGroups: [
			"",
		]
		resources: [
			"secrets",
			"serviceaccounts",
			"services",
		]
		verbs: [
			"create",
			"delete",
			"get",
			"list",
			"patch",
			"update",
			"watch",
		]
	}, {
		apiGroups: [
			"",
		]
		resources: [
			"serviceaccounts",
			"services",
		]
		verbs: [
			"create",
			"delete",
			"get",
			"list",
			"patch",
			"update",
			"watch",
		]
	}, {
		apiGroups: [
			"apps",
		]
		resources: [
			"deployments",
		]
		verbs: [
			"create",
			"delete",
			"get",
			"list",
			"patch",
			"update",
			"watch",
		]
	}, {
		apiGroups: [
			"apps",
		]
		resources: [
			"statefulsets",
		]
		verbs: [
			"create",
			"delete",
			"get",
			"list",
			"patch",
			"update",
			"watch",
		]
	}, {
		apiGroups: [
			"certificates.k8s.io",
		]
		resources: [
			"certificatesigningrequests",
		]
		verbs: [
			"create",
			"delete",
			"get",
			"list",
			"watch",
		]
	}, {
		apiGroups: [
			"certificates.k8s.io",
		]
		resources: [
			"certificatesigningrequests/approval",
		]
		verbs: [
			"update",
		]
	}, {
		apiGroups: [
			"coordination.k8s.io",
		]
		resources: [
			"leases",
		]
		verbs: [
			"create",
			"get",
			"update",
		]
	}, {
		apiGroups: [
			"networking.k8s.io",
		]
		resources: [
			"ingresses",
		]
		verbs: [
			"create",
			"delete",
			"get",
			"list",
			"patch",
			"update",
			"watch",
		]
	}, {
		apiGroups: [
			"operator.skywalking.apache.org",
		]
		resources: [
			"fetchers",
		]
		verbs: [
			"create",
			"delete",
			"get",
			"list",
			"patch",
			"update",
			"watch",
		]
	}, {
		apiGroups: [
			"operator.skywalking.apache.org",
		]
		resources: [
			"fetchers/status",
		]
		verbs: [
			"get",
			"patch",
			"update",
		]
	}, {
		apiGroups: [
			"operator.skywalking.apache.org",
		]
		resources: [
			"javaagents",
		]
		verbs: [
			"create",
			"delete",
			"get",
			"list",
			"patch",
			"update",
			"watch",
		]
	}, {
		apiGroups: [
			"operator.skywalking.apache.org",
		]
		resources: [
			"javaagents/status",
		]
		verbs: [
			"delete",
			"get",
			"patch",
			"update",
		]
	}, {
		apiGroups: [
			"operator.skywalking.apache.org",
		]
		resources: [
			"oapservers",
		]
		verbs: [
			"create",
			"delete",
			"get",
			"list",
			"patch",
			"update",
			"watch",
		]
	}, {
		apiGroups: [
			"operator.skywalking.apache.org",
		]
		resources: [
			"oapservers/status",
		]
		verbs: [
			"get",
			"patch",
			"update",
		]
	}, {
		apiGroups: [
			"operator.skywalking.apache.org",
		]
		resources: [
			"satellites",
		]
		verbs: [
			"create",
			"delete",
			"get",
			"list",
			"patch",
			"update",
			"watch",
		]
	}, {
		apiGroups: [
			"operator.skywalking.apache.org",
		]
		resources: [
			"satellites/finalizers",
		]
		verbs: [
			"update",
		]
	}, {
		apiGroups: [
			"operator.skywalking.apache.org",
		]
		resources: [
			"satellites/status",
		]
		verbs: [
			"get",
			"patch",
			"update",
		]
	}, {
		apiGroups: [
			"operator.skywalking.apache.org",
		]
		resources: [
			"storages",
		]
		verbs: [
			"create",
			"delete",
			"get",
			"list",
			"patch",
			"update",
			"watch",
		]
	}, {
		apiGroups: [
			"operator.skywalking.apache.org",
		]
		resources: [
			"storages/status",
		]
		verbs: [
			"get",
			"patch",
			"update",
		]
	}, {
		apiGroups: [
			"operator.skywalking.apache.org",
		]
		resources: [
			"uis",
		]
		verbs: [
			"create",
			"delete",
			"get",
			"list",
			"patch",
			"update",
			"watch",
		]
	}, {
		apiGroups: [
			"operator.skywalking.apache.org",
		]
		resources: [
			"uis/status",
		]
		verbs: [
			"get",
			"patch",
			"update",
		]
	}, {
		apiGroups: [
			"rbac.authorization.k8s.io",
		]
		resources: [
			"clusterrolebindings",
			"clusterroles",
		]
		verbs: [
			"*",
		]
	}]
}, {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "ClusterRole"
	metadata: name: "skywalking-swck-metrics-reader"
	rules: [{
		nonResourceURLs: [
			"/metrics",
		]
		verbs: [
			"get",
		]
	}]
}, {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "ClusterRole"
	metadata: name: "skywalking-swck-proxy-role"
	rules: [{
		apiGroups: [
			"authentication.k8s.io",
		]
		resources: [
			"tokenreviews",
		]
		verbs: [
			"create",
		]
	}, {
		apiGroups: [
			"authorization.k8s.io",
		]
		resources: [
			"subjectaccessreviews",
		]
		verbs: [
			"create",
		]
	}]
}, {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "RoleBinding"
	metadata: {
		name:      "skywalking-swck-leader-election-rolebinding"
		namespace: "skywalking-swck-system"
	}
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "Role"
		name:     "skywalking-swck-leader-election-role"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "skywalking-swck-controller-manager"
		namespace: "skywalking-swck-system"
	}]
}, {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "ClusterRoleBinding"
	metadata: name: "skywalking-swck-manager-rolebinding"
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "ClusterRole"
		name:     "skywalking-swck-manager-role"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "skywalking-swck-controller-manager"
		namespace: "skywalking-swck-system"
	}]
}, {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "ClusterRoleBinding"
	metadata: name: "skywalking-swck-proxy-rolebinding"
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "ClusterRole"
		name:     "skywalking-swck-proxy-role"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "skywalking-swck-controller-manager"
		namespace: "skywalking-swck-system"
	}]
}
]