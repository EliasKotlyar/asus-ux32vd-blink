Procedure toggleled(state.b)
  
hndl = CreateFile_( "\\.\ATKACPI", #GENERIC_READ | #GENERIC_WRITE, #FILE_SHARE_READ | #FILE_SHARE_WRITE, #Null, #OPEN_EXISTING, 0, #Null)
;Debug hndl
bufferlen = 16
buffer = AllocateMemory(bufferlen)
;PokeS()
; Array: 44 45 56 53 08 00 00 00 02 00 01 00 01 00 00 00
; 01 am ende bestimmt ob LED An oder aus ist!
PokeS(buffer,"DEVS")
PokeB(buffer+4,8)
PokeB(buffer+8,2)
PokeB(buffer+10,1)
PokeB(buffer+12,state)
;For i = 0 To bufferlen-1
; Debug Hex(PeekB(buffer+i))
;Next
#outbuffersize = 1024
outbuffer=AllocateMemory(#outbuffersize)
out.l 
res = DeviceIoControl_ (hndl, 2237452,buffer, bufferlen, outbuffer, #outbuffersize, @out, #Null)	
ProcedureReturn res
EndProcedure 
#delaytimer = 100
Repeat
Delay(#delaytimer)
toggleled(1)
Delay(#delaytimer)
toggleled(0)
ForEver










; IDE Options = PureBasic 5.11 (Windows - x86)
; CursorPosition = 10
; Folding = -
; EnableXP