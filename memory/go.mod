module github.com/skydive-project/skydive-plugins/memory

go 1.14

require (
	github.com/juju/clock v0.0.0-20190205081909-9c5c9712527c // indirect
	github.com/juju/errors v0.0.0-20190806202954-0232dcc7464d // indirect
	github.com/juju/retry v0.0.0-20180821225755-9058e192b216 // indirect
	github.com/juju/testing v0.0.0-20190723135506-ce30eb24acd2 // indirect
	github.com/juju/utils v0.0.0-20180820210520-bf9cc5bdd62d // indirect
	github.com/juju/version v0.0.0-20180108022336-b64dbd566305 // indirect
	github.com/mailru/easyjson v0.7.1
	github.com/networkservicemesh/networkservicemesh v0.1.0 // indirect
	github.com/shirou/gopsutil v2.18.12+incompatible
	github.com/skydive-project/skydive v0.26.1-0.20200514162914-4521c89fa0ac
	golang.org/x/sys v0.0.0-20200515095857-1151b9dac4a9 // indirect
	golang.org/x/tools v0.0.0-20200519015757-0d0afa43d58a // indirect
)

replace (
	// Solve: github.com/census-instrumentation/opencensus-proto@v0.1.0-0.20181214143942-ba49f56771b8: invalid pseudo-version: version before v0.1.0 would have negative patch number
	github.com/census-instrumentation/opencensus-proto v0.1.0-0.20181214143942-ba49f56771b8 => github.com/census-instrumentation/opencensus-proto v0.0.3-0.20181214143942-ba49f56771b8

	// https://github.com/networkservicemesh/networkservicemesh/issues/2157
	github.com/networkservicemesh/networkservicemesh => github.com/networkservicemesh/networkservicemesh v0.0.0-20191017074247-aa5815869b2c
	github.com/networkservicemesh/networkservicemesh/controlplane => github.com/networkservicemesh/networkservicemesh/controlplane v0.0.0-20191017074247-aa5815869b2c
	github.com/networkservicemesh/networkservicemesh/controlplane/api => github.com/networkservicemesh/networkservicemesh/controlplane/api v0.0.0-20191017074247-aa5815869b2c
	github.com/networkservicemesh/networkservicemesh/dataplane => github.com/networkservicemesh/networkservicemesh/dataplane v0.0.0-20191017074247-aa5815869b2c
	github.com/networkservicemesh/networkservicemesh/dataplane/api => github.com/networkservicemesh/networkservicemesh/dataplane/api v0.0.0-20191017074247-aa5815869b2c
	github.com/networkservicemesh/networkservicemesh/k8s => github.com/networkservicemesh/networkservicemesh/k8s v0.0.0-20191017074247-aa5815869b2c
	github.com/networkservicemesh/networkservicemesh/k8s/api => github.com/networkservicemesh/networkservicemesh/k8s/api v0.0.0-20191017074247-aa5815869b2c
	github.com/networkservicemesh/networkservicemesh/pkg => github.com/networkservicemesh/networkservicemesh/pkg v0.0.0-20191017074247-aa5815869b2c
	github.com/networkservicemesh/networkservicemesh/sdk => github.com/networkservicemesh/networkservicemesh/sdk v0.0.0-20191017074247-aa5815869b2c
	github.com/networkservicemesh/networkservicemesh/utils => github.com/networkservicemesh/networkservicemesh/utils v0.0.0-20191017074247-aa5815869b2c

	// https://github.com/kubernetes/kubernetes/issues/79384
	k8s.io/api => k8s.io/api v0.16.9
	k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.16.9
	k8s.io/apimachinery => k8s.io/apimachinery v0.16.9
	k8s.io/apiserver => k8s.io/apiserver v0.16.9
	k8s.io/cli-runtime => k8s.io/cli-runtime v0.16.9
	k8s.io/client-go => k8s.io/client-go v0.16.9
	k8s.io/cloud-provider => k8s.io/cloud-provider v0.16.9
	k8s.io/cluster-bootstrap => k8s.io/cluster-bootstrap v0.16.9
	k8s.io/code-generator => k8s.io/code-generator v0.16.9
	k8s.io/component-base => k8s.io/component-base v0.16.9
	k8s.io/cri-api => k8s.io/cri-api v0.16.9
	k8s.io/csi-translation-lib => k8s.io/csi-translation-lib v0.16.9
	k8s.io/kube-aggregator => k8s.io/kube-aggregator v0.16.9
	k8s.io/kube-controller-manager => k8s.io/kube-controller-manager v0.16.9
	k8s.io/kube-proxy => k8s.io/kube-proxy v0.16.9
	k8s.io/kube-scheduler => k8s.io/kube-scheduler v0.16.9
	k8s.io/kubectl => k8s.io/kubectl v0.16.9
	k8s.io/kubelet => k8s.io/kubelet v0.16.9
	k8s.io/legacy-cloud-providers => k8s.io/legacy-cloud-providers v0.16.9
	k8s.io/metrics => k8s.io/metrics v0.16.9
	k8s.io/sample-apiserver => k8s.io/sample-apiserver v0.16.9
)
