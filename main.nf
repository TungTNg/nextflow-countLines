#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

params.list_file = 'list.txt'

process countLinesOfFile {
  input: 
    path file_path
  
  output:
    stdout

  script:
    """
    wc -l $file_path
    """
}

workflow {
  Channel.fromPath(file(params.list_file).readLines()) | countLinesOfFile | view
}
