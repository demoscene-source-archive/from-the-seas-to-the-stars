; Music converted from music.xrns 2018-08-14 22:57:21

%define MUSIC_LENGTH 1664
%define TOTAL_SAMPLES 10354688
%define MAX_TOTAL_INSTRUMENT_SAMPLES 15794176

%define SAMPLES_PER_TICK 6013
%define TICKS_PER_SECOND 7.333333333

%define NUM_TRACKS_WITH_REVERB 15
%define NUM_TRACKS_WITHOUT_REVERB 2

%define REVERB_NUM_DELAYS   80
%define REVERB_MIN_DELAY    1024
%define REVERB_MAX_DELAY    22272
%define REVERB_ADD_DELAY    3072
%define REVERB_RANDOMSEED   65536
%define REVERB_MAX_DECAY    0.627036493
%define REVERB_DECAY_MUL    1.000020957
%define REVERB_FILTER_HIGH  0x3F800000 ; 1.000000000
%define REVERB_FILTER_LOW   0x3C800000 ; 0.015625000
%define REVERB_DAMPEN_HIGH  0x3F800000 ; 1.000000000
%define REVERB_DAMPEN_LOW   0x3C800000 ; 0.015625000
%define REVERB_VOLUME_LEFT  0x3E000000 ; 0.125000000
%define REVERB_VOLUME_RIGHT 0x3E000000 ; 0.125000000

%define USES_PANNING


	section iparam data align=4

_InstrumentParams:
.i00:
	; 00|Flute_01
	dd	32,10,65,56,0x00000000,0x3F800000,0x3F740000,0xBFD46000,0x3E780000,0x42D00000,0x42000000,0x3BE00000,0x00000000,0xB8000000,0x00000000,0x41500000,393216,0xBA000000,0x37800000,0x42C00000,0x00000000
.i01:
	; 01|Harmonica_01
	dd	25,2,13,90,0x00000000,0x3F600000,0x3F7A0000,0xBF080000,0x3E000000,0x00000000,0x42600000,0x3E000000,0xC0000000,0x3D000000,0x3AA00000,0x40200000,196608,0xB8000000,0x3C800000,0x44600000,0x00000000
.i02:
	; 02|Closed_hard_01
	dd	64,16,64,100,0x3E000000,0x3F000000,0x3F800000,0xBC000000,0x3F600000,0x42300000,0x00000000,0x3EC00000,0x00000000,0x00000000,0x00000000,0x3F000000,65536,0x00000000,0x3A06C940,0x43000000,0x3E820000
.i03:
	; 03|Basskick_01
	dd	54,32,85,84,0xBE908040,0x3E908040,0x3E380000,0x3EE60000,0x3F300000,0x41F80000,0x41980000,0x3F800000,0xBD528000,0x3BC80000,0x3B428000,0x42478000,65536,0xB8800000,0x3E800000,0x46900000,0x00000000
.i05:
	; 05|Basskick_01
	dd	50,10,57,42,0xBF26AF60,0x3F7CDFC0,0x3F800000,0xBE980000,0x3D820000,0x00000000,0x41400000,0x3F800000,0xBD9A0000,0x34000000,0x37A80000,0x42CA0000,262144,0xB8400000,0x3CC00000,0x43B00000,0x00000000
.i06:
	; 06|Flute_01
	dd	50,15,47,56,0xBE4C6A00,0x3F6B7000,0x3F760000,0xBF760000,0x3E780000,0x42D40000,0x42F00000,0x3BE10000,0xBDB80000,0xB6000000,0xBB260000,0x40F88000,262144,0xB9C80000,0x38D80000,0x44300000,0x00000000
.i07:
	; 07|Closed_hard_01
	dd	100,16,28,42,0x3E400000,0x00000000,0x00000000,0x3F800000,0x3FA00000,0xC3000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x3F800000,65536,0xBA000000,0x3B400000,0x43A00000,0xBE820000
.i08:
	; 08|Basskick_01
	dd	16,1,58,28,0x3E000000,0x3D000000,0x3F500000,0x3F800000,0x41040000,0x00000000,0x41A00000,0x00000000,0xBE200000,0x00000000,0x3BA00000,0x3F400000,65536,0xFE800000,0x3D800000,0x44F00000,0xBE820000
.i09:
	; 09|Harmonica_01
	dd	25,2,13,80,0x3E000000,0x3F5C0000,0x3F7A0000,0xBF400000,0x3DC00000,0x00000000,0x42600000,0x00000000,0xC0000000,0x00000000,0x3AC00000,0x40400000,262144,0xB8000000,0x3C800000,0x44900000,0x3E820000
.i10:
	; 0A|Harmonica_01
	dd	7,4,43,63,0xBF3E1B8C,0x3F434000,0x3F5C0000,0x3E800000,0x3E040000,0xC2E40000,0x42640000,0x3BC00000,0xBF800000,0x3D0C0000,0x36C00000,0x3F8C0000,131072,0xB8000000,0x3C800000,0x44A00000,0xBE820000
.i11:
	; 0B|Flute_01
	dd	100,10,69,98,0x00000000,0x3F800000,0x3F740000,0xBF800000,0x3E300000,0x42D00000,0x42000000,0x3BE00000,0x00000000,0xB8000000,0x00000000,0x41000000,458752,0xB8C00000,0x37C00000,0x43D00000,0x3E820000
.i12:
	; 0C|Closed_hard_01
	dd	100,16,28,42,0x3EF167A0,0x3EEB2500,0x3E000000,0x3F800000,0x3FA20000,0x42380000,0x41B00000,0x3EC80000,0xBCF80000,0x3A080000,0x37A00000,0x3F740000,327680,0xB9C00000,0x3A3C0000,0x43E00000,0x00000000
.i13:
	; 0D|Flute_01
	dd	100,10,19,63,0x00000000,0x3F800000,0x3F800000,0xBC180000,0x3C700000,0x42D30000,0x41D40000,0x00000000,0xBA830000,0xB6100000,0x3CBE0000,0x3F800000,262144,0xB8B00000,0x39400000,0x44400000,0x3E820000
.i14:
	; 0E|VST: Oidos ()
	dd	50,10,18,10,0x00000000,0x3F800000,0x37800000,0xC0800000,0x41900000,0xC3000000,0x43000000,0x3F800000,0xBF800000,0xA4000000,0xA4C00000,0x3F880000,7864320,0xB7800000,0x37800000,0x44700000,0x00000000
.i16:
	; 10|Flute_01
	dd	40,15,8,58,0x00000000,0x3F800000,0x3F740000,0xBF800000,0x3E140000,0x42D00000,0x42000000,0x3BE00000,0x00000000,0xB8000000,0x00000000,0x41500000,458752,0xB7C00000,0x37C00000,0x44400000,0xBE820000
.i04:
	; 04|Basskick_01
	dd	50,30,61,62,0xBE9B2000,0x3F168000,0x3F800000,0xBF340000,0x3D820000,0x3B18D000,0x42D80000,0x3F800000,0xBBE70000,0x33ED2000,0x3A1C8000,0x438F0000,65536,0xB8800000,0x3CC00000,0x42300000,0x00000000
.i15:
	; 0F|Flute_01
	dd	30,10,85,45,0x36BFFF9B,0x3F7AE200,0x3F7C0000,0xBF340000,0x3C980000,0x42D40000,0x42F00000,0x3BE00000,0xBF800000,0xB6000000,0xA7000000,0x40000000,196608,0xB99C0000,0x398F0000,0x45600000,0x3E820000



	section itones data align=1

_InstrumentTones:
.i00:
	; 00|Flute_01
	db	24,2,1,2,2,1,1,1,2,2,1,2,2,1,1,1,1,1,2,1,2,2,3,2,2,-123
.i01:
	; 01|Harmonica_01
	db	24,2,1,2,2,2,1,2,2,1,1,1,2,2,1,2,2,2,-124
.i02:
	; 02|Closed_hard_01
	db	29,24,-127
.i03:
	; 03|Basskick_01
	db	0,7,-128
.i05:
	; 05|Basskick_01
	db	12,2,1,2,2,1,4,-128
.i06:
	; 06|Flute_01
	db	41,2,2,1,1,1,2,1,1,1,2,2,3,2,-127
.i07:
	; 07|Closed_hard_01
	db	60,-128
.i08:
	; 08|Basskick_01
	db	40,21,-128
.i09:
	; 09|Harmonica_01
	db	43,3,1,1,2,1,1,5,2,1,2,2,-126
.i10:
	; 0A|Harmonica_01
	db	35,1,2,1,1,1,2,2,1,1,1,5,2,-127
