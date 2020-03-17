.PHONY: clean depend all
ROOT=/c/dev/MQL4
MQL=~/.vim/plugged/mql4-dev/bin/compile.sh

MQ4=$(wildcard *.mq4)
EX4=$(MQ4:.mq4=.ex4)
DEP=$(EX4:.ex4=.dep)

all: $(EX4)

-include $(DEP)   # include all dep files in the makefile

%.ex4: %.mq4
	@$(MQL) $<

depend: $(DEP)

%.dep: %.mq4
	@# Use C Preprocessor to generate a include file dependency. Have to send errors to null and return true as cpp does not understand #property
	@cpp $< -MT $(@:.dep=.ex4) -MM -MF $@ 2>/dev/null || true

clean:
	@rm -f $(EX4) $(DEP)
	

