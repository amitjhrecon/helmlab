{{- define "im.nameprefix" -}}
{{- if .Values.im.prefixOverride -}}
{{- .Values.im.prefixOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Chart.Name .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}