.i11:
	; 0B|Flute_01
	db	36,3,4,1,2,2,2,1,4,2,1,1,1,2,1,1,1,2,1,2,1,1,3,2,2,-126
.i12:
	; 0C|Closed_hard_01
	db	13,5,5,1,3,7,1,1,3,3,5,24,-127
.i13:
	; 0D|Flute_01
	db	12,3,2,2,7,-128
.i14:
	; 0E|VST: Oidos ()
	db	24,12,-127
.i16:
	; 10|Flute_01
	db	24,7,1,2,2,2,1,2,2,1,1,1,1,1,2,1,1,1,2,2,2,1,2,-126
.i04:
	; 04|Basskick_01
	db	12,2,1,2,2,1,9,12,-126
.i15:
	; 0F|Flute_01
	db	50,3,2,2,2,1,2,2,-128


	section trdata data align=1

_TrackData:
.t_Track03_1:
	; Track 03, column 1
	db	0,0,127,1,127,1,127,1,127,1,127,1,127,2,127,1,24,0,56,0,127,-128
.t_Track03_2:
	; Track 03, column 2
	db	0,6,127,1,127,1,127,1,127,1,127,2,12,0,42,0,96,0,127,1,127,4,127,-128
.t_Track03_3:
	; Track 03, column 3
	db	0,9,127,1,127,1,127,1,127,2,127,1,127,2,127,2,4,0,28,0,64,-128
.t_Track03_4:
	; Track 03, column 4
	db	0,8,37,0,85,4,127,3,127,1,127,1,127,1,127,1,127,-128
.t_Track03_5:
	; Track 03, column 5
	db	0,12,28,0,64,0,96,5,64,2,64,1,64,1,64,1,64,2,64,-128
.t_Track03_6:
	; Track 03, column 6
	db	0,19,18,0,42,2,127,1,96,1,64,0,80,1,80,-128
.t_Pad_1:
	; Pad, column 1
	db	32,0,32,1,32,1,16,0,24,0,28,0,32,1,8,0,32,1,8,0,16,0,32,-128
.t_Pad_2:
	; Pad, column 2
	db	0,4,24,1,24,1,24,0,32,1,6,0,24,1,6,0,24,-128
.t_Pad_3:
	; Pad, column 3
	db	0,7,28,1,20,1,20,0,28,2,20,1,5,0,20,0,32,1,5,-128
.t_Pad_4:
	; Pad, column 4
	db	0,10,24,2,24,1,6,0,24,1,24,0,28,1,24,1,16,1,2,-128
.t_Pad_5:
	; Pad, column 5
	db	18,11,28,-128
.t_Track11_1:
	; Track 11, column 1
	db	0,0,64,1,10,0,32,-128
.t_Track11_2:
	; Track 11, column 2
	db	0,1,5,0,16,-128
.t_Track08_1:
	; Track 08, column 1
	db	0,0,2,1,1,0,2,-128
.t_Track13_1:
	; Track 13, column 1
	db	0,0,12,0,14,0,16,1,16,1,12,0,16,1,16,1,16,1,16,1,8,0,11,0,14,0,16,-128
.t_Track07_1:
	; Track 07, column 1
	db	0,0,7,2,8,2,8,2,8,1,7,1,6,1,7,1,5,0,6,2,4,1,6,-128
.t_Track07_2:
	; Track 07, column 2
	db	0,1,8,2,8,1,8,1,7,0,8,1,7,0,8,3,6,2,6,-128
.t_Track10_1:
	; Track 10, column 1
	db	0,0,5,-128
.t_Track09_1:
	; Track 09, column 1
	db	0,0,8,1,2,0,3,0,5,-128
.t_Track02_1:
	; Track 02, column 1
	db	0,0,8,1,12,1,8,0,10,1,6,0,10,1,8,1,12,1,10,2,5,0,7,0,8,0,10,1,4,0,6,0,7,0,8,0,9,0,10,1,4,0,6,0,8,0,10,0,12,1,10,0,12,-128
.t_Track02_2:
	; Track 02, column 2
	db	0,4,10,1,8,1,8,1,4,-128
.t_Track02_4:
	; Track 02, column 4
	db	32,7,4,-128
.t_Track14_1:
	; Track 14, column 1
	db	0,0,6,1,5,1,3,0,5,0,6,1,4,0,5,0,8,1,3,0,8,1,5,0,8,1,8,1,6,5,3,0,5,-128
.t_Track14_2:
	; Track 14, column 2
	db	0,2,4,0,6,4,6,0,7,0,8,1,6,1,3,1,5,0,6,0,7,1,3,0,7,1,2,0,3,-128
.t_Track04_1:
	; Track 04, column 1
	db	0,0,8,1,8,1,8,1,8,1,8,1,8,3,8,1,8,1,8,1,8,1,8,1,8,10,5,1,1,0,3,-128
.t_Track04_2:
	; Track 04, column 2
	db	0,2,8,2,8,1,8,1,8,1,8,1,8,4,8,1,8,1,8,1,8,1,8,1,8,7,2,0,4,-128
.t_Track04_3:
	; Track 04, column 3
	db	0,6,8,1,8,3,8,6,8,1,8,1,8,1,8,1,8,1,8,1,8,-128
.t_Track15_1:
	; Track 15, column 1
	db	0,1,8,5,8,2,7,2,3,1,3,-128
.t_Track15_2:
	; Track 15, column 2
	db	0,0,8,2,4,0,8,1,5,1,8,1,6,2,6,2,5,-128
.t_Track06_1:
	; Track 06, column 1
	db	32,0,8,1,8,1,8,1,8,1,7,-128
.t_Track18_1:
	; Track 18, column 1
	db	0,0,8,0,16,-128
.t_Track18_2:
	; Track 18, column 2
	db	0,1,1,0,2,-128
.t_Track05_1:
	; Track 05, column 1
	db	0,0,8,1,8,1,8,1,8,1,8,3,1,1,8,2,8,2,8,1,3,4,8,-128
.t_Track05_2:
	; Track 05, column 2
	db	0,5,8,1,8,2,4,0,8,1,8,1,2,1,8,2,8,1,8,2,8,1,8,1,4,0,8,1,8,1,7,1,7,1,6,-128
.t_Track05_3:
	; Track 05, column 3
	db	0,8,6,3,8,2,8,1,8,1,8,2,8,1,8,-128
.t_Track12_1:
	; Track 12, column 1
	db	0,0,4,0,8,0,12,0,16,0,20,0,24,0,28,0,32,0,36,0,40,0,44,0,48,0,52,0,56,0,60,0,64,0,68,0,72,0,76,0,80,0,84,0,88,0,92,0,96,0,100,0,104,0,108,0,112,0,116,0,120,0,124,0,127,1,16,0,48,0,80,0,112,0,127,1,16,0,48,0,80,0,96,0,112,0,127,1,16,0,32,0,48,0,55,0,67,0,80,0,96,0,97,0,99,0,102,0,104,0,106,0,109,0,112,0,115,0,119,0,123,0,127,1,16,0,48,0,80,0,112,0,127,1,127,-128
.t_Track12_2:
	; Track 12, column 2
	db	0,6,2,0,10,0,17,0,26,0,35,0,45,0,56,0,67,0,78,0,91,0,105,0,120,-128
.t_Track12_3:
	; Track 12, column 3
	db	0,7,2,0,10,0,18,0,28,0,40,0,51,0,65,0,80,-128
.t_Track16_1:
	; Track 16, column 1
	db	0,0,5,0,8,1,8,1,8,1,4,0,8,1,4,1,4,0,8,1,3,0,6,0,8,1,4,-128

	section notelen data align=1

_NoteLengths:
	; Track 03, column 1
L_Track03_1:
	db	64
	; Position 1, pattern 1
	db	32,32
	; Position 2, pattern 2
	db	32,32
	; Position 3, pattern 3
	db	32,32
	; Position 4, pattern 4
	db	32,32
	; Position 5, pattern 5
	db	32,32
	; Position 6, pattern 6
	db	32,32
	; Position 7, pattern 7
	db	32,32
	; Position 8, pattern 8
	db	32,32
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,32
	; Position 20, pattern 20
	db	32,32
	; Position 21, pattern 21
	db	32,32
	; Position 22, pattern 22
	db	32,32
	; Position 23, pattern 23
	db	32,32
	; Position 24, pattern 24
	db	16,12,20,12,8
	db	0

	; Track 03, column 2
