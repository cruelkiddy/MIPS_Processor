test:
	iverilog Data_mem.v DM_tb.v
	./a.out
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave waveform
	rm -f a.out waveform
