#!/usr/bin/env cwl-runner

class: CommandLineTool

cwlVersion: v1.0

requirements:
- class: DockerRequirement
  dockerPull: "4dndcic/4dn-bedtomultivec:v4"

- class: "InlineJavascriptRequirement"

inputs:
 bedfile:
  type: File
  inputBinding:
   position: 1

 chromsizes_file:
  type: File
  inputBinding:
   position: 2
 
 resolution:
  type: int
  inputBinding:
   position: 3
  
 row_infos:
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
 multivec_file:
  type: File
  outputBinding:
   glob: "$(inputs.outdir + '/' +  '*.bed.multires.mv5')"

baseCommand: ["run-bedtomultivec.sh"]