L_Track03_2:
	db	65
	; Position 1, pattern 1
	db	31,32
	; Position 2, pattern 2
	db	32,32
	; Position 3, pattern 3
	db	32,32
	; Position 4, pattern 4
	db	32,32
	; Position 5, pattern 5
	db	32,32
	; Position 6, pattern 6
	db	32,32
	; Position 7, pattern 7
	db	32,32
	; Position 8, pattern 8
	db	32,32
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,32
	; Position 20, pattern 20
	db	32,32
	; Position 21, pattern 21
	db	32,32
	; Position 22, pattern 22
	db	32,32
	; Position 23, pattern 23
	db	32,32
	; Position 24, pattern 24
	db	18,12,20,12,10
	db	0

	; Track 03, column 3
L_Track03_3:
	db	66
	; Position 1, pattern 1
	db	30,64
	; Position 2, pattern 2
	db	32
	; Position 3, pattern 3
	db	32,32
	; Position 4, pattern 4
	db	32,32
	; Position 5, pattern 5
	db	32,32
	; Position 6, pattern 6
	db	32,32
	; Position 7, pattern 7
	db	32,32
	; Position 8, pattern 8
	db	32,32
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,32
	; Position 20, pattern 20
	db	32,32
	; Position 21, pattern 21
	db	32,32
	; Position 22, pattern 22
	db	32,32
	; Position 23, pattern 23
	db	32,32
	; Position 24, pattern 24
	db	20,12,20,12,12
	db	0

	; Track 03, column 4
L_Track03_4:
	db	67
	; Position 1, pattern 1
	db	61
	; Position 2, pattern 2
	db	32,32
	; Position 3, pattern 3
	db	48,48
	; Position 4, pattern 4
	db	32
	; Position 5, pattern 5
	db	64
	; Position 6, pattern 6
	db	32,32
	; Position 7, pattern 7
	db	64
	; Position 8, pattern 8
	db	32,16,16
	; Position 9, pattern 9
	db	64
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	64
	; Position 12, pattern 12
	db	32,16,16
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,16,16
	; Position 16, pattern 16
	db	64
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	64
	; Position 19, pattern 19
	db	32,16,16
	; Position 20, pattern 20
	db	32,32
	; Position 21, pattern 21
	db	32,32
	; Position 22, pattern 22
	db	32,32
	; Position 23, pattern 23
	db	32,32
	; Position 24, pattern 24
	db	12,20,12,20
	db	0

	; Track 03, column 5
L_Track03_5:
	db	68
	; Position 1, pattern 1
	db	28,32
	; Position 2, pattern 2
	db	32,32
	; Position 3, pattern 3
	db	32,32
	; Position 4, pattern 4
	db	32,32
	; Position 5, pattern 5
	db	32,32
	; Position 6, pattern 6
	db	32,32
	; Position 7, pattern 7
	db	32,32
	; Position 8, pattern 8
	db	32,32
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,32
	; Position 20, pattern 20
	db	32,32
	; Position 21, pattern 21
	db	32,32
	; Position 22, pattern 22
	db	32,32
	; Position 23, pattern 23
	db	32,32
	; Position 24, pattern 24
	db	14,20,12,20
	db	0

	; Track 03, column 6
L_Track03_6:
	db	-1,148
	; Position 2, pattern 2
	db	10,34
	; Position 3, pattern 3
	db	-5,172
	; Position 21, pattern 21
	db	18,34
	; Position 22, pattern 22
	db	32
	; Position 23, pattern 23
	db	32,32
	; Position 24, pattern 24
	db	16,20,12,20
	db	0

	; Pad, column 1
L_Pad_1:
	db	-1,192
	; Position 3, pattern 3
	db	32,96
	; Position 5, pattern 5
	db	32,32
	; Position 6, pattern 6
	db	32,32
	; Position 7, pattern 7
	db	32,32
	; Position 8, pattern 8
	db	32,32
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,32
	; Position 20, pattern 20
	db	32
	db	0

	; Pad, column 2
L_Pad_2:
	db	-1,192
	; Position 3, pattern 3
	db	32,32
	; Position 4, pattern 4
	db	68
	; Position 5, pattern 5
	db	32,32
	; Position 6, pattern 6
	db	32,32
	; Position 7, pattern 7
	db	32,32
	; Position 8, pattern 8
	db	32,32
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,28
	; Position 20, pattern 20
	db	0

	; Pad, column 3
L_Pad_3:
	db	-1,192
	; Position 3, pattern 3
	db	32,32
	; Position 4, pattern 4
	db	70
	; Position 5, pattern 5
	db	32,32
	; Position 6, pattern 6
	db	32,32
	; Position 7, pattern 7
	db	32,32
	; Position 8, pattern 8
	db	32,32
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,26
	; Position 20, pattern 20
	db	0

	; Pad, column 4
L_Pad_4:
	db	-1,192
	; Position 3, pattern 3
	db	32,32
	; Position 4, pattern 4
	db	74
	; Position 5, pattern 5
	db	32,32
	; Position 6, pattern 6
	db	32,32
	; Position 7, pattern 7
	db	32,32
	; Position 8, pattern 8
	db	32,32
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,22
	; Position 20, pattern 20
	db	0

	; Pad, column 5
L_Pad_5:
	db	-4,174
	; Position 14, pattern 14
	db	0

	; Track 11, column 1
L_Track11_1:
	db	-2,88
	; Position 5, pattern 5
	db	64
	; Position 6, pattern 6
	db	32,32
	; Position 7, pattern 7
	db	32,32
	; Position 8, pattern 8
	db	32,32
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	64
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,8
	; Position 20, pattern 20
	db	64
	; Position 21, pattern 21
	db	8,24
	db	0

	; Track 11, column 2
L_Track11_2:
	db	-6,68
	; Position 21, pattern 21
	db	8,20
	db	0

	; Track 08, column 1
L_Track08_1:
	db	-2,64
	; Position 5, pattern 5
	db	30,2,32
	; Position 6, pattern 6
	db	30,2,32
	; Position 7, pattern 7
	db	30,2,32
	; Position 8, pattern 8
	db	30,2,32
	; Position 9, pattern 9
	db	30,2,32
	; Position 10, pattern 10
	db	30,2,32
	; Position 11, pattern 11
	db	30,2,32
	; Position 12, pattern 12
	db	30,2,32
	; Position 13, pattern 13
	db	30,2,32
	; Position 14, pattern 14
	db	30,2,32
	; Position 15, pattern 15
	db	30,2,32
	; Position 16, pattern 16
	db	30,2,32
	; Position 17, pattern 17
	db	30,2,32
	; Position 18, pattern 18
	db	30,2,32
	; Position 19, pattern 19
	db	30,2,32
	; Position 20, pattern 20
	db	32,32
	; Position 21, pattern 21
	db	32
	db	0

	; Track 13, column 1
L_Track13_1:
	db	64
	; Position 1, pattern 1
	db	28,4,28,4
	; Position 2, pattern 2
	db	28,4,28,4
	; Position 3, pattern 3
	db	28,4,28,4
	; Position 4, pattern 4
	db	28,4,32
	; Position 5, pattern 5
	db	-4,192
	; Position 20, pattern 20
	db	32,32
	; Position 21, pattern 21
	db	32,32
	; Position 22, pattern 22
	db	32,32
	; Position 23, pattern 23
	db	32,32
	; Position 24, pattern 24
	db	8,8,8,8,8,8,8,24
	db	0

	; Track 07, column 1
L_Track07_1:
	db	-2,64
	; Position 5, pattern 5
	db	64
	; Position 6, pattern 6
	db	-1,192
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	24,8,16,16
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	24,8,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	24,8,16,16
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	24,8,32
	; Position 20, pattern 20
	db	32
	db	0

	; Track 07, column 2
L_Track07_2:
	db	-2,64
	; Position 5, pattern 5
	db	64
	; Position 6, pattern 6
	db	-1,192
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	32,16,16
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,16,16
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,32
	; Position 20, pattern 20
	db	32
	db	0

	; Track 10, column 1
L_Track10_1:
	db	-2,60
	; Position 4, pattern 4
	db	44
	; Position 5, pattern 5
	db	32
	; Position 6, pattern 6
	db	32,32
	; Position 7, pattern 7
	db	32,32
	; Position 8, pattern 8
	db	32,32
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,24
	; Position 20, pattern 20
	db	0

	; Track 09, column 1
