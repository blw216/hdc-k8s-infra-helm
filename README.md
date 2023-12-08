# hdc-k8s-infra-helm
Home data center Kubernetes (k8s) Helm-based deployments.

From: https://helm.sh/docs/chart_template_guide/getting_started/

The templates/ directory is for template files. When Helm evaluates a chart, it will send all of the files in the templates/ directory through the template rendering engine. It then collects the results of those templates and sends them on to Kubernetes.

The values.yaml file is also important to templates. This file contains the default values for a chart. These values may be overridden by users during helm install or helm upgrade.

The Chart.yaml file contains a description of the chart. You can access it from within a template.

The charts/ directory may contain other charts (which we call subcharts). Later in this guide we will see how those work when it comes to template rendering.

In Kubernetes, a ConfigMap is simply an object for storing configuration data. Other things, like pods, can access the data in a ConfigMap

```
$ microk8s helm install full-send ./mychart
$ microk8s helm get manifest full-send
$ microk8s helm uninstall full-send
```

https://kubernetes.io/docs/concepts/configuration/configmap

A ConfigMap is an API object used to store non-confidential data in key-value pairs. Pods can consume ConfigMaps as environment variables, command-line arguments, or as configuration files in a volume. A ConfigMap allows you to decouple environment-specific configuration from your container images, so that your applications are easily portable. You can write a Pod spec that refers to a ConfigMap and configures the container(s) in that Pod based on the data in the ConfigMap. The Pod and the ConfigMap must be in the same namespace. There are four different ways that you can use a ConfigMap to configure a container inside a Pod:

1. Inside a container command and args
2. Environment variables for a container
3. Add a file in read-only volume, for the application to read
4. Write code to run inside the Pod that uses the Kubernetes API to read a ConfigMap

Regarding templates: 

1. Most files in templates/ are treated as if they contain Kubernetes manifests
2. The NOTES.txt is one exception
3. Files whose name begins with an underscore (_) are assumed to not have a manifest inside. These files are not rendered to Kubernetes object definitions, but are available everywhere within other chart templates for use.

Regarding subcharts:

1. A subchart is considered "stand-alone", which means a subchart can never explicitly depend on its parent chart.
2. For that reason, a subchart cannot access the values of its parent.
3. A parent chart can override values for subcharts.
4. Helm has a concept of global values that can be accessed by all charts.
5. Parent charts and subcharts can share templates. Any defined block in any chart is available to other charts.

