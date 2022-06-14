#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

params.list_file = 'list.txt'

process countLines {
  input: 
    path list_file
  script:
    file_content = file(list_file)
    all_files = file_content.readLines()
    for(each_file : all_files) {
      println "File: ${each_file} has total of ${file(each_file).countLines()} lines "
    }
    """
    """
}

workflow {
  Channel.fromPath(params.list_file) | countLines
}
