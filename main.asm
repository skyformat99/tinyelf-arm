.macro bump addr 
.word \addr+0x200000
.endm

 ehdr:                                                     @ Elf32_Ehdr
                 .byte      0x7F, 'E', 'L', 'F'             @   e_ident
                 .word      1                               @                          @ p_type
                 .word      0                               @                          @ p_offset
                 .word      0x200000                        @                          @ p_vaddr
                 .word      0x280002                        @   e_type & e_machine     @ p_paddr
                 bump       main                            @   e_version              @ p_filesz
                 bump       main                            @   e_entry                @ p_memsz
                 .word      4                               @   e_phoff                @ p_flags
main:            mov        r7, #1                          @   e_shoff                @ p_allign
                 mov        r0, #42                         @   e_flags
                 .word      0x200034                        @   e_ehsize & e_phentsize
                 .word      0x00000001                      @   e_phnum & e_shentsize
                 svc        0
