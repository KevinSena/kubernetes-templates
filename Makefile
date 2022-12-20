cluster-kind:
	kind create cluster --config=k8s/kind.yaml --name=kevin

stress:
	kubectl run -it fortio --rm --image=fortio/fortio -- load -qps 800 -t 120s -c 70 "http://goserver-service:8080"
