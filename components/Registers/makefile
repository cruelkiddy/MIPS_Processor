test:
	iverilog Registers.v Registers_tb.v
	./a.out
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave waveform
	rm -f a.out waveform
