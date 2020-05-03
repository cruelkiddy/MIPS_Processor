test:
	iverilog Inst_mem.v IM_tb.v
	./a.out
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave waveform
	rm -f a.out waveform
