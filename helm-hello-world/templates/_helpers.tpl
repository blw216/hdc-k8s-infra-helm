{{/* Generate basic labels */}}

{{/*
  !Warning! Template names are _global_, sub-chart helper
  templates will override this if they are named the same!
 */}}

{{- define "mychart.labels" }}
  labels:
    generator: helm
    date: {{ now | htmlDate }}
    chart: {{ .Chart.Name }}
    version: {{ .Chart.Version }}
{{- end }}

{{- define "mychart.app" -}}
app_name: {{ .Chart.Name }}
app_version: "{{ .Chart.Version }}"
{{- end -}}