L_Track09_1:
	db	-2,60
	; Position 4, pattern 4
	db	28
	; Position 5, pattern 5
	db	16,32
	; Position 6, pattern 6
	db	16,16,16,16
	; Position 7, pattern 7
	db	16,16,16,16
	; Position 8, pattern 8
	db	16,16,16,16
	; Position 9, pattern 9
	db	16,16,16,16
	; Position 10, pattern 10
	db	16,16,16,16
	; Position 11, pattern 11
	db	16,16,16,16
	; Position 12, pattern 12
	db	16,16,16,16
	; Position 13, pattern 13
	db	16,16,16,16
	; Position 14, pattern 14
	db	16,16,16,16
	; Position 15, pattern 15
	db	16,16,32
	; Position 16, pattern 16
	db	16,16,16,16
	; Position 17, pattern 17
	db	16,16,16,16
	; Position 18, pattern 18
	db	16,16,16,16
	; Position 19, pattern 19
	db	16,16,16,24
	; Position 20, pattern 20
	db	32,32
	; Position 21, pattern 21
	db	32,32
	; Position 22, pattern 22
	db	32,32
	; Position 23, pattern 23
	db	32,32
	; Position 24, pattern 24
	db	32,32
	db	0

	; Track 02, column 1
L_Track02_1:
	db	-3,78
	; Position 9, pattern 9
	db	10,8,16,16
	; Position 10, pattern 10
	db	46,2,6,1,1,8
	; Position 11, pattern 11
	db	28,4,6,6,2,18
	; Position 12, pattern 12
	db	64
	; Position 13, pattern 13
	db	32,42
	; Position 14, pattern 14
	db	22,20,4,4,20
	; Position 15, pattern 15
	db	62
	; Position 16, pattern 16
	db	18,78
	; Position 17, pattern 17
	db	2,6,1,1,8
	; Position 18, pattern 18
	db	28,4,6,6,2,18
	; Position 19, pattern 19
	db	0

	; Track 02, column 2
L_Track02_2:
	db	-4,56
	; Position 12, pattern 12
	db	4,20
	; Position 13, pattern 13
	db	112
	; Position 15, pattern 15
	db	32,-1,224
	; Position 19, pattern 19
	db	32
	db	0

	; Track 02, column 4
L_Track02_4:
	db	-4,0
	; Position 12, pattern 12
	db	0

	; Track 14, column 1
L_Track14_1:
	db	-2,80
	; Position 5, pattern 5
	db	32,32
	; Position 6, pattern 6
	db	16,48
	; Position 7, pattern 7
	db	32,40
	; Position 8, pattern 8
	db	8,48
	; Position 9, pattern 9
	db	16,16,32
	; Position 10, pattern 10
	db	8,8,48
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	8,8,16,8,8
	; Position 13, pattern 13
	db	16,32,8,8
	; Position 14, pattern 14
	db	16,32,16
	; Position 15, pattern 15
	db	16,64
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	8,8,32
	; Position 18, pattern 18
	db	16,16,16,32
	; Position 19, pattern 19
	db	8,8,32
	; Position 20, pattern 20
	db	0

	; Track 14, column 2
L_Track14_2:
	db	-2,144
	; Position 6, pattern 6
	db	16,112
	; Position 8, pattern 8
	db	16,64
	; Position 9, pattern 9
	db	16,32
	; Position 10, pattern 10
	db	16,-1,144
	; Position 12, pattern 12
	db	72
	; Position 13, pattern 13
	db	8
	; Position 14, pattern 14
	db	-1,128
	; Position 16, pattern 16
	db	4,2,4,4,10,6,1,1,48
	; Position 17, pattern 17
	db	16,32
	; Position 18, pattern 18
	db	24,104
	; Position 20, pattern 20
	db	0

	; Track 04, column 1
L_Track04_1:
	db	-2,0
	; Position 4, pattern 4
	db	16,16,32
	; Position 5, pattern 5
	db	-2,0
	; Position 9, pattern 9
	db	32,16,16
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,16,16
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,32
	; Position 20, pattern 20
	db	32,32
	; Position 21, pattern 21
	db	64
	; Position 22, pattern 22
	db	32,32
	; Position 23, pattern 23
	db	32,32
	; Position 24, pattern 24
	db	52
	db	0

	; Track 04, column 2
L_Track04_2:
	db	-2,8
	; Position 4, pattern 4
	db	16,8,-2,32
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	64
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,32
	; Position 20, pattern 20
	db	32,32
	; Position 21, pattern 21
	db	64
	; Position 22, pattern 22
	db	32,32
	; Position 23, pattern 23
	db	32,32
	; Position 24, pattern 24
	db	32
	db	0

	; Track 04, column 3
L_Track04_3:
	db	-3,80
	; Position 9, pattern 9
	db	32,60
	; Position 10, pattern 10
	db	20
	; Position 11, pattern 11
	db	-2,172
	; Position 17, pattern 17
	db	20
	; Position 18, pattern 18
	db	108
	; Position 19, pattern 19
	db	20
	; Position 20, pattern 20
	db	32,32
	; Position 21, pattern 21
	db	32,16,16
	; Position 22, pattern 22
	db	22,8,34
	; Position 23, pattern 23
	db	32,32
	; Position 24, pattern 24
	db	20
	db	0

	; Track 15, column 1
L_Track15_1:
	db	-2,32
	; Position 4, pattern 4
	db	32
	; Position 5, pattern 5
	db	-1,128
	; Position 7, pattern 7
	db	-1,128
	; Position 9, pattern 9
	db	64
	; Position 10, pattern 10
	db	64
	; Position 11, pattern 11
	db	64
	; Position 12, pattern 12
	db	64
	; Position 13, pattern 13
	db	64
	; Position 14, pattern 14
	db	64
	; Position 15, pattern 15
	db	64
	; Position 16, pattern 16
	db	64
	; Position 17, pattern 17
	db	64
	; Position 18, pattern 18
	db	64
	; Position 19, pattern 19
	db	64
	; Position 20, pattern 20
	db	24,60
	; Position 21, pattern 21
	db	52
	; Position 22, pattern 22
	db	24,52
	; Position 23, pattern 23
	db	44
	; Position 24, pattern 24
	db	0

	; Track 15, column 2
L_Track15_2:
	db	-2,40
	; Position 4, pattern 4
	db	24
	; Position 5, pattern 5
	db	80
	; Position 6, pattern 6
	db	16,116
	; Position 8, pattern 8
	db	44
	; Position 9, pattern 9
	db	-3,204
	; Position 20, pattern 20
	db	52
	; Position 21, pattern 21
	db	48,1,35
	; Position 22, pattern 22
	db	36,72
	; Position 24, pattern 24
	db	32
	db	0

	; Track 06, column 1
L_Track06_1:
	db	-3,64
	; Position 9, pattern 9
	db	32,32
	; Position 10, pattern 10
	db	32,32
	; Position 11, pattern 11
	db	32,32
	; Position 12, pattern 12
	db	32,32
	; Position 13, pattern 13
	db	32,32
	; Position 14, pattern 14
	db	32,32
	; Position 15, pattern 15
	db	32,32
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,32
	; Position 20, pattern 20
	db	0

	; Track 18, column 1
L_Track18_1:
	db	8,-2,32
	; Position 4, pattern 4
	db	24
	; Position 5, pattern 5
	db	-6,16
	; Position 24, pattern 24
	db	0

	; Track 18, column 2
L_Track18_2:
	; Position 0, pattern 0
	db	-2,48
	; Position 4, pattern 4
	db	16
	; Position 5, pattern 5
	db	-6,8
	; Position 24, pattern 24
	db	0

	; Track 05, column 1
L_Track05_1:
	db	-2,32
	; Position 4, pattern 4
	db	16,16
	; Position 5, pattern 5
	db	-3,192
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	32,32
	; Position 18, pattern 18
	db	32,32
	; Position 19, pattern 19
	db	32,32
	; Position 20, pattern 20
	db	32,32
	; Position 21, pattern 21
	db	32,32
	; Position 22, pattern 22
	db	32,32
	; Position 23, pattern 23
	db	32,32
	; Position 24, pattern 24
	db	64
	db	0

	; Track 05, column 2
L_Track05_2:
	db	-2,40
	; Position 4, pattern 4
	db	16,8
	; Position 5, pattern 5
	db	-3,192
	; Position 16, pattern 16
	db	32,32
	; Position 17, pattern 17
	db	20,8,36
	; Position 18, pattern 18
	db	12,20,32
	; Position 19, pattern 19
	db	32,32
	; Position 20, pattern 20
	db	8,24,32
	; Position 21, pattern 21
	db	32,32
	; Position 22, pattern 22
	db	32,32
	; Position 23, pattern 23
	db	32,20,12
	; Position 24, pattern 24
	db	0

	; Track 05, column 3
