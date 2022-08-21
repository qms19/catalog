# skywalking-swck

This is an addon template. Check how to build your own addon: https://kubevela.net/docs/platform-engineers/addon/intro


# skywalking-swck-system
{
	apiVersion: "v1"
	kind:       "Namespace"
  	metadata: {
		labels: "control-plane": "controller-manager"
		name: "skywalking-swck-system"
	}
},