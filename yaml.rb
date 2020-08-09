require 'yaml'

yaml_data = <<-DATA
- RED
- GREEN
- BLUE
---
- YELLOW
- PINK
- WHITE
DATA
p YAML.load(yaml_data)