L_Track05_3:
	db	-5,108
	; Position 17, pattern 17
	db	20
	; Position 18, pattern 18
	db	108
	; Position 19, pattern 19
	db	20
	; Position 20, pattern 20
	db	16,16,32
	; Position 21, pattern 21
	db	32,32
	; Position 22, pattern 22
	db	32,32
	; Position 23, pattern 23
	db	20,12,12,20
	; Position 24, pattern 24
	db	32
	db	0

	; Track 12, column 1
L_Track12_1:
	db	-2,40
	; Position 4, pattern 4
	db	2,2,2,2,2,2,2,2,2,2,2,2
	; Position 5, pattern 5
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 6, pattern 6
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 7, pattern 7
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 8, pattern 8
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 9, pattern 9
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 10, pattern 10
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 11, pattern 11
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 12, pattern 12
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 13, pattern 13
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 14, pattern 14
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 15, pattern 15
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 16, pattern 16
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 17, pattern 17
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 18, pattern 18
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 19, pattern 19
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 20, pattern 20
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 21, pattern 21
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 22, pattern 22
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 23, pattern 23
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; Position 24, pattern 24
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,18
	db	0

	; Track 12, column 2
L_Track12_2:
	db	-2,40
	; Position 4, pattern 4
	db	2,2,2,2,2,2,2,2,2,2,2,-1,234
	; Position 8, pattern 8
	db	2,2,2,2,2,2,2,2,2,2,2,-1,234
	; Position 12, pattern 12
	db	2,2,2,2,2,2,2,2,2,2,2,2
	; Position 13, pattern 13
	db	-1,168
	; Position 15, pattern 15
	db	2,2,2,2,2,2,2,2,2,2,2,2
	; Position 16, pattern 16
	db	-1,232
	; Position 19, pattern 19
	db	2,2,2,2,2,2,2,2,2,2,2,2
	; Position 20, pattern 20
	db	0

	; Track 12, column 3
L_Track12_3:
	db	-2,48
	; Position 4, pattern 4
	db	2,2,2,2,2,2,2,-1,242
	; Position 8, pattern 8
	db	2,2,2,2,2,2,2,-1,242
	; Position 12, pattern 12
	db	2,2,2,2,2,2,2,2
	; Position 13, pattern 13
	db	-1,176
	; Position 15, pattern 15
	db	2,2,2,2,2,2,2,2
	; Position 16, pattern 16
	db	-1,240
	; Position 19, pattern 19
	db	2,2,2,2,2,2,2,2
	; Position 20, pattern 20
	db	0

	; Track 16, column 1
L_Track16_1:
	db	-5,47
	; Position 16, pattern 16
	db	1,4,2,4,6
	; Position 17, pattern 17
	db	24,71
	; Position 18, pattern 18
	db	1,4,2,4,4,18
	; Position 19, pattern 19
	db	16,8,6,1,1,32
	; Position 20, pattern 20
	db	0


	section notesamp data align=1

_NoteSamples:
	; Track 03, column 1
S_Track03_1:
	db	0
	; Position 1, pattern 1
	db	5,4
	; Position 2, pattern 2
	db	5,4
	; Position 3, pattern 3
	db	5,4
	; Position 4, pattern 4
	db	3,4
	; Position 5, pattern 5
	db	5,4
	; Position 6, pattern 6
	db	5,4
	; Position 7, pattern 7
	db	5,4
	; Position 8, pattern 8
	db	5,4
	; Position 9, pattern 9
	db	5,4
	; Position 10, pattern 10
	db	5,4
	; Position 11, pattern 11
	db	5,4
	; Position 12, pattern 12
	db	5,4
	; Position 13, pattern 13
	db	3,1
	; Position 14, pattern 14
	db	3,2
	; Position 15, pattern 15
	db	3,4
	; Position 16, pattern 16
	db	5,4
	; Position 17, pattern 17
	db	5,4
	; Position 18, pattern 18
	db	5,4
	; Position 19, pattern 19
	db	5,4
	; Position 20, pattern 20
	db	7,5
	; Position 21, pattern 21
	db	10,6
	; Position 22, pattern 22
	db	10,6
	; Position 23, pattern 23
	db	10,6
	; Position 24, pattern 24
	db	10,0,9,0,8,0

	; Track 03, column 2
S_Track03_2:
	db	0
	; Position 1, pattern 1
	db	4,3
	; Position 2, pattern 2
	db	4,3
	; Position 3, pattern 3
	db	4,3
	; Position 4, pattern 4
	db	2,3
	; Position 5, pattern 5
	db	4,3
	; Position 6, pattern 6
	db	4,3
	; Position 7, pattern 7
	db	4,3
	; Position 8, pattern 8
	db	4,3
	; Position 9, pattern 9
	db	4,3
	; Position 10, pattern 10
	db	4,3
	; Position 11, pattern 11
	db	4,3
	; Position 12, pattern 12
	db	4,3
	; Position 13, pattern 13
	db	2,5
	; Position 14, pattern 14
	db	2,1
	; Position 15, pattern 15
	db	2,3
	; Position 16, pattern 16
	db	4,3
	; Position 17, pattern 17
	db	4,3
	; Position 18, pattern 18
	db	4,3
	; Position 19, pattern 19
	db	4,3
	; Position 20, pattern 20
	db	9,9
	; Position 21, pattern 21
	db	9,11
	; Position 22, pattern 22
	db	9,10
	; Position 23, pattern 23
	db	9,11
	; Position 24, pattern 24
	db	8,0,7,0,6,0

	; Track 03, column 3
S_Track03_3:
	db	0
	; Position 1, pattern 1
	db	5,5
	; Position 2, pattern 2
	db	4
	; Position 3, pattern 3
	db	5,4
	; Position 4, pattern 4
	db	4,5
	; Position 5, pattern 5
	db	5,4
	; Position 6, pattern 6
	db	5,4
	; Position 7, pattern 7
	db	5,4
	; Position 8, pattern 8
	db	5,4
	; Position 9, pattern 9
	db	5,4
	; Position 10, pattern 10
	db	5,4
	; Position 11, pattern 11
	db	5,4
	; Position 12, pattern 12
	db	5,4
	; Position 13, pattern 13
	db	4,4
	; Position 14, pattern 14
	db	4,3
	; Position 15, pattern 15
	db	4,4
	; Position 16, pattern 16
	db	5,4
	; Position 17, pattern 17
	db	5,4
	; Position 18, pattern 18
	db	5,4
	; Position 19, pattern 19
	db	5,4
	; Position 20, pattern 20
	db	6,1
	; Position 21, pattern 21
	db	7,2
	; Position 22, pattern 22
	db	7,2
	; Position 23, pattern 23
	db	7,2
	; Position 24, pattern 24
	db	10,0,9,0,8,0

	; Track 03, column 4
S_Track03_4:
	db	0
	; Position 1, pattern 1
	db	5
	; Position 2, pattern 2
	db	5,7
	; Position 3, pattern 3
	db	5,7
	; Position 4, pattern 4
	db	6
	; Position 5, pattern 5
	db	5
	; Position 6, pattern 6
	db	5,7
	; Position 7, pattern 7
	db	5
	; Position 8, pattern 8
	db	5,7,6
	; Position 9, pattern 9
	db	5
	; Position 10, pattern 10
	db	5,7
	; Position 11, pattern 11
	db	5
	; Position 12, pattern 12
	db	5,7,6
	; Position 13, pattern 13
	db	7,4
	; Position 14, pattern 14
	db	7,6
	; Position 15, pattern 15
	db	7,7,6
	; Position 16, pattern 16
	db	5
	; Position 17, pattern 17
	db	5,7
	; Position 18, pattern 18
	db	5
	; Position 19, pattern 19
	db	5,7,6
	; Position 20, pattern 20
	db	8,4
	; Position 21, pattern 21
	db	8,3
	; Position 22, pattern 22
	db	8,6
	; Position 23, pattern 23
	db	8,3
	; Position 24, pattern 24
	db	0,2,0,1,0

	; Track 03, column 5
