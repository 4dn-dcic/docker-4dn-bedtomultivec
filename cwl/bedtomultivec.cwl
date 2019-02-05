#!/usr/bin/env cwl-runner

class: CommandLineTool

cwlVersion: v1.0

requirements:
- class: DockerRequirement
  dockerPull: "4dndcic/4dn-bedtobeddb:v2"

- class: "InlineJavascriptRequirement"

inputs:
 bedfile:
  type: File
  inputBinding:
   position: 1

 assembly:
  type: string
  inputBinding:
   position: 2

 outdir:
  type: string
  inputBinding:
   position: 3
  default: "."

outputs:
 beddbfile:
  type: File
  outputBinding:
   glob: "$(inputs.outdir + '/' +  '*.beddb')"

baseCommand: ["run-bedtobeddb.sh"]
