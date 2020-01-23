//======================================================================
//
// prince.asm
// ----------
// Implementation of the lightweight block cipher PRINCE in
// 6502 assembler.
//
//
// Copyright (c) 2020, Assured AB
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or
// without modification, are permitted provided that the following
// conditions are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

#import "mathlib.asm"

//------------------------------------------------------------------
// Include KickAssembler Basic uppstart code.
//------------------------------------------------------------------
.pc =$0801 "Basic Upstart Program"
:BasicUpstart($4000)

//------------------------------------------------------------------
// PRINCES Test
//------------------------------------------------------------------
.pc = $4000 "PRINCE Test"
                        rts

//------------------------------------------------------------------
// State registers and data fields.
//------------------------------------------------------------------
.pc = $7000 "state and variables, constants"
state:       .byte $00, $00, $00, $00, $00, $00, $00, $00

key:         .byte $00, $00, $00, $00, $00, $00, $00, $00
             .byte $00, $00, $00, $00, $00, $00, $00, $00

k0:          .byte $00, $00, $00, $00, $00, $00, $00, $00
k1:          .byte $00, $00, $00, $00, $00, $00, $00, $00
k0p:         .byte $00, $00, $00, $00, $00, $00, $00, $00

alpha:       .byte $c0, $ac, $29, $b7, $c9, $7c, $50, $dd

rc:          .byte $00, $00, $00, $00, $00, $00, $00, $00
             .byte $13, $19, $8a, $2e, $03, $70, $73, $44
             .byte $a4, $09, $38, $22, $29, $9f, $31, $d0
             .byte $08, $2e, $fa, $98, $ec, $4e, $6c, $89
             .byte $45, $28, $21, $e6, $38, $d0, $13, $77
             .byte $be, $54, $66, $cf, $34, $e9, $0c, $6c
             .byte $7e, $f8, $4f, $78, $fd, $95, $5c, $b1
             .byte $85, $84, $08, $51, $f1, $ac, $43, $aa
             .byte $c8, $82, $d3, $2f, $25, $32, $3c, $54
             .byte $64, $a5, $11, $95, $e0, $e3, $61, $0d
             .byte $d3, $b5, $a3, $99, $ca, $0c, $23, $99
             .byte $c0, $ac, $29, $b7, $c9, $7c, $50, $dd

sbox:        .byte $0b, $0f, $03, $02, $0a, $0c, $09, $01
             .byte $06, $07, $08, $00, $0e, $05, $0d, $04

//======================================================================
// EOF prince.asm
//======================================================================
