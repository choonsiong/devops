#!/usr/bin/env bash

# Infinite loop to continuously check for changes
while true; do
  # Loop through all Markdown files in the current directory
  for md_file in *.md; do
    # Set the output PDF filename by replacing .md with .pdf
    pdf_file=${md_file%.md}.pdf
    # If the Markdown file is newer than the PDF (or PDF doesn't exist)
    if [ $md_file -nt $pdf_file ]; then
      # Print the name of the Markdown file being processed
      echo $md_file
      # Convert the Markdown file to PDF using pandoc
      pandoc "$md_file" -o "$pdf_file"
    fi
  done
  # Wait for 1 second before checking again
  sleep 1
done

