#!/usr/bin/env cwl-runner

class: CommandLineTool

cwlVersion: v1.0

requirements:
- class: DockerRequirement
  dockerPull: "4dndcic/4dn-bedtomultivec:v1"

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
 
 resolution:
  type: int
  inputBinding:
   position: 3
  
 row_infos_file:
  type: File
  inputBinding:
   position: 4
   
 num_rows:
  type: int
  inputBinding:
   position: 5
   
 outdir:
  type: string
  inputBinding:
   position: 6
  default: "."

outputs:
 multivecfile:
  type: File
  outputBinding:
   glob: "$(inputs.outdir + '/' +  '*.multires.mv5')"

baseCommand: ["run-bedtomultivec.sh"]
