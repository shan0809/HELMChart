{{- define "mycharts.labels"  }}
  labels:
    generator: helm
    deployedby: shan
    date: {{ now | htmlDate }}
{{- end }}

{{- define "secret.defaultlabels"}}
name: secrets
namespace: {{.Release.Namespace}}
release: {{.Release.Name}}
chart: secret

{{- end -}}

{{/*{{- define "randome.secret"}}*/}}
{{/*{{- if and .Values.secret1.secret2.secret3.blockkey.fromstring.active .Values.secret1.secret2.secret3.haskey.fromstring.active -}}*/}}
{{/*{{- range $index, $key := .Values.secret.creds.secretid}}*/}}
{{/*cookie.block.key.{{$index}} : {{ $key | b64enc | quote}}*/}}
{{/*{{end}}*/}}
{{/*{{- range $index, $key := .Values.secret.creds.secretid}}*/}}
{{/*cookie.hash.key.{{$index}}: {{$key | b64enc | quote}}*/}}
{{/*{{end}}*/}}
{{/*{{- else if .Values.secret1.secret2.secret3.blockkey.fromstring.active.secretName .Values.secret1.secret2.secret3.haskey.fromstring.active.secretName -}}*/}}
{{/*{{- else -}}*/}}
{{/*cookie.block.key.active: {{ randAlphaNum 32 | b64enc | quote}}*/}}
{{/*cookie.hash.key.active: {{randAlphaNum 16 | b64enc | quote}}*/}}
{{/*{{end}}*/}}
{{/*{{end}}*/}}


{{- define "randome.secret" -}}
{{- if and .Values.secret1.secret2.secret3.blockkey.fromstring.active .Values.secret1.secret2.secret3.haskey.fromstring.active -}}
{{- range $index, $key := .Values.secret.creds.secretid }}
cookie.block.key.{{$index}}: {{ $key | b64enc | quote }}
{{- end }}
{{- range $index, $key := .Values.secret.creds.secretid }}
cookie.hash.key.{{$index}}: {{ $key | b64enc | quote }}
{{- end }}
{{- else if and .Values.secret1.secret2.secret3.blockkey.fromstring.active.secretName .Values.secret1.secret2.secret3.haskey.fromstring.active -}}
{{- else -}}
cookie.block.key.active: {{ randAlphaNum 32 | b64enc | quote }}
cookie.hash.key.active: {{ randAlphaNum 16 | b64enc | quote }}
{{- end -}}
{{- end -}}