S_Track03_5:
	db	0
	; Position 1, pattern 1
	db	7,6
	; Position 2, pattern 2
	db	3,6
	; Position 3, pattern 3
	db	7,6
	; Position 4, pattern 4
	db	5,7
	; Position 5, pattern 5
	db	7,6
	; Position 6, pattern 6
	db	7,6
	; Position 7, pattern 7
	db	7,6
	; Position 8, pattern 8
	db	7,6
	; Position 9, pattern 9
	db	7,6
	; Position 10, pattern 10
	db	7,6
	; Position 11, pattern 11
	db	7,6
	; Position 12, pattern 12
	db	7,6
	; Position 13, pattern 13
	db	5,4
	; Position 14, pattern 14
	db	5,6
	; Position 15, pattern 15
	db	5,6
	; Position 16, pattern 16
	db	7,6
	; Position 17, pattern 17
	db	7,6
	; Position 18, pattern 18
	db	7,6
	; Position 19, pattern 19
	db	7,6
	; Position 20, pattern 20
	db	9,6
	; Position 21, pattern 21
	db	7,8
	; Position 22, pattern 22
	db	7,6
	; Position 23, pattern 23
	db	7,8
	; Position 24, pattern 24
	db	0,2,0,1,0

	; Track 03, column 6
S_Track03_6:
	db	0
	; Position 2, pattern 2
	db	7,5
	; Position 3, pattern 3
	db	0
	; Position 21, pattern 21
	db	5,7
	; Position 22, pattern 22
	db	6
	; Position 23, pattern 23
	db	4,3
	; Position 24, pattern 24
	db	0,2,0,1,0

	; Pad, column 1
S_Pad_1:
	db	0
	; Position 3, pattern 3
	db	9,7
	; Position 5, pattern 5
	db	11,8
	; Position 6, pattern 6
	db	11,8
	; Position 7, pattern 7
	db	11,8
	; Position 8, pattern 8
	db	11,8
	; Position 9, pattern 9
	db	11,8
	; Position 10, pattern 10
	db	11,8
	; Position 11, pattern 11
	db	11,8
	; Position 12, pattern 12
	db	11,8
	; Position 13, pattern 13
	db	4,1
	; Position 14, pattern 14
	db	5,2
	; Position 15, pattern 15
	db	6,8
	; Position 16, pattern 16
	db	11,8
	; Position 17, pattern 17
	db	11,8
	; Position 18, pattern 18
	db	11,8
	; Position 19, pattern 19
	db	11,8
	; Position 20, pattern 20
	db	3,10

	; Pad, column 2
S_Pad_2:
	db	0
	; Position 3, pattern 3
	db	7,5
	; Position 4, pattern 4
	db	0
	; Position 5, pattern 5
	db	8,6
	; Position 6, pattern 6
	db	8,6
	; Position 7, pattern 7
	db	8,6
	; Position 8, pattern 8
	db	8,6
	; Position 9, pattern 9
	db	8,6
	; Position 10, pattern 10
	db	8,6
	; Position 11, pattern 11
	db	8,6
	; Position 12, pattern 12
	db	8,6
	; Position 13, pattern 13
	db	3,1
	; Position 14, pattern 14
	db	4,2
	; Position 15, pattern 15
	db	3,6
	; Position 16, pattern 16
	db	8,6
	; Position 17, pattern 17
	db	8,6
	; Position 18, pattern 18
	db	8,6
	; Position 19, pattern 19
	db	8,6
	; Position 20, pattern 20
	db	0

	; Pad, column 3
S_Pad_3:
	db	0
	; Position 3, pattern 3
	db	6,9
	; Position 4, pattern 4
	db	0
	; Position 5, pattern 5
	db	7,5
	; Position 6, pattern 6
	db	7,5
	; Position 7, pattern 7
	db	7,5
	; Position 8, pattern 8
	db	7,5
	; Position 9, pattern 9
	db	7,5
	; Position 10, pattern 10
	db	7,5
	; Position 11, pattern 11
	db	7,5
	; Position 12, pattern 12
	db	7,5
	; Position 13, pattern 13
	db	4,1
	; Position 14, pattern 14
	db	8,2
	; Position 15, pattern 15
	db	3,5
	; Position 16, pattern 16
	db	7,5
	; Position 17, pattern 17
	db	7,5
	; Position 18, pattern 18
	db	7,5
	; Position 19, pattern 19
	db	7,5
	; Position 20, pattern 20
	db	0

	; Pad, column 4
S_Pad_4:
	db	0
	; Position 3, pattern 3
	db	3,9
	; Position 4, pattern 4
	db	0
	; Position 5, pattern 5
	db	4,2
	; Position 6, pattern 6
	db	4,7
	; Position 7, pattern 7
	db	4,2
	; Position 8, pattern 8
	db	4,7
	; Position 9, pattern 9
	db	4,2
	; Position 10, pattern 10
	db	4,7
	; Position 11, pattern 11
	db	4,2
	; Position 12, pattern 12
	db	4,7
	; Position 13, pattern 13
	db	5,5
	; Position 14, pattern 14
	db	8,1
	; Position 15, pattern 15
	db	6,7
	; Position 16, pattern 16
	db	4,2
	; Position 17, pattern 17
	db	4,7
	; Position 18, pattern 18
	db	4,2
	; Position 19, pattern 19
	db	4,7
	; Position 20, pattern 20
	db	0

	; Pad, column 5
S_Pad_5:
	db	0
	; Position 14, pattern 14
	db	1

	; Track 11, column 1
S_Track11_1:
	db	0
	; Position 5, pattern 5
	db	1
	; Position 6, pattern 6
	db	1,1
	; Position 7, pattern 7
	db	1,1
	; Position 8, pattern 8
	db	1,1
	; Position 9, pattern 9
	db	1,1
	; Position 10, pattern 10
	db	1,1
	; Position 11, pattern 11
	db	1,1
	; Position 12, pattern 12
	db	1,1
	; Position 13, pattern 13
	db	1,1
	; Position 14, pattern 14
	db	1,1
	; Position 15, pattern 15
	db	1
	; Position 16, pattern 16
	db	1,1
	; Position 17, pattern 17
	db	1,1
	; Position 18, pattern 18
	db	1,1
	; Position 19, pattern 19
	db	1,1
	; Position 20, pattern 20
	db	0
	; Position 21, pattern 21
	db	3,2,0

	; Track 11, column 2
S_Track11_2:
	db	0
	; Position 21, pattern 21
	db	2,1,0

	; Track 08, column 1
S_Track08_1:
	db	0
	; Position 5, pattern 5
	db	3,2,3
	; Position 6, pattern 6
	db	3,2,3
	; Position 7, pattern 7
	db	3,2,3
	; Position 8, pattern 8
	db	3,2,3
	; Position 9, pattern 9
	db	3,2,3
	; Position 10, pattern 10
	db	3,2,3
	; Position 11, pattern 11
	db	3,2,3
	; Position 12, pattern 12
	db	3,2,3
	; Position 13, pattern 13
	db	3,2,3
	; Position 14, pattern 14
	db	3,2,3
	; Position 15, pattern 15
	db	3,2,3
	; Position 16, pattern 16
	db	3,2,3
	; Position 17, pattern 17
	db	3,2,3
	; Position 18, pattern 18
	db	3,2,3
	; Position 19, pattern 19
	db	3,2,3
	; Position 20, pattern 20
	db	3,0
	; Position 21, pattern 21
	db	1,0

	; Track 13, column 1
S_Track13_1:
	db	0
	; Position 1, pattern 1
	db	8,0,7,0
	; Position 2, pattern 2
	db	8,0,7,0
	; Position 3, pattern 3
	db	8,4,7,0
	; Position 4, pattern 4
	db	5,0,7
	; Position 5, pattern 5
	db	0
	; Position 20, pattern 20
	db	6,8
	; Position 21, pattern 21
	db	13,9
	; Position 22, pattern 22
	db	13,9
	; Position 23, pattern 23
	db	13,9
	; Position 24, pattern 24
	db	13,3,12,3,11,2,10,1,0

	; Track 07, column 1
S_Track07_1:
	db	0
	; Position 5, pattern 5
	db	3
	; Position 6, pattern 6
	db	0
	; Position 9, pattern 9
	db	3,2
	; Position 10, pattern 10
	db	4,8,7,6
	; Position 11, pattern 11
	db	4,6
	; Position 12, pattern 12
	db	9,11,10
	; Position 13, pattern 13
	db	5,1
	; Position 14, pattern 14
	db	8,2
	; Position 15, pattern 15
	db	5,1
	; Position 16, pattern 16
	db	3,2
	; Position 17, pattern 17
	db	4,8,7,6
	; Position 18, pattern 18
	db	4,6
	; Position 19, pattern 19
	db	9,11,10
	; Position 20, pattern 20
	db	5,0

	; Track 07, column 2
