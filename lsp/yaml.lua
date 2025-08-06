return {
	cmd = { 'yaml-language-server', '--stdio' },
	filetypes = { 'yaml', 'yml', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.helm-values' },
	root_markers = { '.git' },
	settings = {
		yaml = {
			schemas = {
				-- kubernetes
				kubernetes = {
					"deployment.yaml",
					"deployment-patch.yaml",
					"patch.yaml",
					"dev-patch.yaml",
					"test-patch.yaml",
					"prod-patch.yaml",
					"cronjob.yaml",
					"cronjob-patch.yaml",
					"ingress.yaml",
					"service.yaml",
					"namespace.yaml",
					"hpa.yaml",
				},
				["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
				-- github workflows
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
		},
	}
}
