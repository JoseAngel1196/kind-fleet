{{- define "kubePrometheusStackValues" -}}
{{- $prometheusName := required "addons.kubePrometheusStack.prometheusName is required" .Values.addons.kubePrometheusStack.prometheusName -}}
nameOverride: {{ $prometheusName }}