S_Track07_2:
	db	0
	; Position 5, pattern 5
	db	7
	; Position 6, pattern 6
	db	0
	; Position 9, pattern 9
	db	7,5
	; Position 10, pattern 10
	db	3,9,4
	; Position 11, pattern 11
	db	3,4
	; Position 12, pattern 12
	db	3,8
	; Position 13, pattern 13
	db	1,6
	; Position 14, pattern 14
	db	2,5
	; Position 15, pattern 15
	db	1,6
	; Position 16, pattern 16
	db	7,5
	; Position 17, pattern 17
	db	3,9,4
	; Position 18, pattern 18
	db	3,4
	; Position 19, pattern 19
	db	3,8
	; Position 20, pattern 20
	db	1,0

	; Track 10, column 1
S_Track10_1:
	db	0
	; Position 4, pattern 4
	db	1
	; Position 5, pattern 5
	db	1
	; Position 6, pattern 6
	db	1,1
	; Position 7, pattern 7
	db	1,1
	; Position 8, pattern 8
	db	1,1
	; Position 9, pattern 9
	db	1,1
	; Position 10, pattern 10
	db	1,1
	; Position 11, pattern 11
	db	1,1
	; Position 12, pattern 12
	db	1,1
	; Position 13, pattern 13
	db	1,1
	; Position 14, pattern 14
	db	1,1
	; Position 15, pattern 15
	db	1,1
	; Position 16, pattern 16
	db	1,1
	; Position 17, pattern 17
	db	1,1
	; Position 18, pattern 18
	db	1,1
	; Position 19, pattern 19
	db	1,1
	; Position 20, pattern 20
	db	0

	; Track 09, column 1
S_Track09_1:
	db	0
	; Position 4, pattern 4
	db	1
	; Position 5, pattern 5
	db	3,1
	; Position 6, pattern 6
	db	1,3,1,3
	; Position 7, pattern 7
	db	1,3,1,3
	; Position 8, pattern 8
	db	1,3,1,3
	; Position 9, pattern 9
	db	1,3,1,3
	; Position 10, pattern 10
	db	1,3,1,3
	; Position 11, pattern 11
	db	1,3,1,3
	; Position 12, pattern 12
	db	1,3,1,3
	; Position 13, pattern 13
	db	1,3,1,3
	; Position 14, pattern 14
	db	1,3,1,3
	; Position 15, pattern 15
	db	1,3,1
	; Position 16, pattern 16
	db	1,3,1,3
	; Position 17, pattern 17
	db	1,3,1,3
	; Position 18, pattern 18
	db	1,3,1,3
	; Position 19, pattern 19
	db	1,3,1,3
	; Position 20, pattern 20
	db	4,4
	; Position 21, pattern 21
	db	4,4
	; Position 22, pattern 22
	db	4,4
	; Position 23, pattern 23
	db	4,4
	; Position 24, pattern 24
	db	3,2,0

	; Track 02, column 1
S_Track02_1:
	db	0
	; Position 9, pattern 9
	db	4,1,6,3
	; Position 10, pattern 10
	db	0,20,23,16,10,17
	; Position 11, pattern 11
	db	0,21,25,17,14,12
	; Position 12, pattern 12
	db	0
	; Position 13, pattern 13
	db	8,0
	; Position 14, pattern 14
	db	2,0,5,7,9
	; Position 15, pattern 15
	db	0
	; Position 16, pattern 16
	db	4,0
	; Position 17, pattern 17
	db	21,24,18,11,19
	; Position 18, pattern 18
	db	0,22,26,19,15,13
	; Position 19, pattern 19
	db	0

	; Track 02, column 2
S_Track02_2:
	db	0
	; Position 12, pattern 12
	db	1,3
	; Position 13, pattern 13
	db	0
	; Position 15, pattern 15
	db	2,0
	; Position 19, pattern 19
	db	4,0

	; Track 02, column 4
S_Track02_4:
	db	0
	; Position 12, pattern 12
	db	1

	; Track 14, column 1
S_Track14_1:
	db	0
	; Position 5, pattern 5
	db	13,13
	; Position 6, pattern 6
	db	4,12
	; Position 7, pattern 7
	db	13,13
	; Position 8, pattern 8
	db	15,12
	; Position 9, pattern 9
	db	13,2,13
	; Position 10, pattern 10
	db	4,15,12
	; Position 11, pattern 11
	db	13,13
	; Position 12, pattern 12
	db	13,3,11,5,9
	; Position 13, pattern 13
	db	6,8,12,14
	; Position 14, pattern 14
	db	7,8,12
	; Position 15, pattern 15
	db	6,8
	; Position 16, pattern 16
	db	13,13
	; Position 17, pattern 17
	db	4,16,12
	; Position 18, pattern 18
	db	1,13,10,13
	; Position 19, pattern 19
	db	13,3,11
	; Position 20, pattern 20
	db	0

	; Track 14, column 2
S_Track14_2:
	db	0
	; Position 6, pattern 6
	db	5,13
	; Position 8, pattern 8
	db	5,13
	; Position 9, pattern 9
	db	11,0
	; Position 10, pattern 10
	db	5,13
	; Position 12, pattern 12
	db	5
	; Position 13, pattern 13
	db	1
	; Position 14, pattern 14
	db	7
	; Position 16, pattern 16
	db	4,2,3,6,10,12,9,0,9
	; Position 17, pattern 17
	db	5,14
	; Position 18, pattern 18
	db	8,2
	; Position 20, pattern 20
	db	0

	; Track 04, column 1
S_Track04_1:
	db	0
	; Position 4, pattern 4
	db	14,15,13
	; Position 5, pattern 5
	db	0
	; Position 9, pattern 9
	db	12,8,11
	; Position 10, pattern 10
	db	10,8
	; Position 11, pattern 11
	db	7,11
	; Position 12, pattern 12
	db	8,8
	; Position 13, pattern 13
	db	9,11
	; Position 14, pattern 14
	db	7,8
	; Position 15, pattern 15
	db	9,8
	; Position 16, pattern 16
	db	12,8,11
	; Position 17, pattern 17
	db	10,8
	; Position 18, pattern 18
	db	7,11
	; Position 19, pattern 19
	db	8,8
	; Position 20, pattern 20
	db	5,3
	; Position 21, pattern 21
	db	1
	; Position 22, pattern 22
	db	6,4
	; Position 23, pattern 23
	db	2,2
	; Position 24, pattern 24
	db	6,0

	; Track 04, column 2
S_Track04_2:
	db	0
	; Position 4, pattern 4
	db	13,14,0
	; Position 9, pattern 9
	db	12,11
	; Position 10, pattern 10
	db	8,7
	; Position 11, pattern 11
	db	8,10
	; Position 12, pattern 12
	db	8,7
	; Position 13, pattern 13
	db	9
	; Position 14, pattern 14
	db	9,8
	; Position 15, pattern 15
	db	9,7
	; Position 16, pattern 16
	db	12,11
	; Position 17, pattern 17
	db	8,7
	; Position 18, pattern 18
	db	8,10
	; Position 19, pattern 19
	db	8,7
	; Position 20, pattern 20
	db	6,4
	; Position 21, pattern 21
	db	1
	; Position 22, pattern 22
	db	6,5
	; Position 23, pattern 23
	db	3,2
	; Position 24, pattern 24
	db	6,0

	; Track 04, column 3
S_Track04_3:
	db	0
	; Position 9, pattern 9
	db	8,0
	; Position 10, pattern 10
	db	4
	; Position 11, pattern 11
	db	0
	; Position 17, pattern 17
	db	4
	; Position 18, pattern 18
	db	0
	; Position 19, pattern 19
	db	4
	; Position 20, pattern 20
	db	1,3
	; Position 21, pattern 21
	db	10,10,9
	; Position 22, pattern 22
	db	7,6,5
	; Position 23, pattern 23
	db	3,1
	; Position 24, pattern 24
	db	2,0

	; Track 15, column 1
S_Track15_1:
	db	0
	; Position 4, pattern 4
	db	2
	; Position 5, pattern 5
	db	5
	; Position 7, pattern 7
	db	5
	; Position 9, pattern 9
	db	5
	; Position 10, pattern 10
	db	5
	; Position 11, pattern 11
	db	5
	; Position 12, pattern 12
	db	5
	; Position 13, pattern 13
	db	5
	; Position 14, pattern 14
	db	5
	; Position 15, pattern 15
	db	5
	; Position 16, pattern 16
	db	5
	; Position 17, pattern 17
	db	5
	; Position 18, pattern 18
	db	5
	; Position 19, pattern 19
	db	5
	; Position 20, pattern 20
	db	5,1
	; Position 21, pattern 21
	db	3
	; Position 22, pattern 22
	db	4,1
	; Position 23, pattern 23
	db	3
	; Position 24, pattern 24
	db	0

	; Track 15, column 2
