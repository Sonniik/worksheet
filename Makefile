.PHONY: all task solution

OUT=out
PROBS=$(wildcard problems/*.tex)

all: task solution

task: $(OUT)/worksheet-task.pdf
solution: $(OUT)/worksheet-solution.pdf

$(OUT)/worksheet-task.pdf: worksheet.tex problems.tex worksheet.cls $(PROBS)
	pdflatex -jobname $(basename $@) '\documentclass[11pt]{worksheet}\input{worksheet.tex}'
	pdflatex -jobname $(basename $@) '\documentclass[11pt]{worksheet}\input{worksheet.tex}'

$(OUT)/worksheet-solution.pdf: worksheet.tex problems.tex worksheet.cls $(PROBS) fkssugar.sty
	pdflatex -jobname $(basename $@) '\documentclass[11pt,solution]{worksheet}\input{worksheet.tex}'
	pdflatex -jobname $(basename $@) '\documentclass[11pt,solution]{worksheet}\input{worksheet.tex}'

problems.tex:
	ls problems | awk '{printf "\\problem{problems/%s}\n", $$1}' > $@
