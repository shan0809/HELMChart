{{- define "mycharts.labels"  }}
  labels:
    generator: helm
    deployedby: shan
    date: {{ now | htmlDate }}
{{- end }}