S_Track15_2:
	db	0
	; Position 4, pattern 4
	db	2
	; Position 5, pattern 5
	db	0
	; Position 6, pattern 6
	db	7,0
	; Position 8, pattern 8
	db	4
	; Position 9, pattern 9
	db	0
	; Position 20, pattern 20
	db	6
	; Position 21, pattern 21
	db	5,8,8
	; Position 22, pattern 22
	db	6,3
	; Position 24, pattern 24
	db	1,0

	; Track 06, column 1
S_Track06_1:
	db	0
	; Position 9, pattern 9
	db	4,3
	; Position 10, pattern 10
	db	4,3
	; Position 11, pattern 11
	db	4,3
	; Position 12, pattern 12
	db	4,3
	; Position 13, pattern 13
	db	2,1
	; Position 14, pattern 14
	db	2,5
	; Position 15, pattern 15
	db	2,3
	; Position 16, pattern 16
	db	4,3
	; Position 17, pattern 17
	db	4,3
	; Position 18, pattern 18
	db	4,3
	; Position 19, pattern 19
	db	4,3
	; Position 20, pattern 20
	db	2

	; Track 18, column 1
S_Track18_1:
	db	0,2
	; Position 4, pattern 4
	db	0
	; Position 5, pattern 5
	db	1
	; Position 24, pattern 24
	db	0

	; Track 18, column 2
S_Track18_2:
	; Position 0, pattern 0
	db	2
	; Position 4, pattern 4
	db	0
	; Position 5, pattern 5
	db	1
	; Position 24, pattern 24
	db	0

	; Track 05, column 1
S_Track05_1:
	db	0
	; Position 4, pattern 4
	db	6,10
	; Position 5, pattern 5
	db	0
	; Position 16, pattern 16
	db	9,8
	; Position 17, pattern 17
	db	7,11
	; Position 18, pattern 18
	db	8,8
	; Position 19, pattern 19
	db	7,8
	; Position 20, pattern 20
	db	4,2
	; Position 21, pattern 21
	db	5,3
	; Position 22, pattern 22
	db	5,3
	; Position 23, pattern 23
	db	5,3
	; Position 24, pattern 24
	db	1,0

	; Track 05, column 2
S_Track05_2:
	db	0
	; Position 4, pattern 4
	db	6,12
	; Position 5, pattern 5
	db	0
	; Position 16, pattern 16
	db	9,11
	; Position 17, pattern 17
	db	15,17,16
	; Position 18, pattern 18
	db	14,13,11
	; Position 19, pattern 19
	db	9,10
	; Position 20, pattern 20
	db	0,3,1
	; Position 21, pattern 21
	db	7,7
	; Position 22, pattern 22
	db	4,8
	; Position 23, pattern 23
	db	4,2,5
	; Position 24, pattern 24
	db	0

	; Track 05, column 3
S_Track05_3:
	db	0
	; Position 17, pattern 17
	db	3
	; Position 18, pattern 18
	db	0
	; Position 19, pattern 19
	db	6
	; Position 20, pattern 20
	db	0,4,2
	; Position 21, pattern 21
	db	5,7
	; Position 22, pattern 22
	db	5,6
	; Position 23, pattern 23
	db	5,4,3,2
	; Position 24, pattern 24
	db	1,0

	; Track 12, column 1
S_Track12_1:
	db	0
	; Position 4, pattern 4
	db	44,45,47,48,57,56,55,54,53,52,51,50
	; Position 5, pattern 5
	db	62,64,66,66,66,66,66,66,66,66,66,66,64,66,66,63,44,49,61,61,46,57,61,61,61,61,61,61,61,61,61,61
	; Position 6, pattern 6
	db	62,64,66,66,63,65,66,66,66,66,66,66,64,66,66,63,44,49,61,61,46,57,61,61,61,61,61,61,49,61,61,61
	; Position 7, pattern 7
	db	62,64,66,66,63,65,66,66,66,66,66,66,64,66,66,63,44,49,61,61,46,57,61,61,61,61,61,61,49,61,61,61
	; Position 8, pattern 8
	db	62,64,66,66,63,65,66,66,66,66,66,66,64,66,66,63,44,49,61,61,46,57,59,58,57,56,55,54,53,52,51,50
	; Position 9, pattern 9
	db	62,64,66,66,63,65,66,66,66,66,66,66,64,66,66,63,44,49,61,61,46,57,61,61,61,61,61,61,49,61,61,61
	; Position 10, pattern 10
	db	62,64,66,66,63,65,66,66,66,66,66,66,64,66,66,63,44,49,61,61,46,57,61,61,61,61,61,61,49,61,61,61
	; Position 11, pattern 11
	db	62,64,66,66,63,65,66,66,66,66,66,66,64,66,66,63,44,49,61,61,46,57,61,61,61,61,61,61,49,61,61,61
	; Position 12, pattern 12
	db	62,64,66,66,63,65,66,66,66,66,66,66,64,66,66,63,44,49,61,61,46,57,59,58,57,56,55,54,53,52,51,50
	; Position 13, pattern 13
	db	38,40,43,43,39,42,43,43,43,43,43,43,40,43,43,39,4,20,32,32,12,28,32,32,32,32,32,32,20,32,32,32
	; Position 14, pattern 14
	db	38,40,43,43,39,42,43,43,43,43,43,43,40,43,43,39,33,35,37,37,34,36,37,37,37,37,37,37,35,37,37,37
	; Position 15, pattern 15
	db	38,40,43,43,39,42,43,43,43,43,43,43,40,43,43,39,44,49,61,61,61,60,59,58,57,56,55,54,53,52,51,50
	; Position 16, pattern 16
	db	62,64,66,66,63,65,66,66,66,66,66,66,64,66,66,63,44,49,61,61,46,57,61,61,61,61,61,61,49,61,61,61
	; Position 17, pattern 17
	db	62,64,66,66,63,65,66,66,66,66,66,66,64,66,66,63,44,49,61,61,46,57,61,61,61,61,61,61,49,61,61,61
	; Position 18, pattern 18
	db	62,64,66,66,63,65,66,66,66,66,66,66,64,66,66,63,44,49,61,61,46,57,61,61,61,61,61,61,49,61,61,61
	; Position 19, pattern 19
	db	62,64,66,66,63,65,66,66,66,66,66,66,64,66,66,63,44,49,61,61,46,57,59,58,57,56,55,54,53,52,51,50
	; Position 20, pattern 20
	db	39,41,43,43,43,43,43,43,43,43,43,43,43,43,43,43,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66
	; Position 21, pattern 21
	db	32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67
	; Position 22, pattern 22
	db	32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67
	; Position 23, pattern 23
	db	32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67
	; Position 24, pattern 24
	db	32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0

	; Track 12, column 2
S_Track12_2:
	db	0
	; Position 4, pattern 4
	db	1,2,3,4,5,6,7,8,9,10,11,12
	; Position 8, pattern 8
	db	1,2,3,4,5,6,7,8,9,10,11,12
	; Position 12, pattern 12
	db	1,2,3,4,5,6,7,8,9,10,11,12
	; Position 13, pattern 13
	db	0
	; Position 15, pattern 15
	db	1,2,3,4,5,6,7,8,9,10,11,12
	; Position 16, pattern 16
	db	0
	; Position 19, pattern 19
	db	1,2,3,4,5,6,7,8,9,10,11,12
	; Position 20, pattern 20
	db	0

	; Track 12, column 3
S_Track12_3:
	db	0
	; Position 4, pattern 4
	db	1,2,3,4,5,6,7,8
	; Position 8, pattern 8
	db	1,2,3,4,5,6,7,8
	; Position 12, pattern 12
	db	1,2,3,4,5,6,7,8
	; Position 13, pattern 13
	db	0
	; Position 15, pattern 15
	db	1,2,3,4,5,6,7,8
	; Position 16, pattern 16
	db	0
	; Position 19, pattern 19
	db	1,2,3,4,5,6,7,8
	; Position 20, pattern 20
	db	0

	; Track 16, column 1
S_Track16_1:
	db	0
	; Position 16, pattern 16
	db	4,6,4,3,4
	; Position 17, pattern 17
	db	2,0
	; Position 18, pattern 18
	db	10,13,11,8,7,5
	; Position 19, pattern 19
	db	1,4,12,9,0,9
	; Position 20, pattern 20
	db	0

