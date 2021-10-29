---
Date: 2021-10-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code"]
Alias: default.yml
---

# Default Espanso Script

Path: `%APPDATA%\espanso\default.yml`

```yaml
matches:
  - trigger: ":address"
    replace: "2161 Peachtree Rd NE, Unit 401, Atlanta, GA, 30309"
  - trigger: ":about"
    replace: "Creative and entrepreneurial Software Engineer and Actuarial Scientist with background working in dynamic and progressive environments as both an actuary and a developer in large and small organizations.\nFluent in a multitude of programming languages and frameworks used to develop software within a wide variety of industries.\nCollaborative team player focused on scoping projects and achieving objectives with speed and accuracy.\nSuccessful history of identifying patterns, making interpretations, and producing results."
  - trigger: ":date"
    replace: "{{mydate}}"
    vars:
      - name: mydate
        type: date
        params:
          format: "%Y-%m-%d"
  - trigger: ":shell"
    replace: "{{output}}"
    vars:
      - name: output
        type: shell
        params:
          cmd: "echo Hello from your shell"
```