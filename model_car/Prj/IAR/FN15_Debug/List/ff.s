///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:04:30
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Lib\FatFs\ff.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Lib\FatFs\ff.c -D DEBUG -D
//        ARM_MATH_CM4 -D MK60F15 -D MK60FN15 -lA
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\ -o
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4F -e
//        --char_is_signed --fpu=VFPv4_sp --dlib_config
//        E:\iar\arm\INC\c\DLib_Config_Full.h -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\App\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\App\Inc\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Board\Inc\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Chip\inc\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Chip\inc\IAR\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Chip\inc\kinetis\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Lib\CMSIS\Inc\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Lib\FatFs\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Lib\USB\ -On
//    List file    =  
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\ff.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN disk_initialize
        EXTERN disk_ioctl
        EXTERN disk_read
        EXTERN disk_status
        EXTERN disk_write
        EXTERN get_fattime

        PUBLIC clust2sect
        PUBLIC f_chmod
        PUBLIC f_close
        PUBLIC f_getfree
        PUBLIC f_gets
        PUBLIC f_lseek
        PUBLIC f_mkdir
        PUBLIC f_mount
        PUBLIC f_open
        PUBLIC f_opendir
        PUBLIC f_printf
        PUBLIC f_putc
        PUBLIC f_puts
        PUBLIC f_read
        PUBLIC f_readdir
        PUBLIC f_rename
        PUBLIC f_stat
        PUBLIC f_sync
        PUBLIC f_truncate
        PUBLIC f_unlink
        PUBLIC f_utime
        PUBLIC f_write
        PUBLIC get_fat
        PUBLIC put_fat
        
          CFI Names cfiNames0
          CFI StackFrame CFA R13 DATA
          CFI Resource R0:32, R1:32, R2:32, R3:32, R4:32, R5:32, R6:32, R7:32
          CFI Resource R8:32, R9:32, R10:32, R11:32, R12:32, R13:32, R14:32
          CFI Resource D0:64, D1:64, D2:64, D3:64, D4:64, D5:64, D6:64, D7:64
          CFI Resource D8:64, D9:64, D10:64, D11:64, D12:64, D13:64, D14:64
          CFI Resource D15:64
          CFI EndNames cfiNames0
        
          CFI Common cfiCommon0 Using cfiNames0
          CFI CodeAlign 2
          CFI DataAlign 4
          CFI ReturnAddress R14 CODE
          CFI CFA R13+0
          CFI R0 Undefined
          CFI R1 Undefined
          CFI R2 Undefined
          CFI R3 Undefined
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI R8 SameValue
          CFI R9 SameValue
          CFI R10 SameValue
          CFI R11 SameValue
          CFI R12 Undefined
          CFI R14 SameValue
          CFI D0 Undefined
          CFI D1 Undefined
          CFI D2 Undefined
          CFI D3 Undefined
          CFI D4 Undefined
          CFI D5 Undefined
          CFI D6 Undefined
          CFI D7 Undefined
          CFI D8 SameValue
          CFI D9 SameValue
          CFI D10 SameValue
          CFI D11 SameValue
          CFI D12 SameValue
          CFI D13 SameValue
          CFI D14 SameValue
          CFI D15 SameValue
          CFI EndCommon cfiCommon0
        
// E:\znc\project\K60FN\network_car\Lib\FatFs\ff.c
//    1 /*----------------------------------------------------------------------------/
//    2 /  FatFs - FAT file system module  R0.09                  (C)ChaN, 2011
//    3 /-----------------------------------------------------------------------------/
//    4 / FatFs module is a generic FAT file system module for small embedded systems.
//    5 / This is a free software that opened for education, research and commercial
//    6 / developments under license policy of following terms.
//    7 /
//    8 /  Copyright (C) 2011, ChaN, all right reserved.
//    9 /
//   10 / * The FatFs module is a free software and there is NO WARRANTY.
//   11 / * No restriction on use. You can use, modify and redistribute it for
//   12 /   personal, non-profit or commercial products UNDER YOUR RESPONSIBILITY.
//   13 / * Redistributions of source code must retain the above copyright notice.
//   14 /
//   15 /-----------------------------------------------------------------------------/
//   16 / Feb 26,'06 R0.00  Prototype.
//   17 /
//   18 / Apr 29,'06 R0.01  First stable version.
//   19 /
//   20 / Jun 01,'06 R0.02  Added FAT12 support.
//   21 /                   Removed unbuffered mode.
//   22 /                   Fixed a problem on small (<32M) partition.
//   23 / Jun 10,'06 R0.02a Added a configuration option (_FS_MINIMUM).
//   24 /
//   25 / Sep 22,'06 R0.03  Added f_rename().
//   26 /                   Changed option _FS_MINIMUM to _FS_MINIMIZE.
//   27 / Dec 11,'06 R0.03a Improved cluster scan algorithm to write files fast.
//   28 /                   Fixed f_mkdir() creates incorrect directory on FAT32.
//   29 /
//   30 / Feb 04,'07 R0.04  Supported multiple drive system.
//   31 /                   Changed some interfaces for multiple drive system.
//   32 /                   Changed f_mountdrv() to f_mount().
//   33 /                   Added f_mkfs().
//   34 / Apr 01,'07 R0.04a Supported multiple partitions on a physical drive.
//   35 /                   Added a capability of extending file size to f_lseek().
//   36 /                   Added minimization level 3.
//   37 /                   Fixed an endian sensitive code in f_mkfs().
//   38 / May 05,'07 R0.04b Added a configuration option _USE_NTFLAG.
//   39 /                   Added FSInfo support.
//   40 /                   Fixed DBCS name can result FR_INVALID_NAME.
//   41 /                   Fixed short seek (<= csize) collapses the file object.
//   42 /
//   43 / Aug 25,'07 R0.05  Changed arguments of f_read(), f_write() and f_mkfs().
//   44 /                   Fixed f_mkfs() on FAT32 creates incorrect FSInfo.
//   45 /                   Fixed f_mkdir() on FAT32 creates incorrect directory.
//   46 / Feb 03,'08 R0.05a Added f_truncate() and f_utime().
//   47 /                   Fixed off by one error at FAT sub-type determination.
//   48 /                   Fixed btr in f_read() can be mistruncated.
//   49 /                   Fixed cached sector is not flushed when create and close without write.
//   50 /
//   51 / Apr 01,'08 R0.06  Added fputc(), fputs(), fprintf() and fgets().
//   52 /                   Improved performance of f_lseek() on moving to the same or following cluster.
//   53 /
//   54 / Apr 01,'09 R0.07  Merged Tiny-FatFs as a configuration option. (_FS_TINY)
//   55 /                   Added long file name feature.
//   56 /                   Added multiple code page feature.
//   57 /                   Added re-entrancy for multitask operation.
//   58 /                   Added auto cluster size selection to f_mkfs().
//   59 /                   Added rewind option to f_readdir().
//   60 /                   Changed result code of critical errors.
//   61 /                   Renamed string functions to avoid name collision.
//   62 / Apr 14,'09 R0.07a Separated out OS dependent code on reentrant cfg.
//   63 /                   Added multiple sector size feature.
//   64 / Jun 21,'09 R0.07c Fixed f_unlink() can return FR_OK on error.
//   65 /                   Fixed wrong cache control in f_lseek().
//   66 /                   Added relative path feature.
//   67 /                   Added f_chdir() and f_chdrive().
//   68 /                   Added proper case conversion to extended char.
//   69 / Nov 03,'09 R0.07e Separated out configuration options from ff.h to ffconf.h.
//   70 /                   Fixed f_unlink() fails to remove a sub-dir on _FS_RPATH.
//   71 /                   Fixed name matching error on the 13 char boundary.
//   72 /                   Added a configuration option, _LFN_UNICODE.
//   73 /                   Changed f_readdir() to return the SFN with always upper case on non-LFN cfg.
//   74 /
//   75 / May 15,'10 R0.08  Added a memory configuration option. (_USE_LFN = 3)
//   76 /                   Added file lock feature. (_FS_SHARE)
//   77 /                   Added fast seek feature. (_USE_FASTSEEK)
//   78 /                   Changed some types on the API, XCHAR->TCHAR.
//   79 /                   Changed fname member in the FILINFO structure on Unicode cfg.
//   80 /                   String functions support UTF-8 encoding files on Unicode cfg.
//   81 / Aug 16,'10 R0.08a Added f_getcwd(). (_FS_RPATH = 2)
//   82 /                   Added sector erase feature. (_USE_ERASE)
//   83 /                   Moved file lock semaphore table from fs object to the bss.
//   84 /                   Fixed a wrong directory entry is created on non-LFN cfg when the given name contains ';'.
//   85 /                   Fixed f_mkfs() creates wrong FAT32 volume.
//   86 / Jan 15,'11 R0.08b Fast seek feature is also applied to f_read() and f_write().
//   87 /                   f_lseek() reports required table size on creating CLMP.
//   88 /                   Extended format syntax of f_printf function.
//   89 /                   Ignores duplicated directory separators in given path names.
//   90 /
//   91 / Sep 06,'11 R0.09  f_mkfs() supports multiple partition to finish the multiple partition feature.
//   92 /                   Added f_fdisk(). (_MULTI_PARTITION = 2)
//   93 /---------------------------------------------------------------------------*/
//   94 
//   95 #include "ff.h"         /* FatFs configurations and declarations */
//   96 #include "diskio.h"     /* Declarations of low level disk I/O functions */
//   97 
//   98 
//   99 /*--------------------------------------------------------------------------
//  100 
//  101    Module Private Definitions
//  102 
//  103 ---------------------------------------------------------------------------*/
//  104 
//  105 #if _FATFS != 6502  /* Revision ID */
//  106 #error Wrong include file (ff.h).
//  107 #endif
//  108 
//  109 
//  110 /* Definitions on sector size */
//  111 #if _MAX_SS != 512 && _MAX_SS != 1024 && _MAX_SS != 2048 && _MAX_SS != 4096
//  112 #error Wrong sector size.
//  113 #endif
//  114 #if _MAX_SS != 512
//  115 #define SS(fs)  ((fs)->ssize)   /* Variable sector size */
//  116 #else
//  117 #define SS(fs)  512U            /* Fixed sector size */
//  118 #endif
//  119 
//  120 
//  121 /* Reentrancy related */
//  122 #if _FS_REENTRANT
//  123 #if _USE_LFN == 1
//  124 #error Static LFN work area must not be used in re-entrant configuration.
//  125 #endif
//  126 #define ENTER_FF(fs)        { if (!lock_fs(fs)) return FR_TIMEOUT; }
//  127 #define LEAVE_FF(fs, res)   { unlock_fs(fs, res); return res; }
//  128 #else
//  129 #define ENTER_FF(fs)
//  130 #define LEAVE_FF(fs, res)   return res
//  131 #endif
//  132 
//  133 #define ABORT(fs, res)      { fp->flag |= FA__ERROR; LEAVE_FF(fs, res); }
//  134 
//  135 
//  136 /* File shareing feature */
//  137 #if _FS_SHARE
//  138 #if _FS_READONLY
//  139 #error _FS_SHARE must be 0 on read-only cfg.
//  140 #endif
//  141 typedef struct
//  142 {
//  143     FATFS *fs;              /* File ID 1, volume (NULL:blank entry) */
//  144     uint32 clu;             /* File ID 2, directory */
//  145     uint16 idx;             /* File ID 3, directory index */
//  146     uint16 ctr;             /* File open counter, 0:none, 0x01..0xFF:read open count, 0x100:write mode */
//  147 } FILESEM;
//  148 #endif
//  149 
//  150 
//  151 /* Misc definitions */
//  152 #define LD_CLUST(dir)   (((uint32)LD_WORD(dir+DIR_FstClusHI)<<16) | LD_WORD(dir+DIR_FstClusLO))
//  153 #define ST_CLUST(dir,cl) {ST_WORD(dir+DIR_FstClusLO, cl); ST_WORD(dir+DIR_FstClusHI, (uint32)cl>>16);}
//  154 
//  155 
//  156 /* DBCS code ranges and SBCS extend char conversion table */
//  157 
//  158 #if _CODE_PAGE == 932   /* Japanese Shift-JIS */
//  159 #define _DF1S   0x81    /* DBC 1st byte range 1 start */
//  160 #define _DF1E   0x9F    /* DBC 1st byte range 1 end */
//  161 #define _DF2S   0xE0    /* DBC 1st byte range 2 start */
//  162 #define _DF2E   0xFC    /* DBC 1st byte range 2 end */
//  163 #define _DS1S   0x40    /* DBC 2nd byte range 1 start */
//  164 #define _DS1E   0x7E    /* DBC 2nd byte range 1 end */
//  165 #define _DS2S   0x80    /* DBC 2nd byte range 2 start */
//  166 #define _DS2E   0xFC    /* DBC 2nd byte range 2 end */
//  167 
//  168 #elif _CODE_PAGE == 936 /* Simplified Chinese GBK */
//  169 #define _DF1S   0x81
//  170 #define _DF1E   0xFE
//  171 #define _DS1S   0x40
//  172 #define _DS1E   0x7E
//  173 #define _DS2S   0x80
//  174 #define _DS2E   0xFE
//  175 
//  176 #elif _CODE_PAGE == 949 /* Korean */
//  177 #define _DF1S   0x81
//  178 #define _DF1E   0xFE
//  179 #define _DS1S   0x41
//  180 #define _DS1E   0x5A
//  181 #define _DS2S   0x61
//  182 #define _DS2E   0x7A
//  183 #define _DS3S   0x81
//  184 #define _DS3E   0xFE
//  185 
//  186 #elif _CODE_PAGE == 950 /* Traditional Chinese Big5 */
//  187 #define _DF1S   0x81
//  188 #define _DF1E   0xFE
//  189 #define _DS1S   0x40
//  190 #define _DS1E   0x7E
//  191 #define _DS2S   0xA1
//  192 #define _DS2E   0xFE
//  193 
//  194 #elif _CODE_PAGE == 437 /* U.S. (OEM) */
//  195 #define _DF1S   0
//  196 #define _EXCVT {0x80,0x9A,0x90,0x41,0x8E,0x41,0x8F,0x80,0x45,0x45,0x45,0x49,0x49,0x49,0x8E,0x8F,0x90,0x92,0x92,0x4F,0x99,0x4F,0x55,0x55,0x59,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  197                 0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  198                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  199                 0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  200 
//  201 #elif _CODE_PAGE == 720 /* Arabic (OEM) */
//  202 #define _DF1S   0
//  203 #define _EXCVT {0x80,0x81,0x45,0x41,0x84,0x41,0x86,0x43,0x45,0x45,0x45,0x49,0x49,0x8D,0x8E,0x8F,0x90,0x92,0x92,0x93,0x94,0x95,0x49,0x49,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  204                 0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  205                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  206                 0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  207 
//  208 #elif _CODE_PAGE == 737 /* Greek (OEM) */
//  209 #define _DF1S   0
//  210 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x92,0x92,0x93,0x94,0x95,0x96,0x97,0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87, \ 
//  211                 0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0xAA,0x92,0x93,0x94,0x95,0x96,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  212                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  213                 0x97,0xEA,0xEB,0xEC,0xE4,0xED,0xEE,0xE7,0xE8,0xF1,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  214 
//  215 #elif _CODE_PAGE == 775 /* Baltic (OEM) */
//  216 #define _DF1S   0
//  217 #define _EXCVT {0x80,0x9A,0x91,0xA0,0x8E,0x95,0x8F,0x80,0xAD,0xED,0x8A,0x8A,0xA1,0x8D,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0x95,0x96,0x97,0x97,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \ 
//  218                 0xA0,0xA1,0xE0,0xA3,0xA3,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  219                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xB5,0xB6,0xB7,0xB8,0xBD,0xBE,0xC6,0xC7,0xA5,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  220                 0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE3,0xE8,0xE8,0xEA,0xEA,0xEE,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  221 
//  222 #elif _CODE_PAGE == 850 /* Multilingual Latin 1 (OEM) */
//  223 #define _DF1S   0
//  224 #define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0xDE,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x59,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \ 
//  225                 0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  226                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  227                 0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE7,0xE9,0xEA,0xEB,0xED,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  228 
//  229 #elif _CODE_PAGE == 852 /* Latin 2 (OEM) */
//  230 #define _DF1S   0
//  231 #define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xDE,0x8F,0x80,0x9D,0xD3,0x8A,0x8A,0xD7,0x8D,0x8E,0x8F,0x90,0x91,0x91,0xE2,0x99,0x95,0x95,0x97,0x97,0x99,0x9A,0x9B,0x9B,0x9D,0x9E,0x9F, \ 
//  232                 0xB5,0xD6,0xE0,0xE9,0xA4,0xA4,0xA6,0xA6,0xA8,0xA8,0xAA,0x8D,0xAC,0xB8,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBD,0xBF, \ 
//  233                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC6,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD2,0xD3,0xD2,0xD5,0xD6,0xD7,0xB7,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  234                 0xE0,0xE1,0xE2,0xE3,0xE3,0xD5,0xE6,0xE6,0xE8,0xE9,0xE8,0xEB,0xED,0xED,0xDD,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xEB,0xFC,0xFC,0xFE,0xFF}
//  235 
//  236 #elif _CODE_PAGE == 855 /* Cyrillic (OEM) */
//  237 #define _DF1S   0
//  238 #define _EXCVT {0x81,0x81,0x83,0x83,0x85,0x85,0x87,0x87,0x89,0x89,0x8B,0x8B,0x8D,0x8D,0x8F,0x8F,0x91,0x91,0x93,0x93,0x95,0x95,0x97,0x97,0x99,0x99,0x9B,0x9B,0x9D,0x9D,0x9F,0x9F, \ 
//  239                 0xA1,0xA1,0xA3,0xA3,0xA5,0xA5,0xA7,0xA7,0xA9,0xA9,0xAB,0xAB,0xAD,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB6,0xB6,0xB8,0xB8,0xB9,0xBA,0xBB,0xBC,0xBE,0xBE,0xBF, \ 
//  240                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD3,0xD3,0xD5,0xD5,0xD7,0xD7,0xDD,0xD9,0xDA,0xDB,0xDC,0xDD,0xE0,0xDF, \ 
//  241                 0xE0,0xE2,0xE2,0xE4,0xE4,0xE6,0xE6,0xE8,0xE8,0xEA,0xEA,0xEC,0xEC,0xEE,0xEE,0xEF,0xF0,0xF2,0xF2,0xF4,0xF4,0xF6,0xF6,0xF8,0xF8,0xFA,0xFA,0xFC,0xFC,0xFD,0xFE,0xFF}
//  242 
//  243 #elif _CODE_PAGE == 857 /* Turkish (OEM) */
//  244 #define _DF1S   0
//  245 #define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0x98,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x98,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9E, \ 
//  246                 0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA6,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  247                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  248                 0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xDE,0x59,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  249 
//  250 #elif _CODE_PAGE == 858 /* Multilingual Latin 1 + Euro (OEM) */
//  251 #define _DF1S   0
//  252 #define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0xDE,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x59,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \ 
//  253                 0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  254                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  255                 0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE7,0xE9,0xEA,0xEB,0xED,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  256 
//  257 #elif _CODE_PAGE == 862 /* Hebrew (OEM) */
//  258 #define _DF1S   0
//  259 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  260                 0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  261                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  262                 0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  263 
//  264 #elif _CODE_PAGE == 866 /* Russian (OEM) */
//  265 #define _DF1S   0
//  266 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  267                 0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  268                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  269                 0x90,0x91,0x92,0x93,0x9d,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F,0xF0,0xF0,0xF2,0xF2,0xF4,0xF4,0xF6,0xF6,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  270 
//  271 #elif _CODE_PAGE == 874 /* Thai (OEM, Windows) */
//  272 #define _DF1S   0
//  273 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  274                 0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  275                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  276                 0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  277 
//  278 #elif _CODE_PAGE == 1250 /* Central Europe (Windows) */
//  279 #define _DF1S   0
//  280 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x8D,0x8E,0x8F, \ 
//  281                 0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xA3,0xB4,0xB5,0xB6,0xB7,0xB8,0xA5,0xAA,0xBB,0xBC,0xBD,0xBC,0xAF, \ 
//  282                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  283                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xFF}
//  284 
//  285 #elif _CODE_PAGE == 1251 /* Cyrillic (Windows) */
//  286 #define _DF1S   0
//  287 #define _EXCVT {0x80,0x81,0x82,0x82,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x80,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x8D,0x8E,0x8F, \ 
//  288                 0xA0,0xA2,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB2,0xA5,0xB5,0xB6,0xB7,0xA8,0xB9,0xAA,0xBB,0xA3,0xBD,0xBD,0xAF, \ 
//  289                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  290                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF}
//  291 
//  292 #elif _CODE_PAGE == 1252 /* Latin 1 (Windows) */
//  293 #define _DF1S   0
//  294 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0xAd,0x9B,0x8C,0x9D,0xAE,0x9F, \ 
//  295                 0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  296                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  297                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0x9F}
//  298 
//  299 #elif _CODE_PAGE == 1253 /* Greek (Windows) */
//  300 #define _DF1S   0
//  301 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  302                 0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  303                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xA2,0xB8,0xB9,0xBA, \ 
//  304                 0xE0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xF2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xFB,0xBC,0xFD,0xBF,0xFF}
//  305 
//  306 #elif _CODE_PAGE == 1254 /* Turkish (Windows) */
//  307 #define _DF1S   0
//  308 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x9D,0x9E,0x9F, \ 
//  309                 0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  310                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  311                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0x9F}
//  312 
//  313 #elif _CODE_PAGE == 1255 /* Hebrew (Windows) */
//  314 #define _DF1S   0
//  315 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  316                 0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  317                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  318                 0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  319 
//  320 #elif _CODE_PAGE == 1256 /* Arabic (Windows) */
//  321 #define _DF1S   0
//  322 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x8C,0x9D,0x9E,0x9F, \ 
//  323                 0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  324                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  325                 0x41,0xE1,0x41,0xE3,0xE4,0xE5,0xE6,0x43,0x45,0x45,0x45,0x45,0xEC,0xED,0x49,0x49,0xF0,0xF1,0xF2,0xF3,0x4F,0xF5,0xF6,0xF7,0xF8,0x55,0xFA,0x55,0x55,0xFD,0xFE,0xFF}
//  326 
//  327 #elif _CODE_PAGE == 1257 /* Baltic (Windows) */
//  328 #define _DF1S   0
//  329 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  330                 0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xA8,0xB9,0xAA,0xBB,0xBC,0xBD,0xBE,0xAF, \ 
//  331                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  332                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xFF}
//  333 
//  334 #elif _CODE_PAGE == 1258 /* Vietnam (OEM, Windows) */
//  335 #define _DF1S   0
//  336 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0xAC,0x9D,0x9E,0x9F, \ 
//  337                 0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  338                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  339                 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xEC,0xCD,0xCE,0xCF,0xD0,0xD1,0xF2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xFE,0x9F}
//  340 
//  341 #elif _CODE_PAGE == 1   /* ASCII (for only non-LFN cfg) */
//  342 #if _USE_LFN
//  343 #error Cannot use LFN feature without valid code page.
//  344 #endif
//  345 #define _DF1S   0
//  346 
//  347 #else
//  348 #error Unknown code page
//  349 
//  350 #endif
//  351 
//  352 
//  353 /* Character code support macros */
//  354 #define IsUpper(c)  (((c)>='A')&&((c)<='Z'))
//  355 #define IsLower(c)  (((c)>='a')&&((c)<='z'))
//  356 #define IsDigit(c)  (((c)>='0')&&((c)<='9'))
//  357 
//  358 #if _DF1S       /* Code page is DBCS */
//  359 
//  360 #ifdef _DF2S    /* Two 1st byte areas */
//  361 #define IsDBCS1(c)  (((uint8)(c) >= _DF1S && (uint8)(c) <= _DF1E) || ((uint8)(c) >= _DF2S && (uint8)(c) <= _DF2E))
//  362 #else           /* One 1st byte area */
//  363 #define IsDBCS1(c)  ((uint8)(c) >= _DF1S && (uint8)(c) <= _DF1E)
//  364 #endif
//  365 
//  366 #ifdef _DS3S    /* Three 2nd byte areas */
//  367 #define IsDBCS2(c)  (((uint8)(c) >= _DS1S && (uint8)(c) <= _DS1E) || ((uint8)(c) >= _DS2S && (uint8)(c) <= _DS2E) || ((uint8)(c) >= _DS3S && (uint8)(c) <= _DS3E))
//  368 #else           /* Two 2nd byte areas */
//  369 #define IsDBCS2(c)  (((uint8)(c) >= _DS1S && (uint8)(c) <= _DS1E) || ((uint8)(c) >= _DS2S && (uint8)(c) <= _DS2E))
//  370 #endif
//  371 
//  372 #else           /* Code page is SBCS */
//  373 
//  374 #define IsDBCS1(c)  0
//  375 #define IsDBCS2(c)  0
//  376 
//  377 #endif /* _DF1S */
//  378 
//  379 
//  380 /* Name status flags */
//  381 #define NS          11      /* Index of name status byte in fn[] */
//  382 #define NS_LOSS     0x01    /* Out of 8.3 format */
//  383 #define NS_LFN      0x02    /* Force to create LFN entry */
//  384 #define NS_LAST     0x04    /* Last segment */
//  385 #define NS_BODY     0x08    /* Lower case flag (body) */
//  386 #define NS_EXT      0x10    /* Lower case flag (ext) */
//  387 #define NS_DOT      0x20    /* Dot entry */
//  388 
//  389 
//  390 /* FAT sub-type boundaries */
//  391 /* Note that the FAT spec by Microsoft says 4085 but Windows works with 4087! */
//  392 #define MIN_FAT16   4086    /* Minimum number of clusters for FAT16 */
//  393 #define MIN_FAT32   65526   /* Minimum number of clusters for FAT32 */
//  394 
//  395 
//  396 /* FatFs refers the members in the FAT structures as byte array instead of
//  397 / structure member because the structure is not binary compatible between
//  398 / different platforms */
//  399 
//  400 #define BS_jmpBoot          0   /* Jump instruction (3) */
//  401 #define BS_OEMName          3   /* OEM name (8) */
//  402 #define BPB_BytsPerSec      11  /* Sector size [byte] (2) */
//  403 #define BPB_SecPerClus      13  /* Cluster size [sector] (1) */
//  404 #define BPB_RsvdSecCnt      14  /* Size of reserved area [sector] (2) */
//  405 #define BPB_NumFATs         16  /* Number of FAT copies (1) */
//  406 #define BPB_RootEntCnt      17  /* Number of root dir entries for FAT12/16 (2) */
//  407 #define BPB_TotSec16        19  /* Volume size [sector] (2) */
//  408 #define BPB_Media           21  /* Media descriptor (1) */
//  409 #define BPB_FATSz16         22  /* FAT size [sector] (2) */
//  410 #define BPB_SecPerTrk       24  /* Track size [sector] (2) */
//  411 #define BPB_NumHeads        26  /* Number of heads (2) */
//  412 #define BPB_HiddSec         28  /* Number of special hidden sectors (4) */
//  413 #define BPB_TotSec32        32  /* Volume size [sector] (4) */
//  414 #define BS_DrvNum           36  /* Physical drive number (2) */
//  415 #define BS_BootSig          38  /* Extended boot signature (1) */
//  416 #define BS_VolID            39  /* Volume serial number (4) */
//  417 #define BS_VolLab           43  /* Volume label (8) */
//  418 #define BS_FilSysType       54  /* File system type (1) */
//  419 #define BPB_FATSz32         36  /* FAT size [sector] (4) */
//  420 #define BPB_ExtFlags        40  /* Extended flags (2) */
//  421 #define BPB_FSVer           42  /* File system version (2) */
//  422 #define BPB_RootClus        44  /* Root dir first cluster (4) */
//  423 #define BPB_FSInfo          48  /* Offset of FSInfo sector (2) */
//  424 #define BPB_BkBootSec       50  /* Offset of backup boot sectot (2) */
//  425 #define BS_DrvNum32         64  /* Physical drive number (2) */
//  426 #define BS_BootSig32        66  /* Extended boot signature (1) */
//  427 #define BS_VolID32          67  /* Volume serial number (4) */
//  428 #define BS_VolLab32         71  /* Volume label (8) */
//  429 #define BS_FilSysType32     82  /* File system type (1) */
//  430 #define FSI_LeadSig         0   /* FSI: Leading signature (4) */
//  431 #define FSI_StrucSig        484 /* FSI: Structure signature (4) */
//  432 #define FSI_Free_Count      488 /* FSI: Number of free clusters (4) */
//  433 #define FSI_Nxt_Free        492 /* FSI: Last allocated cluster (4) */
//  434 #define MBR_Table           446 /* MBR: Partition table offset (2) */
//  435 #define SZ_PTE              16  /* MBR: Size of a partition table entry */
//  436 #define BS_55AA             510 /* Boot sector signature (2) */
//  437 
//  438 #define DIR_Name            0   /* Short file name (11) */
//  439 #define DIR_Attr            11  /* Attribute (1) */
//  440 #define DIR_NTres           12  /* NT flag (1) */
//  441 #define DIR_CrtTime         14  /* Created time (2) */
//  442 #define DIR_CrtDate         16  /* Created date (2) */
//  443 #define DIR_FstClusHI       20  /* Higher 16-bit of first cluster (2) */
//  444 #define DIR_WrtTime         22  /* Modified time (2) */
//  445 #define DIR_WrtDate         24  /* Modified date (2) */
//  446 #define DIR_FstClusLO       26  /* Lower 16-bit of first cluster (2) */
//  447 #define DIR_FileSize        28  /* File size (4) */
//  448 #define LDIR_Ord            0   /* LFN entry order and LLE flag (1) */
//  449 #define LDIR_Attr           11  /* LFN attribute (1) */
//  450 #define LDIR_Type           12  /* LFN type (1) */
//  451 #define LDIR_Chksum         13  /* Sum of corresponding SFN entry */
//  452 #define LDIR_FstClusLO      26  /* Filled by zero (0) */
//  453 #define SZ_DIR              32      /* Size of a directory entry */
//  454 #define LLE                 0x40    /* Last long entry flag in LDIR_Ord */
//  455 #define DDE                 0xE5    /* Deleted directory enrty mark in DIR_Name[0] */
//  456 #define NDDE                0x05    /* Replacement of a character collides with DDE */
//  457 
//  458 
//  459 /*------------------------------------------------------------*/
//  460 /* Module private work area                                   */
//  461 /*------------------------------------------------------------*/
//  462 /* Note that uninitialized variables with static duration are
//  463 /  zeroed/nulled at start-up. If not, the compiler or start-up
//  464 /  routine is out of ANSI-C standard.
//  465 */
//  466 
//  467 #if _VOLUMES
//  468 static

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  469 FATFS *FatFs[_VOLUMES]; /* Pointer to the file system objects (logical drives) */
FatFs:
        DS8 4
//  470 #else
//  471 #error Number of volumes must not be 0.
//  472 #endif
//  473 
//  474 static

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//  475 uint16 Fsid;                /* File system mount ID */
Fsid:
        DS8 2
//  476 
//  477 #if _FS_RPATH
//  478 static
//  479 uint8 CurrVol;          /* Current drive */
//  480 #endif
//  481 
//  482 #if _FS_SHARE
//  483 static
//  484 FILESEM Files[_FS_SHARE];   /* File lock semaphores */
//  485 #endif
//  486 
//  487 #if _USE_LFN == 0           /* No LFN feature */
//  488 #define DEF_NAMEBUF         uint8 sfn[12]
//  489 #define INIT_BUF(dobj)      (dobj).fn = sfn
//  490 #define FREE_BUF()
//  491 
//  492 #elif _USE_LFN == 1         /* LFN feature with static working buffer */
//  493 static uint16 LfnBuf[_MAX_LFN+1];
//  494 #define DEF_NAMEBUF         uint8 sfn[12]
//  495 #define INIT_BUF(dobj)      { (dobj).fn = sfn; (dobj).lfn = LfnBuf; }
//  496 #define FREE_BUF()
//  497 
//  498 #elif _USE_LFN == 2         /* LFN feature with dynamic working buffer on the stack */
//  499 #define DEF_NAMEBUF         uint8 sfn[12]; uint16 lbuf[_MAX_LFN+1]
//  500 #define INIT_BUF(dobj)      { (dobj).fn = sfn; (dobj).lfn = lbuf; }
//  501 #define FREE_BUF()
//  502 
//  503 #elif _USE_LFN == 3         /* LFN feature with dynamic working buffer on the heap */
//  504 #define DEF_NAMEBUF         uint8 sfn[12]; uint16 *lfn
//  505 #define INIT_BUF(dobj)      { lfn = ff_memalloc((_MAX_LFN + 1) * 2); \ 
//  506                               if (!lfn) LEAVE_FF((dobj).fs, FR_NOT_ENOUGH_CORE); \ 
//  507                               (dobj).lfn = lfn; (dobj).fn = sfn; }
//  508 #define FREE_BUF()          ff_memfree(lfn)
//  509 
//  510 #else
//  511 #error Wrong LFN configuration.
//  512 #endif
//  513 
//  514 
//  515 
//  516 
//  517 /*--------------------------------------------------------------------------
//  518 
//  519    Module Private Functions
//  520 
//  521 ---------------------------------------------------------------------------*/
//  522 
//  523 
//  524 /*-----------------------------------------------------------------------*/
//  525 /* String functions                                                      */
//  526 /*-----------------------------------------------------------------------*/
//  527 
//  528 /* Copy memory to memory */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function mem_cpy
          CFI NoCalls
        THUMB
//  529 static
//  530 void mem_cpy (void *dst, const void *src, uint32 cnt)
//  531 {
mem_cpy:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  532     uint8 *d = (uint8 *)dst;
        MOVS     R3,R0
//  533     const uint8 *s = (const uint8 *)src;
        MOVS     R4,R1
//  534 
//  535 #if _WORD_ACCESS == 1
//  536     while (cnt >= sizeof(int))
//  537     {
//  538         *(int *)d = *(int *)s;
//  539         d += sizeof(int);
//  540         s += sizeof(int);
//  541         cnt -= sizeof(int);
//  542     }
//  543 #endif
//  544     while (cnt--)
??mem_cpy_0:
        MOVS     R5,R2
        SUBS     R2,R5,#+1
        CMP      R5,#+0
        BEQ.N    ??mem_cpy_1
//  545         *d++ = *s++;
        LDRB     R5,[R4, #+0]
        STRB     R5,[R3, #+0]
        ADDS     R4,R4,#+1
        ADDS     R3,R3,#+1
        B.N      ??mem_cpy_0
//  546 }
??mem_cpy_1:
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  547 
//  548 /* Fill memory */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function mem_set
          CFI NoCalls
        THUMB
//  549 static
//  550 void mem_set (void *dst, int val, uint32 cnt)
//  551 {
mem_set:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  552     uint8 *d = (uint8 *)dst;
        MOVS     R3,R0
//  553 
//  554     while (cnt--)
??mem_set_0:
        MOVS     R4,R2
        SUBS     R2,R4,#+1
        CMP      R4,#+0
        BEQ.N    ??mem_set_1
//  555         *d++ = (uint8)val;
        STRB     R1,[R3, #+0]
        ADDS     R3,R3,#+1
        B.N      ??mem_set_0
//  556 }
??mem_set_1:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  557 
//  558 /* Compare memory to memory */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function mem_cmp
          CFI NoCalls
        THUMB
//  559 static
//  560 int mem_cmp (const void *dst, const void *src, uint32 cnt)
//  561 {
mem_cmp:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        MOVS     R3,R0
//  562     const uint8 *d = (const uint8 *)dst, *s = (const uint8 *)src;
        MOVS     R4,R3
        MOVS     R5,R1
//  563     int r = 0;
        MOVS     R0,#+0
//  564 
//  565     while (cnt-- && (r = *d++ - *s++) == 0) ;
??mem_cmp_0:
        MOVS     R6,R2
        SUBS     R2,R6,#+1
        CMP      R6,#+0
        BEQ.N    ??mem_cmp_1
        LDRB     R0,[R4, #+0]
        LDRB     R6,[R5, #+0]
        SUBS     R0,R0,R6
        ADDS     R5,R5,#+1
        ADDS     R4,R4,#+1
        CMP      R0,#+0
        BEQ.N    ??mem_cmp_0
//  566     return r;
??mem_cmp_1:
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  567 }
//  568 
//  569 /* Check if chr is contained in the string */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function chk_chr
          CFI NoCalls
        THUMB
//  570 static
//  571 int chk_chr (const char *str, int chr)
//  572 {
//  573     while (*str && *str != chr) str++;
chk_chr:
??chk_chr_0:
        LDRSB    R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??chk_chr_1
        LDRSB    R2,[R0, #+0]
        CMP      R2,R1
        BEQ.N    ??chk_chr_1
        ADDS     R0,R0,#+1
        B.N      ??chk_chr_0
//  574     return *str;
??chk_chr_1:
        LDRSB    R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  575 }
//  576 
//  577 
//  578 
//  579 /*-----------------------------------------------------------------------*/
//  580 /* Request/Release grant to access the volume                            */
//  581 /*-----------------------------------------------------------------------*/
//  582 #if _FS_REENTRANT
//  583 
//  584 static
//  585 int lock_fs (
//  586     FATFS *fs       /* File system object */
//  587 )
//  588 {
//  589     return ff_req_grant(fs->sobj);
//  590 }
//  591 
//  592 
//  593 static
//  594 void unlock_fs (
//  595     FATFS *fs,      /* File system object */
//  596     FRESULT res     /* Result code to be returned */
//  597 )
//  598 {
//  599     if (res != FR_NOT_ENABLED &&
//  600             res != FR_INVALID_DRIVE &&
//  601             res != FR_INVALID_OBJECT &&
//  602             res != FR_TIMEOUT)
//  603     {
//  604         ff_rel_grant(fs->sobj);
//  605     }
//  606 }
//  607 #endif
//  608 
//  609 
//  610 
//  611 /*-----------------------------------------------------------------------*/
//  612 /* File shareing control functions                                       */
//  613 /*-----------------------------------------------------------------------*/
//  614 #if _FS_SHARE
//  615 
//  616 static
//  617 FRESULT chk_lock (  /* Check if the file can be accessed */
//  618     DIR *dj,        /* Directory object pointing the file to be checked */
//  619     int acc         /* Desired access (0:Read, 1:Write, 2:Delete/Rename) */
//  620 )
//  621 {
//  622     uint32 i, be;
//  623 
//  624     /* Search file semaphore table */
//  625     for (i = be = 0; i < _FS_SHARE; i++)
//  626     {
//  627         if (Files[i].fs)    /* Existing entry */
//  628         {
//  629             if (Files[i].fs == dj->fs &&        /* Check if the file matched with an open file */
//  630                     Files[i].clu == dj->sclust &&
//  631                     Files[i].idx == dj->index) break;
//  632         }
//  633         else            /* Blank entry */
//  634         {
//  635             be++;
//  636         }
//  637     }
//  638     if (i == _FS_SHARE) /* The file is not opened */
//  639         return (be || acc == 2) ? FR_OK : FR_TOO_MANY_OPEN_FILES;   /* Is there a blank entry for new file? */
//  640 
//  641     /* The file has been opened. Reject any open against writing file and all write mode open */
//  642     return (acc || Files[i].ctr == 0x100) ? FR_LOCKED : FR_OK;
//  643 }
//  644 
//  645 
//  646 static
//  647 int enq_lock (void) /* Check if an entry is available for a new file */
//  648 {
//  649     uint32 i;
//  650 
//  651     for (i = 0; i < _FS_SHARE && Files[i].fs; i++) ;
//  652     return (i == _FS_SHARE) ? 0 : 1;
//  653 }
//  654 
//  655 
//  656 static
//  657 uint32 inc_lock (   /* Increment file open counter and returns its index (0:int error) */
//  658     DIR *dj,    /* Directory object pointing the file to register or increment */
//  659     int acc     /* Desired access mode (0:Read, !0:Write) */
//  660 )
//  661 {
//  662     uint32 i;
//  663 
//  664 
//  665     for (i = 0; i < _FS_SHARE; i++)     /* Find the file */
//  666     {
//  667         if (Files[i].fs == dj->fs &&
//  668                 Files[i].clu == dj->sclust &&
//  669                 Files[i].idx == dj->index) break;
//  670     }
//  671 
//  672     if (i == _FS_SHARE)                 /* Not opened. Register it as new. */
//  673     {
//  674         for (i = 0; i < _FS_SHARE && Files[i].fs; i++) ;
//  675         if (i == _FS_SHARE) return 0;   /* No space to register (int err) */
//  676         Files[i].fs = dj->fs;
//  677         Files[i].clu = dj->sclust;
//  678         Files[i].idx = dj->index;
//  679         Files[i].ctr = 0;
//  680     }
//  681 
//  682     if (acc && Files[i].ctr) return 0;  /* Access violation (int err) */
//  683 
//  684     Files[i].ctr = acc ? 0x100 : Files[i].ctr + 1;  /* Set semaphore value */
//  685 
//  686     return i + 1;
//  687 }
//  688 
//  689 
//  690 static
//  691 FRESULT dec_lock (  /* Decrement file open counter */
//  692     uint32 i            /* Semaphore index */
//  693 )
//  694 {
//  695     uint16 n;
//  696     FRESULT res;
//  697 
//  698 
//  699     if (--i < _FS_SHARE)
//  700     {
//  701         n = Files[i].ctr;
//  702         if (n == 0x100) n = 0;
//  703         if (n) n--;
//  704         Files[i].ctr = n;
//  705         if (!n) Files[i].fs = 0;
//  706         res = FR_OK;
//  707     }
//  708     else
//  709     {
//  710         res = FR_INT_ERR;
//  711     }
//  712     return res;
//  713 }
//  714 
//  715 
//  716 static
//  717 void clear_lock (   /* Clear lock entries of the volume */
//  718     FATFS *fs
//  719 )
//  720 {
//  721     uint32 i;
//  722 
//  723     for (i = 0; i < _FS_SHARE; i++)
//  724     {
//  725         if (Files[i].fs == fs) Files[i].fs = 0;
//  726     }
//  727 }
//  728 #endif
//  729 
//  730 
//  731 
//  732 /*-----------------------------------------------------------------------*/
//  733 /* Change window offset                                                  */
//  734 /*-----------------------------------------------------------------------*/
//  735 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function move_window
        THUMB
//  736 static
//  737 FRESULT move_window (
//  738     FATFS *fs,      /* File system object */
//  739     uint32 sector   /* Sector number to make appearance in the fs->win[] */
//  740 )                   /* Move to zero only writes back dirty window */
//  741 {
move_window:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  742     uint32 wsect;
//  743 
//  744 
//  745     wsect = fs->winsect;
        LDR      R0,[R4, #+44]
        MOVS     R6,R0
//  746     if (wsect != sector)    /* Changed current window */
        CMP      R6,R5
        BEQ.N    ??move_window_0
//  747     {
//  748 #if !_FS_READONLY
//  749         if (fs->wflag)      /* Write back dirty window if needed */
        LDRB     R0,[R4, #+4]
        CMP      R0,#+0
        BEQ.N    ??move_window_1
//  750         {
//  751             if (disk_write(fs->drv, fs->win, wsect, 1) != RES_OK)
        MOVS     R3,#+1
        MOVS     R2,R6
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??move_window_2
//  752                 return FR_DISK_ERR;
        MOVS     R0,#+1
        B.N      ??move_window_3
//  753             fs->wflag = 0;
??move_window_2:
        MOVS     R0,#+0
        STRB     R0,[R4, #+4]
//  754             if (wsect < (fs->fatbase + fs->fsize))      /* In FAT area */
        LDR      R0,[R4, #+32]
        LDR      R1,[R4, #+28]
        ADDS     R0,R1,R0
        CMP      R6,R0
        BCS.N    ??move_window_1
//  755             {
//  756                 uint8 nf;
//  757                 for (nf = fs->n_fats; nf > 1; nf--)     /* Reflect the change to all FAT copies */
        LDRB     R0,[R4, #+3]
        MOVS     R7,R0
??move_window_4:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+2
        BLT.N    ??move_window_1
//  758                 {
//  759                     wsect += fs->fsize;
        LDR      R0,[R4, #+28]
        ADDS     R6,R0,R6
//  760                     disk_write(fs->drv, fs->win, wsect, 1);
        MOVS     R3,#+1
        MOVS     R2,R6
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_write
        BL       disk_write
//  761                 }
        SUBS     R7,R7,#+1
        B.N      ??move_window_4
//  762             }
//  763         }
//  764 #endif
//  765         if (sector)
??move_window_1:
        CMP      R5,#+0
        BEQ.N    ??move_window_0
//  766         {
//  767             if (disk_read(fs->drv, fs->win, sector, 1) != RES_OK)
        MOVS     R3,#+1
        MOVS     R2,R5
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??move_window_5
//  768                 return FR_DISK_ERR;
        MOVS     R0,#+1
        B.N      ??move_window_3
//  769             fs->winsect = sector;
??move_window_5:
        STR      R5,[R4, #+44]
//  770         }
//  771     }
//  772 
//  773     return FR_OK;
??move_window_0:
        MOVS     R0,#+0
??move_window_3:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock4
//  774 }
//  775 
//  776 
//  777 
//  778 
//  779 /*-----------------------------------------------------------------------*/
//  780 /* Clean-up cached data                                                  */
//  781 /*-----------------------------------------------------------------------*/
//  782 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function sync
        THUMB
//  783 static
//  784 FRESULT sync (  /* FR_OK: successful, FR_DISK_ERR: failed */
//  785     FATFS *fs   /* File system object */
//  786 )
//  787 {
sync:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  788     FRESULT res;
//  789 
//  790 
//  791     res = move_window(fs, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
//  792     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??sync_0
//  793     {
//  794         /* Update FSInfo sector if needed */
//  795         if (fs->fs_type == FS_FAT32 && fs->fsi_flag)
        LDRB     R0,[R4, #+0]
        CMP      R0,#+3
        BNE.N    ??sync_1
        LDRB     R0,[R4, #+5]
        CMP      R0,#+0
        BEQ.N    ??sync_1
//  796         {
//  797             fs->winsect = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+44]
//  798             /* Create FSInfo structure */
//  799             mem_set(fs->win, 0, 512);
        MOV      R2,#+512
        MOVS     R1,#+0
        ADDS     R0,R4,#+48
          CFI FunCall mem_set
        BL       mem_set
//  800             ST_WORD(fs->win + BS_55AA, 0xAA55);
        MOVS     R0,#+85
        STRB     R0,[R4, #+558]
        MOVS     R0,#+170
        STRB     R0,[R4, #+559]
//  801             ST_DWORD(fs->win + FSI_LeadSig, 0x41615252);
        MOVS     R0,#+82
        STRB     R0,[R4, #+48]
        MOVS     R0,#+82
        STRB     R0,[R4, #+49]
        MOVS     R0,#+97
        STRB     R0,[R4, #+50]
        MOVS     R0,#+65
        STRB     R0,[R4, #+51]
//  802             ST_DWORD(fs->win + FSI_StrucSig, 0x61417272);
        MOVS     R0,#+114
        STRB     R0,[R4, #+532]
        MOVS     R0,#+114
        STRB     R0,[R4, #+533]
        MOVS     R0,#+65
        STRB     R0,[R4, #+534]
        MOVS     R0,#+97
        STRB     R0,[R4, #+535]
//  803             ST_DWORD(fs->win + FSI_Free_Count, fs->free_clust);
        LDR      R0,[R4, #+16]
        STRB     R0,[R4, #+536]
        LDR      R0,[R4, #+16]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R4, #+537]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+16
        STRB     R0,[R4, #+538]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+24
        STRB     R0,[R4, #+539]
//  804             ST_DWORD(fs->win + FSI_Nxt_Free, fs->last_clust);
        LDR      R0,[R4, #+12]
        STRB     R0,[R4, #+540]
        LDR      R0,[R4, #+12]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R4, #+541]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+16
        STRB     R0,[R4, #+542]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+24
        STRB     R0,[R4, #+543]
//  805             /* Write it into the FSInfo sector */
//  806             disk_write(fs->drv, fs->win, fs->fsi_sector, 1);
        MOVS     R3,#+1
        LDR      R2,[R4, #+20]
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_write
        BL       disk_write
//  807             fs->fsi_flag = 0;
        MOVS     R0,#+0
        STRB     R0,[R4, #+5]
//  808         }
//  809         /* Make sure that no pending write process in the physical drive */
//  810         if (disk_ioctl(fs->drv, CTRL_SYNC, 0) != RES_OK)
??sync_1:
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_ioctl
        BL       disk_ioctl
        CMP      R0,#+0
        BEQ.N    ??sync_0
//  811             res = FR_DISK_ERR;
        MOVS     R0,#+1
        MOVS     R5,R0
//  812     }
//  813 
//  814     return res;
??sync_0:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock5
//  815 }
//  816 #endif
//  817 
//  818 
//  819 
//  820 
//  821 /*-----------------------------------------------------------------------*/
//  822 /* Get sector# from cluster#                                             */
//  823 /*-----------------------------------------------------------------------*/
//  824 
//  825 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function clust2sect
          CFI NoCalls
        THUMB
//  826 uint32 clust2sect ( /* !=0: Sector number, 0: Failed - invalid cluster# */
//  827     FATFS *fs,      /* File system object */
//  828     uint32 clst     /* Cluster# to be converted */
//  829 )
//  830 {
clust2sect:
        MOVS     R2,R0
//  831     clst -= 2;
        SUBS     R1,R1,#+2
//  832     if (clst >= (fs->n_fatent - 2)) return 0;       /* Invalid cluster# */
        LDR      R0,[R2, #+24]
        SUBS     R0,R0,#+2
        CMP      R1,R0
        BCC.N    ??clust2sect_0
        MOVS     R0,#+0
        B.N      ??clust2sect_1
//  833     return clst * fs->csize + fs->database;
??clust2sect_0:
        LDRB     R0,[R2, #+2]
        LDR      R2,[R2, #+40]
        MLA      R0,R0,R1,R2
??clust2sect_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  834 }
//  835 
//  836 
//  837 
//  838 
//  839 /*-----------------------------------------------------------------------*/
//  840 /* FAT access - Read value of a FAT entry                                */
//  841 /*-----------------------------------------------------------------------*/
//  842 
//  843 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function get_fat
        THUMB
//  844 uint32 get_fat (    /* 0xFFFFFFFF:Disk error, 1:Internal error, Else:Cluster status */
//  845     FATFS *fs,  /* File system object */
//  846     uint32 clst /* Cluster# to get the link information */
//  847 )
//  848 {
get_fat:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  849     uint32 wc, bc;
//  850     uint8 *p;
//  851 
//  852 
//  853     if (clst < 2 || clst >= fs->n_fatent)   /* Chack range */
        CMP      R5,#+2
        BCC.N    ??get_fat_0
        LDR      R0,[R4, #+24]
        CMP      R5,R0
        BCC.N    ??get_fat_1
//  854         return 1;
??get_fat_0:
        MOVS     R0,#+1
        B.N      ??get_fat_2
//  855 
//  856     switch (fs->fs_type)
??get_fat_1:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+1
        BEQ.N    ??get_fat_3
        BCC.N    ??get_fat_4
        CMP      R0,#+3
        BEQ.N    ??get_fat_5
        BCC.N    ??get_fat_6
        B.N      ??get_fat_4
//  857     {
//  858     case FS_FAT12 :
//  859         bc = (uint32)clst;
??get_fat_3:
        MOV      R8,R5
//  860         bc += bc / 2;
        ADDS     R8,R8,R8, LSR #+1
//  861         if (move_window(fs, fs->fatbase + (bc / SS(fs)))) break;
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R8, LSR #+9
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_4
//  862         wc = fs->win[bc % SS(fs)];
??get_fat_7:
        MOV      R0,#+512
        UDIV     R1,R8,R0
        MLS      R1,R1,R0,R8
        ADDS     R0,R1,R4
        LDRB     R0,[R0, #+48]
        MOVS     R6,R0
//  863         bc++;
        ADDS     R8,R8,#+1
//  864         if (move_window(fs, fs->fatbase + (bc / SS(fs)))) break;
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R8, LSR #+9
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_4
//  865         wc |= fs->win[bc % SS(fs)] << 8;
??get_fat_8:
        MOV      R0,#+512
        UDIV     R1,R8,R0
        MLS      R1,R1,R0,R8
        ADDS     R0,R1,R4
        LDRB     R0,[R0, #+48]
        ORRS     R6,R6,R0, LSL #+8
//  866         return (clst & 1) ? (wc >> 4) : (wc & 0xFFF);
        LSLS     R0,R5,#+31
        BPL.N    ??get_fat_9
        LSRS     R0,R6,#+4
        B.N      ??get_fat_10
??get_fat_9:
        LSLS     R0,R6,#+20       ;; ZeroExtS R0,R6,#+20,#+20
        LSRS     R0,R0,#+20
??get_fat_10:
        B.N      ??get_fat_2
//  867 
//  868     case FS_FAT16 :
//  869         if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 2)))) break;
??get_fat_6:
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R5, LSR #+8
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_4
//  870         p = &fs->win[clst * 2 % SS(fs)];
??get_fat_11:
        LSLS     R0,R5,#+1
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADDS     R0,R2,R4
        ADDS     R0,R0,#+48
        MOVS     R7,R0
//  871         return LD_WORD(p);
        LDRB     R0,[R7, #+1]
        LDRB     R1,[R7, #+0]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        B.N      ??get_fat_2
//  872 
//  873     case FS_FAT32 :
//  874         if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 4)))) break;
??get_fat_5:
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R5, LSR #+7
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_4
//  875         p = &fs->win[clst * 4 % SS(fs)];
??get_fat_12:
        LSLS     R0,R5,#+2
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADDS     R0,R2,R4
        ADDS     R0,R0,#+48
        MOVS     R7,R0
//  876         return LD_DWORD(p) & 0x0FFFFFFF;
        LDRB     R0,[R7, #+3]
        LDRB     R1,[R7, #+2]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R7, #+1]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R7, #+0]
        ORRS     R0,R1,R0
        LSLS     R0,R0,#+4        ;; ZeroExtS R0,R0,#+4,#+4
        LSRS     R0,R0,#+4
        B.N      ??get_fat_2
//  877     }
//  878 
//  879     return 0xFFFFFFFF;  /* An error occurred at the disk I/O layer */
??get_fat_4:
        MOVS     R0,#-1
??get_fat_2:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock7
//  880 }
//  881 
//  882 
//  883 
//  884 
//  885 /*-----------------------------------------------------------------------*/
//  886 /* FAT access - Change value of a FAT entry                              */
//  887 /*-----------------------------------------------------------------------*/
//  888 #if !_FS_READONLY
//  889 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function put_fat
        THUMB
//  890 FRESULT put_fat (
//  891     FATFS *fs,  /* File system object */
//  892     uint32 clst,    /* Cluster# to be changed in range of 2 to fs->n_fatent - 1 */
//  893     uint32 val  /* New value to mark the cluster */
//  894 )
//  895 {
put_fat:
        PUSH     {R3-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  896     uint32 bc;
//  897     uint8 *p;
//  898     FRESULT res;
//  899 
//  900 
//  901     if (clst < 2 || clst >= fs->n_fatent)   /* Check range */
        CMP      R5,#+2
        BCC.N    ??put_fat_0
        LDR      R0,[R4, #+24]
        CMP      R5,R0
        BCC.N    ??put_fat_1
//  902     {
//  903         res = FR_INT_ERR;
??put_fat_0:
        MOVS     R0,#+2
        MOV      R9,R0
        B.N      ??put_fat_2
//  904 
//  905     }
//  906     else
//  907     {
//  908         switch (fs->fs_type)
??put_fat_1:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+1
        BEQ.N    ??put_fat_3
        BCC.W    ??put_fat_4
        CMP      R0,#+3
        BEQ.N    ??put_fat_5
        BCC.N    ??put_fat_6
        B.N      ??put_fat_4
//  909         {
//  910         case FS_FAT12 :
//  911             bc = clst;
??put_fat_3:
        MOVS     R7,R5
//  912             bc += bc / 2;
        ADDS     R7,R7,R7, LSR #+1
//  913             res = move_window(fs, fs->fatbase + (bc / SS(fs)));
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R7, LSR #+9
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        MOV      R9,R0
//  914             if (res != FR_OK) break;
        SXTB     R9,R9            ;; SignExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BNE.W    ??put_fat_7
//  915             p = &fs->win[bc % SS(fs)];
??put_fat_8:
        MOV      R0,#+512
        UDIV     R1,R7,R0
        MLS      R1,R1,R0,R7
        ADDS     R0,R1,R4
        ADDS     R0,R0,#+48
        MOV      R8,R0
//  916             *p = (clst & 1) ? ((*p & 0x0F) | ((uint8)val << 4)) : (uint8)val;
        LSLS     R0,R5,#+31
        BPL.N    ??put_fat_9
        LDRB     R0,[R8, #+0]
        ANDS     R0,R0,#0xF
        ORRS     R0,R0,R6, LSL #+4
        B.N      ??put_fat_10
??put_fat_9:
        MOVS     R0,R6
??put_fat_10:
        STRB     R0,[R8, #+0]
//  917             bc++;
        ADDS     R7,R7,#+1
//  918             fs->wflag = 1;
        MOVS     R0,#+1
        STRB     R0,[R4, #+4]
//  919             res = move_window(fs, fs->fatbase + (bc / SS(fs)));
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R7, LSR #+9
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        MOV      R9,R0
//  920             if (res != FR_OK) break;
        SXTB     R9,R9            ;; SignExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BNE.N    ??put_fat_7
//  921             p = &fs->win[bc % SS(fs)];
??put_fat_11:
        MOV      R0,#+512
        UDIV     R1,R7,R0
        MLS      R1,R1,R0,R7
        ADDS     R0,R1,R4
        ADDS     R0,R0,#+48
        MOV      R8,R0
//  922             *p = (clst & 1) ? (uint8)(val >> 4) : ((*p & 0xF0) | ((uint8)(val >> 8) & 0x0F));
        LSLS     R0,R5,#+31
        BPL.N    ??put_fat_12
        LSRS     R0,R6,#+4
        B.N      ??put_fat_13
??put_fat_12:
        LDRB     R0,[R8, #+0]
        ANDS     R0,R0,#0xF0
        LSRS     R1,R6,#+8
        ANDS     R1,R1,#0xF
        ORRS     R0,R1,R0
??put_fat_13:
        STRB     R0,[R8, #+0]
//  923             break;
        B.N      ??put_fat_7
//  924 
//  925         case FS_FAT16 :
//  926             res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 2)));
??put_fat_6:
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R5, LSR #+8
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        MOV      R9,R0
//  927             if (res != FR_OK) break;
        SXTB     R9,R9            ;; SignExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BNE.N    ??put_fat_7
//  928             p = &fs->win[clst * 2 % SS(fs)];
??put_fat_14:
        LSLS     R0,R5,#+1
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADDS     R0,R2,R4
        ADDS     R0,R0,#+48
        MOV      R8,R0
//  929             ST_WORD(p, (uint16)val);
        STRB     R6,[R8, #+0]
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+1]
//  930             break;
        B.N      ??put_fat_7
//  931 
//  932         case FS_FAT32 :
//  933             res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 4)));
??put_fat_5:
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R5, LSR #+7
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        MOV      R9,R0
//  934             if (res != FR_OK) break;
        SXTB     R9,R9            ;; SignExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BNE.N    ??put_fat_7
//  935             p = &fs->win[clst * 4 % SS(fs)];
??put_fat_15:
        LSLS     R0,R5,#+2
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADDS     R0,R2,R4
        ADDS     R0,R0,#+48
        MOV      R8,R0
//  936             val |= LD_DWORD(p) & 0xF0000000;
        LDRB     R0,[R8, #+3]
        LSLS     R0,R0,#+24
        ANDS     R0,R0,#0xF0000000
        ORRS     R6,R0,R6
//  937             ST_DWORD(p, val);
        STRB     R6,[R8, #+0]
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+1]
        LSRS     R0,R6,#+16
        STRB     R0,[R8, #+2]
        LSRS     R0,R6,#+24
        STRB     R0,[R8, #+3]
//  938             break;
        B.N      ??put_fat_7
//  939 
//  940         default :
//  941             res = FR_INT_ERR;
??put_fat_4:
        MOVS     R0,#+2
        MOV      R9,R0
//  942         }
//  943         fs->wflag = 1;
??put_fat_7:
        MOVS     R0,#+1
        STRB     R0,[R4, #+4]
//  944     }
//  945 
//  946     return res;
??put_fat_2:
        MOV      R0,R9
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        POP      {R1,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock8
//  947 }
//  948 #endif /* !_FS_READONLY */
//  949 
//  950 
//  951 
//  952 
//  953 /*-----------------------------------------------------------------------*/
//  954 /* FAT handling - Remove a cluster chain                                 */
//  955 /*-----------------------------------------------------------------------*/
//  956 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function remove_chain
        THUMB
//  957 static
//  958 FRESULT remove_chain (
//  959     FATFS *fs,          /* File system object */
//  960     uint32 clst         /* Cluster# to remove a chain from */
//  961 )
//  962 {
remove_chain:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  963     FRESULT res;
//  964     uint32 nxt;
//  965 #if _USE_ERASE
//  966     uint32 scl = clst, ecl = clst, resion[2];
//  967 #endif
//  968 
//  969     if (clst < 2 || clst >= fs->n_fatent)   /* Check range */
        CMP      R5,#+2
        BCC.N    ??remove_chain_0
        LDR      R0,[R4, #+24]
        CMP      R5,R0
        BCC.N    ??remove_chain_1
//  970     {
//  971         res = FR_INT_ERR;
??remove_chain_0:
        MOVS     R0,#+2
        MOVS     R6,R0
        B.N      ??remove_chain_2
//  972 
//  973     }
//  974     else
//  975     {
//  976         res = FR_OK;
??remove_chain_1:
        MOVS     R0,#+0
        MOVS     R6,R0
//  977         while (clst < fs->n_fatent)             /* Not a last link? */
??remove_chain_3:
        LDR      R0,[R4, #+24]
        CMP      R5,R0
        BCS.N    ??remove_chain_2
//  978         {
//  979             nxt = get_fat(fs, clst);            /* Get cluster status */
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall get_fat
        BL       get_fat
        MOVS     R7,R0
//  980             if (nxt == 0) break;                /* Empty cluster? */
        CMP      R7,#+0
        BEQ.N    ??remove_chain_2
//  981             if (nxt == 1)
??remove_chain_4:
        CMP      R7,#+1
        BNE.N    ??remove_chain_5
//  982             {
//  983                 res = FR_INT_ERR;    /* Internal error? */
        MOVS     R0,#+2
        MOVS     R6,R0
//  984                 break;
        B.N      ??remove_chain_2
//  985             }
//  986             if (nxt == 0xFFFFFFFF)
??remove_chain_5:
        CMN      R7,#+1
        BNE.N    ??remove_chain_6
//  987             {
//  988                 res = FR_DISK_ERR;    /* Disk error? */
        MOVS     R0,#+1
        MOVS     R6,R0
//  989                 break;
        B.N      ??remove_chain_2
//  990             }
//  991             res = put_fat(fs, clst, 0);         /* Mark the cluster "empty" */
??remove_chain_6:
        MOVS     R2,#+0
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall put_fat
        BL       put_fat
        MOVS     R6,R0
//  992             if (res != FR_OK) break;
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??remove_chain_2
//  993             if (fs->free_clust != 0xFFFFFFFF)   /* Update FSInfo */
??remove_chain_7:
        LDR      R0,[R4, #+16]
        CMN      R0,#+1
        BEQ.N    ??remove_chain_8
//  994             {
//  995                 fs->free_clust++;
        LDR      R0,[R4, #+16]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+16]
//  996                 fs->fsi_flag = 1;
        MOVS     R0,#+1
        STRB     R0,[R4, #+5]
//  997             }
//  998 #if _USE_ERASE
//  999             if (ecl + 1 == nxt)     /* Next cluster is contiguous */
// 1000             {
// 1001                 ecl = nxt;
// 1002             }
// 1003             else                /* End of contiguous clusters */
// 1004             {
// 1005                 resion[0] = clust2sect(fs, scl);                    /* Start sector */
// 1006                 resion[1] = clust2sect(fs, ecl) + fs->csize - 1;    /* End sector */
// 1007                 disk_ioctl(fs->drv, CTRL_ERASE_SECTOR, resion);     /* Erase the block */
// 1008                 scl = ecl = nxt;
// 1009             }
// 1010 #endif
// 1011             clst = nxt; /* Next cluster */
??remove_chain_8:
        MOVS     R5,R7
        B.N      ??remove_chain_3
// 1012         }
// 1013     }
// 1014 
// 1015     return res;
??remove_chain_2:
        MOVS     R0,R6
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock9
// 1016 }
// 1017 #endif
// 1018 
// 1019 
// 1020 
// 1021 
// 1022 /*-----------------------------------------------------------------------*/
// 1023 /* FAT handling - Stretch or Create a cluster chain                      */
// 1024 /*-----------------------------------------------------------------------*/
// 1025 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function create_chain
        THUMB
// 1026 static
// 1027 uint32 create_chain (   /* 0:No free cluster, 1:Internal error, 0xFFFFFFFF:Disk error, >=2:New cluster# */
// 1028     FATFS *fs,          /* File system object */
// 1029     uint32 clst         /* Cluster# to stretch. 0 means create a new chain. */
// 1030 )
// 1031 {
create_chain:
        PUSH     {R3-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
// 1032     uint32 cs, ncl, scl;
// 1033     FRESULT res;
// 1034 
// 1035 
// 1036     if (clst == 0)          /* Create a new chain */
        CMP      R5,#+0
        BNE.N    ??create_chain_0
// 1037     {
// 1038         scl = fs->last_clust;           /* Get suggested start point */
        LDR      R0,[R4, #+12]
        MOV      R8,R0
// 1039         if (!scl || scl >= fs->n_fatent) scl = 1;
        CMP      R8,#+0
        BEQ.N    ??create_chain_1
        LDR      R0,[R4, #+24]
        CMP      R8,R0
        BCC.N    ??create_chain_2
??create_chain_1:
        MOVS     R0,#+1
        MOV      R8,R0
        B.N      ??create_chain_2
// 1040     }
// 1041     else                    /* Stretch the current chain */
// 1042     {
// 1043         cs = get_fat(fs, clst);         /* Check the cluster status */
??create_chain_0:
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall get_fat
        BL       get_fat
        MOVS     R6,R0
// 1044         if (cs < 2) return 1;           /* It is an invalid cluster */
        CMP      R6,#+2
        BCS.N    ??create_chain_3
        MOVS     R0,#+1
        B.N      ??create_chain_4
// 1045         if (cs < fs->n_fatent) return cs;   /* It is already followed by next cluster */
??create_chain_3:
        LDR      R0,[R4, #+24]
        CMP      R6,R0
        BCS.N    ??create_chain_5
        MOVS     R0,R6
        B.N      ??create_chain_4
// 1046         scl = clst;
??create_chain_5:
        MOV      R8,R5
// 1047     }
// 1048 
// 1049     ncl = scl;              /* Start cluster */
??create_chain_2:
        MOV      R7,R8
// 1050     for (;;)
// 1051     {
// 1052         ncl++;                          /* Next cluster */
??create_chain_6:
        ADDS     R7,R7,#+1
// 1053         if (ncl >= fs->n_fatent)        /* Wrap around */
        LDR      R0,[R4, #+24]
        CMP      R7,R0
        BCC.N    ??create_chain_7
// 1054         {
// 1055             ncl = 2;
        MOVS     R0,#+2
        MOVS     R7,R0
// 1056             if (ncl > scl) return 0;    /* No free cluster */
        CMP      R8,R7
        BCS.N    ??create_chain_7
        MOVS     R0,#+0
        B.N      ??create_chain_4
// 1057         }
// 1058         cs = get_fat(fs, ncl);          /* Get the cluster status */
??create_chain_7:
        MOVS     R1,R7
        MOVS     R0,R4
          CFI FunCall get_fat
        BL       get_fat
        MOVS     R6,R0
// 1059         if (cs == 0) break;             /* Found a free cluster */
        CMP      R6,#+0
        BNE.N    ??create_chain_8
// 1060         if (cs == 0xFFFFFFFF || cs == 1)/* An error occurred */
// 1061             return cs;
// 1062         if (ncl == scl) return 0;       /* No free cluster */
// 1063     }
// 1064 
// 1065     res = put_fat(fs, ncl, 0x0FFFFFFF); /* Mark the new cluster "last link" */
        MVNS     R2,#-268435456
        MOVS     R1,R7
        MOVS     R0,R4
          CFI FunCall put_fat
        BL       put_fat
        MOV      R9,R0
// 1066     if (res == FR_OK && clst != 0)
        SXTB     R9,R9            ;; SignExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BNE.N    ??create_chain_9
        B.N      ??create_chain_10
??create_chain_8:
        CMN      R6,#+1
        BEQ.N    ??create_chain_11
        CMP      R6,#+1
        BNE.N    ??create_chain_12
??create_chain_11:
        MOVS     R0,R6
        B.N      ??create_chain_4
??create_chain_12:
        CMP      R7,R8
        BNE.N    ??create_chain_6
        MOVS     R0,#+0
        B.N      ??create_chain_4
??create_chain_10:
        CMP      R5,#+0
        BEQ.N    ??create_chain_9
// 1067     {
// 1068         res = put_fat(fs, clst, ncl);   /* Link it to the previous one if needed */
        MOVS     R2,R7
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall put_fat
        BL       put_fat
        MOV      R9,R0
// 1069     }
// 1070     if (res == FR_OK)
??create_chain_9:
        SXTB     R9,R9            ;; SignExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BNE.N    ??create_chain_13
// 1071     {
// 1072         fs->last_clust = ncl;           /* Update FSINFO */
        STR      R7,[R4, #+12]
// 1073         if (fs->free_clust != 0xFFFFFFFF)
        LDR      R0,[R4, #+16]
        CMN      R0,#+1
        BEQ.N    ??create_chain_14
// 1074         {
// 1075             fs->free_clust--;
        LDR      R0,[R4, #+16]
        SUBS     R0,R0,#+1
        STR      R0,[R4, #+16]
// 1076             fs->fsi_flag = 1;
        MOVS     R0,#+1
        STRB     R0,[R4, #+5]
        B.N      ??create_chain_14
// 1077         }
// 1078     }
// 1079     else
// 1080     {
// 1081         ncl = (res == FR_DISK_ERR) ? 0xFFFFFFFF : 1;
??create_chain_13:
        SXTB     R9,R9            ;; SignExt  R9,R9,#+24,#+24
        CMP      R9,#+1
        BNE.N    ??create_chain_15
        MOVS     R7,#-1
        B.N      ??create_chain_14
??create_chain_15:
        MOVS     R7,#+1
// 1082     }
// 1083 
// 1084     return ncl;     /* Return new cluster number or error code */
??create_chain_14:
        MOVS     R0,R7
??create_chain_4:
        POP      {R1,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock10
// 1085 }
// 1086 #endif /* !_FS_READONLY */
// 1087 
// 1088 
// 1089 
// 1090 /*-----------------------------------------------------------------------*/
// 1091 /* FAT handling - Convert offset into cluster with link map table        */
// 1092 /*-----------------------------------------------------------------------*/
// 1093 
// 1094 #if _USE_FASTSEEK
// 1095 static
// 1096 uint32 clmt_clust ( /* <2:Error, >=2:Cluster number */
// 1097     FIL *fp,        /* Pointer to the file object */
// 1098     uint32 ofs      /* File offset to be converted to cluster# */
// 1099 )
// 1100 {
// 1101     uint32 cl, ncl, *tbl;
// 1102 
// 1103 
// 1104     tbl = fp->cltbl + 1;    /* Top of CLMT */
// 1105     cl = ofs / SS(fp->fs) / fp->fs->csize;  /* Cluster order from top of the file */
// 1106     for (;;)
// 1107     {
// 1108         ncl = *tbl++;           /* Number of cluters in the fragment */
// 1109         if (!ncl) return 0;     /* End of table? (error) */
// 1110         if (cl < ncl) break;    /* In this fragment? */
// 1111         cl -= ncl;
// 1112         tbl++;      /* Next fragment */
// 1113     }
// 1114     return cl + *tbl;   /* Return the cluster number */
// 1115 }
// 1116 #endif  /* _USE_FASTSEEK */
// 1117 
// 1118 
// 1119 
// 1120 /*-----------------------------------------------------------------------*/
// 1121 /* Directory handling - Set directory index                              */
// 1122 /*-----------------------------------------------------------------------*/
// 1123 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function dir_sdi
        THUMB
// 1124 static
// 1125 FRESULT dir_sdi (
// 1126     DIR *dj,        /* Pointer to directory object */
// 1127     uint16 idx      /* Directory index number */
// 1128 )
// 1129 {
dir_sdi:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
// 1130     uint32 clst;
// 1131     uint16 ic;
// 1132 
// 1133 
// 1134     dj->index = idx;
        STRH     R5,[R4, #+6]
// 1135     clst = dj->sclust;
        LDR      R0,[R4, #+8]
        MOVS     R6,R0
// 1136     if (clst == 1 || clst >= dj->fs->n_fatent)  /* Check start cluster range */
        CMP      R6,#+1
        BEQ.N    ??dir_sdi_0
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+24]
        CMP      R6,R0
        BCC.N    ??dir_sdi_1
// 1137         return FR_INT_ERR;
??dir_sdi_0:
        MOVS     R0,#+2
        B.N      ??dir_sdi_2
// 1138     if (!clst && dj->fs->fs_type == FS_FAT32)   /* Replace cluster# 0 with root cluster# if in FAT32 */
??dir_sdi_1:
        CMP      R6,#+0
        BNE.N    ??dir_sdi_3
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??dir_sdi_3
// 1139         clst = dj->fs->dirbase;
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+36]
        MOVS     R6,R0
// 1140 
// 1141     if (clst == 0)      /* Static table (root-dir in FAT12/16) */
??dir_sdi_3:
        CMP      R6,#+0
        BNE.N    ??dir_sdi_4
// 1142     {
// 1143         dj->clust = clst;
        STR      R6,[R4, #+12]
// 1144         if (idx >= dj->fs->n_rootdir)       /* Index is out of range */
        LDR      R0,[R4, #+0]
        LDRH     R0,[R0, #+8]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BCC.N    ??dir_sdi_5
// 1145             return FR_INT_ERR;
        MOVS     R0,#+2
        B.N      ??dir_sdi_2
// 1146         dj->sect = dj->fs->dirbase + idx / (SS(dj->fs) / SZ_DIR);   /* Sector# */
??dir_sdi_5:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+36]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R0,R0,R5, LSR #+4
        STR      R0,[R4, #+16]
        B.N      ??dir_sdi_6
// 1147     }
// 1148     else                /* Dynamic table (sub-dirs or root-dir in FAT32) */
// 1149     {
// 1150         ic = SS(dj->fs) / SZ_DIR * dj->fs->csize;   /* Entries per cluster */
??dir_sdi_4:
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+2]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSLS     R0,R0,#+4
        MOVS     R7,R0
// 1151         while (idx >= ic)   /* Follow cluster chain */
??dir_sdi_7:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R5,R7
        BCC.N    ??dir_sdi_8
// 1152         {
// 1153             clst = get_fat(dj->fs, clst);               /* Get next cluster */
        MOVS     R1,R6
        LDR      R0,[R4, #+0]
          CFI FunCall get_fat
        BL       get_fat
        MOVS     R6,R0
// 1154             if (clst == 0xFFFFFFFF) return FR_DISK_ERR; /* Disk error */
        CMN      R6,#+1
        BNE.N    ??dir_sdi_9
        MOVS     R0,#+1
        B.N      ??dir_sdi_2
// 1155             if (clst < 2 || clst >= dj->fs->n_fatent)   /* Reached to end of table or int error */
??dir_sdi_9:
        CMP      R6,#+2
        BCC.N    ??dir_sdi_10
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+24]
        CMP      R6,R0
        BCC.N    ??dir_sdi_11
// 1156                 return FR_INT_ERR;
??dir_sdi_10:
        MOVS     R0,#+2
        B.N      ??dir_sdi_2
// 1157             idx -= ic;
??dir_sdi_11:
        SUBS     R5,R5,R7
        B.N      ??dir_sdi_7
// 1158         }
// 1159         dj->clust = clst;
??dir_sdi_8:
        STR      R6,[R4, #+12]
// 1160         dj->sect = clust2sect(dj->fs, clst) + idx / (SS(dj->fs) / SZ_DIR);  /* Sector# */
        MOVS     R1,R6
        LDR      R0,[R4, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R0,R0,R5, LSR #+4
        STR      R0,[R4, #+16]
// 1161     }
// 1162 
// 1163     dj->dir = dj->fs->win + (idx % (SS(dj->fs) / SZ_DIR)) * SZ_DIR; /* Ptr to the entry in the sector */
??dir_sdi_6:
        LDR      R0,[R4, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R1,#+16
        UDIV     R2,R5,R1
        MLS      R2,R2,R1,R5
        ADDS     R0,R0,R2, LSL #+5
        ADDS     R0,R0,#+48
        STR      R0,[R4, #+20]
// 1164 
// 1165     return FR_OK;   /* Seek succeeded */
        MOVS     R0,#+0
??dir_sdi_2:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock11
// 1166 }
// 1167 
// 1168 
// 1169 
// 1170 
// 1171 /*-----------------------------------------------------------------------*/
// 1172 /* Directory handling - Move directory index next                        */
// 1173 /*-----------------------------------------------------------------------*/
// 1174 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function dir_next
        THUMB
// 1175 static
// 1176 FRESULT dir_next (  /* FR_OK:Succeeded, FR_NO_FILE:End of table, FR_DENIED:EOT and could not stretch */
// 1177     DIR *dj,        /* Pointer to directory object */
// 1178     int stretch     /* 0: Do not stretch table, 1: Stretch table if needed */
// 1179 )
// 1180 {
dir_next:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R7,R1
// 1181     uint32 clst;
// 1182     uint16 i;
// 1183 
// 1184 
// 1185     stretch = stretch;      /* To suppress warning on read-only cfg. */
// 1186     i = dj->index + 1;
        LDRH     R0,[R4, #+6]
        ADDS     R0,R0,#+1
        MOVS     R6,R0
// 1187     if (!i || !dj->sect)    /* Report EOT when index has reached 65535 */
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??dir_next_0
        LDR      R0,[R4, #+16]
        CMP      R0,#+0
        BNE.N    ??dir_next_1
// 1188         return FR_NO_FILE;
??dir_next_0:
        MOVS     R0,#+4
        B.N      ??dir_next_2
// 1189 
// 1190     if (!(i % (SS(dj->fs) / SZ_DIR)))   /* Sector changed? */
??dir_next_1:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,#+16
        UDIV     R1,R6,R0
        MLS      R1,R1,R0,R6
        CMP      R1,#+0
        BNE.N    ??dir_next_3
// 1191     {
// 1192         dj->sect++;                 /* Next sector */
        LDR      R0,[R4, #+16]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+16]
// 1193 
// 1194         if (dj->clust == 0)     /* Static table */
        LDR      R0,[R4, #+12]
        CMP      R0,#+0
        BNE.N    ??dir_next_4
// 1195         {
// 1196             if (i >= dj->fs->n_rootdir) /* Report EOT when end of table */
        LDR      R0,[R4, #+0]
        LDRH     R0,[R0, #+8]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,R0
        BCC.N    ??dir_next_3
// 1197                 return FR_NO_FILE;
        MOVS     R0,#+4
        B.N      ??dir_next_2
// 1198         }
// 1199         else                    /* Dynamic table */
// 1200         {
// 1201             if (((i / (SS(dj->fs) / SZ_DIR)) & (dj->fs->csize - 1)) == 0)   /* Cluster changed? */
??dir_next_4:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+2]
        SUBS     R0,R0,#+1
        TST      R0,R6, LSR #+4
        BNE.N    ??dir_next_3
// 1202             {
// 1203                 clst = get_fat(dj->fs, dj->clust);              /* Get next cluster */
        LDR      R1,[R4, #+12]
        LDR      R0,[R4, #+0]
          CFI FunCall get_fat
        BL       get_fat
        MOVS     R5,R0
// 1204                 if (clst <= 1) return FR_INT_ERR;
        CMP      R5,#+2
        BCS.N    ??dir_next_5
        MOVS     R0,#+2
        B.N      ??dir_next_2
// 1205                 if (clst == 0xFFFFFFFF) return FR_DISK_ERR;
??dir_next_5:
        CMN      R5,#+1
        BNE.N    ??dir_next_6
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1206                 if (clst >= dj->fs->n_fatent)                   /* When it reached end of dynamic table */
??dir_next_6:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+24]
        CMP      R5,R0
        BCC.N    ??dir_next_7
// 1207                 {
// 1208 #if !_FS_READONLY
// 1209                     uint8 c;
// 1210                     if (!stretch) return FR_NO_FILE;            /* When do not stretch, report EOT */
        CMP      R7,#+0
        BNE.N    ??dir_next_8
        MOVS     R0,#+4
        B.N      ??dir_next_2
// 1211                     clst = create_chain(dj->fs, dj->clust);     /* Stretch cluster chain */
??dir_next_8:
        LDR      R1,[R4, #+12]
        LDR      R0,[R4, #+0]
          CFI FunCall create_chain
        BL       create_chain
        MOVS     R5,R0
// 1212                     if (clst == 0) return FR_DENIED;            /* No free cluster */
        CMP      R5,#+0
        BNE.N    ??dir_next_9
        MOVS     R0,#+7
        B.N      ??dir_next_2
// 1213                     if (clst == 1) return FR_INT_ERR;
??dir_next_9:
        CMP      R5,#+1
        BNE.N    ??dir_next_10
        MOVS     R0,#+2
        B.N      ??dir_next_2
// 1214                     if (clst == 0xFFFFFFFF) return FR_DISK_ERR;
??dir_next_10:
        CMN      R5,#+1
        BNE.N    ??dir_next_11
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1215                     /* Clean-up stretched table */
// 1216                     if (move_window(dj->fs, 0)) return FR_DISK_ERR; /* Flush active window */
??dir_next_11:
        MOVS     R1,#+0
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BEQ.N    ??dir_next_12
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1217                     mem_set(dj->fs->win, 0, SS(dj->fs));            /* Clear window buffer */
??dir_next_12:
        MOV      R2,#+512
        MOVS     R1,#+0
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,#+48
          CFI FunCall mem_set
        BL       mem_set
// 1218                     dj->fs->winsect = clust2sect(dj->fs, clst); /* Cluster start sector */
        MOVS     R1,R5
        LDR      R0,[R4, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        LDR      R1,[R4, #+0]
        STR      R0,[R1, #+44]
// 1219                     for (c = 0; c < dj->fs->csize; c++)         /* Fill the new cluster with 0 */
        MOVS     R0,#+0
        MOV      R8,R0
??dir_next_13:
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+2]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,R0
        BCS.N    ??dir_next_14
// 1220                     {
// 1221                         dj->fs->wflag = 1;
        MOVS     R0,#+1
        LDR      R1,[R4, #+0]
        STRB     R0,[R1, #+4]
// 1222                         if (move_window(dj->fs, 0)) return FR_DISK_ERR;
        MOVS     R1,#+0
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BEQ.N    ??dir_next_15
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1223                         dj->fs->winsect++;
??dir_next_15:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+44]
        ADDS     R0,R0,#+1
        LDR      R1,[R4, #+0]
        STR      R0,[R1, #+44]
// 1224                     }
        ADDS     R8,R8,#+1
        B.N      ??dir_next_13
// 1225                     dj->fs->winsect -= c;                       /* Rewind window address */
??dir_next_14:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+44]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        SUBS     R0,R0,R8
        LDR      R1,[R4, #+0]
        STR      R0,[R1, #+44]
// 1226 #else
// 1227                     return FR_NO_FILE;          /* Report EOT */
// 1228 #endif
// 1229                 }
// 1230                 dj->clust = clst;               /* Initialize data for new cluster */
??dir_next_7:
        STR      R5,[R4, #+12]
// 1231                 dj->sect = clust2sect(dj->fs, clst);
        MOVS     R1,R5
        LDR      R0,[R4, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        STR      R0,[R4, #+16]
// 1232             }
// 1233         }
// 1234     }
// 1235 
// 1236     dj->index = i;
??dir_next_3:
        STRH     R6,[R4, #+6]
// 1237     dj->dir = dj->fs->win + (i % (SS(dj->fs) / SZ_DIR)) * SZ_DIR;
        LDR      R0,[R4, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R1,#+16
        UDIV     R2,R6,R1
        MLS      R2,R2,R1,R6
        ADDS     R0,R0,R2, LSL #+5
        ADDS     R0,R0,#+48
        STR      R0,[R4, #+20]
// 1238 
// 1239     return FR_OK;
        MOVS     R0,#+0
??dir_next_2:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock12
// 1240 }
// 1241 
// 1242 
// 1243 
// 1244 
// 1245 /*-----------------------------------------------------------------------*/
// 1246 /* LFN handling - Test/Pick/Fit an LFN segment from/to directory entry   */
// 1247 /*-----------------------------------------------------------------------*/
// 1248 #if _USE_LFN
// 1249 static
// 1250 const uint8 LfnOfs[] = {1, 3, 5, 7, 9, 14, 16, 18, 20, 22, 24, 28, 30}; /* Offset of LFN chars in the directory entry */
// 1251 
// 1252 
// 1253 static
// 1254 int cmp_lfn (           /* 1:Matched, 0:Not matched */
// 1255     uint16 *lfnbuf,     /* Pointer to the LFN to be compared */
// 1256     uint8 *dir          /* Pointer to the directory entry containing a part of LFN */
// 1257 )
// 1258 {
// 1259     uint32 i, s;
// 1260     uint16 wc, uc;
// 1261 
// 1262 
// 1263     i = ((dir[LDIR_Ord] & ~LLE) - 1) * 13;  /* Get offset in the LFN buffer */
// 1264     s = 0;
// 1265     wc = 1;
// 1266     do
// 1267     {
// 1268         uc = LD_WORD(dir + LfnOfs[s]);  /* Pick an LFN character from the entry */
// 1269         if (wc)     /* Last char has not been processed */
// 1270         {
// 1271             wc = ff_wtoupper(uc);       /* Convert it to upper case */
// 1272             if (i >= _MAX_LFN || wc != ff_wtoupper(lfnbuf[i++]))    /* Compare it */
// 1273                 return 0;               /* Not matched */
// 1274         }
// 1275         else
// 1276         {
// 1277             if (uc != 0xFFFF) return 0; /* Check filler */
// 1278         }
// 1279     }
// 1280     while (++s < 13);               /* Repeat until all chars in the entry are checked */
// 1281 
// 1282     if ((dir[LDIR_Ord] & LLE) && wc && lfnbuf[i])   /* Last segment matched but different length */
// 1283         return 0;
// 1284 
// 1285     return 1;                       /* The part of LFN matched */
// 1286 }
// 1287 
// 1288 
// 1289 
// 1290 static
// 1291 int pick_lfn (          /* 1:Succeeded, 0:Buffer overflow */
// 1292     uint16 *lfnbuf,     /* Pointer to the Unicode-LFN buffer */
// 1293     uint8 *dir          /* Pointer to the directory entry */
// 1294 )
// 1295 {
// 1296     uint32 i, s;
// 1297     uint16 wc, uc;
// 1298 
// 1299 
// 1300     i = ((dir[LDIR_Ord] & 0x3F) - 1) * 13;  /* Offset in the LFN buffer */
// 1301 
// 1302     s = 0;
// 1303     wc = 1;
// 1304     do
// 1305     {
// 1306         uc = LD_WORD(dir + LfnOfs[s]);      /* Pick an LFN character from the entry */
// 1307         if (wc)     /* Last char has not been processed */
// 1308         {
// 1309             if (i >= _MAX_LFN) return 0;    /* Buffer overflow? */
// 1310             lfnbuf[i++] = wc = uc;          /* Store it */
// 1311         }
// 1312         else
// 1313         {
// 1314             if (uc != 0xFFFF) return 0;     /* Check filler */
// 1315         }
// 1316     }
// 1317     while (++s < 13);                       /* Read all character in the entry */
// 1318 
// 1319     if (dir[LDIR_Ord] & LLE)                /* Put terminator if it is the last LFN part */
// 1320     {
// 1321         if (i >= _MAX_LFN) return 0;        /* Buffer overflow? */
// 1322         lfnbuf[i] = 0;
// 1323     }
// 1324 
// 1325     return 1;
// 1326 }
// 1327 
// 1328 
// 1329 #if !_FS_READONLY
// 1330 static
// 1331 void fit_lfn (
// 1332     const uint16 *lfnbuf,   /* Pointer to the LFN buffer */
// 1333     uint8 *dir,             /* Pointer to the directory entry */
// 1334     uint8 ord,              /* LFN order (1-20) */
// 1335     uint8 sum               /* SFN sum */
// 1336 )
// 1337 {
// 1338     uint32 i, s;
// 1339     uint16 wc;
// 1340 
// 1341 
// 1342     dir[LDIR_Chksum] = sum;         /* Set check sum */
// 1343     dir[LDIR_Attr] = AM_LFN;        /* Set attribute. LFN entry */
// 1344     dir[LDIR_Type] = 0;
// 1345     ST_WORD(dir + LDIR_FstClusLO, 0);
// 1346 
// 1347     i = (ord - 1) * 13;             /* Get offset in the LFN buffer */
// 1348     s = wc = 0;
// 1349     do
// 1350     {
// 1351         if (wc != 0xFFFF) wc = lfnbuf[i++]; /* Get an effective char */
// 1352         ST_WORD(dir + LfnOfs[s], wc);   /* Put it */
// 1353         if (!wc) wc = 0xFFFF;       /* Padding chars following last char */
// 1354     }
// 1355     while (++s < 13);
// 1356     if (wc == 0xFFFF || !lfnbuf[i]) ord |= LLE; /* Bottom LFN part is the start of LFN sequence */
// 1357     dir[LDIR_Ord] = ord;            /* Set the LFN order */
// 1358 }
// 1359 
// 1360 #endif
// 1361 #endif
// 1362 
// 1363 
// 1364 
// 1365 /*-----------------------------------------------------------------------*/
// 1366 /* Create numbered name                                                  */
// 1367 /*-----------------------------------------------------------------------*/
// 1368 #if _USE_LFN
// 1369 void gen_numname (
// 1370     uint8 *dst,         /* Pointer to generated SFN */
// 1371     const uint8 *src,   /* Pointer to source SFN to be modified */
// 1372     const uint16 *lfn,  /* Pointer to LFN */
// 1373     uint16 seq          /* Sequence number */
// 1374 )
// 1375 {
// 1376     uint8 ns[8], c;
// 1377     uint32 i, j;
// 1378 
// 1379 
// 1380     mem_cpy(dst, src, 11);
// 1381 
// 1382     if (seq > 5)    /* On many collisions, generate a hash number instead of sequential number */
// 1383     {
// 1384         do seq = (seq >> 1) + (seq << 15) + (uint16) * lfn++;
// 1385         while (*lfn);
// 1386     }
// 1387 
// 1388     /* itoa (hexdecimal) */
// 1389     i = 7;
// 1390     do
// 1391     {
// 1392         c = (seq % 16) + '0';
// 1393         if (c > '9') c += 7;
// 1394         ns[i--] = c;
// 1395         seq /= 16;
// 1396     }
// 1397     while (seq);
// 1398     ns[i] = '~';
// 1399 
// 1400     /* Append the number */
// 1401     for (j = 0; j < i && dst[j] != ' '; j++)
// 1402     {
// 1403         if (IsDBCS1(dst[j]))
// 1404         {
// 1405             if (j == i - 1) break;
// 1406             j++;
// 1407         }
// 1408     }
// 1409     do
// 1410     {
// 1411         dst[j++] = (i < 8) ? ns[i++] : ' ';
// 1412     }
// 1413     while (j < 8);
// 1414 }
// 1415 #endif
// 1416 
// 1417 
// 1418 
// 1419 
// 1420 /*-----------------------------------------------------------------------*/
// 1421 /* Calculate sum of an SFN                                               */
// 1422 /*-----------------------------------------------------------------------*/
// 1423 #if _USE_LFN
// 1424 static
// 1425 uint8 sum_sfn (
// 1426     const uint8 *dir        /* Ptr to directory entry */
// 1427 )
// 1428 {
// 1429     uint8 sum = 0;
// 1430     uint32 n = 11;
// 1431 
// 1432     do sum = (sum >> 1) + (sum << 7) + *dir++;
// 1433     while (--n);
// 1434     return sum;
// 1435 }
// 1436 #endif
// 1437 
// 1438 
// 1439 
// 1440 
// 1441 /*-----------------------------------------------------------------------*/
// 1442 /* Directory handling - Find an object in the directory                  */
// 1443 /*-----------------------------------------------------------------------*/
// 1444 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function dir_find
        THUMB
// 1445 static
// 1446 FRESULT dir_find (
// 1447     DIR *dj         /* Pointer to the directory object linked to the file name */
// 1448 )
// 1449 {
dir_find:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
// 1450     FRESULT res;
// 1451     uint8 c, *dir;
// 1452 #if _USE_LFN
// 1453     uint8 a, ord, sum;
// 1454 #endif
// 1455 
// 1456     res = dir_sdi(dj, 0);           /* Rewind directory object */
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
        MOVS     R7,R0
// 1457     if (res != FR_OK) return res;
        SXTB     R7,R7            ;; SignExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??dir_find_0
        MOVS     R0,R7
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        B.N      ??dir_find_1
// 1458 
// 1459 #if _USE_LFN
// 1460     ord = sum = 0xFF;
// 1461 #endif
// 1462     do
// 1463     {
// 1464         res = move_window(dj->fs, dj->sect);
??dir_find_0:
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R7,R0
// 1465         if (res != FR_OK) break;
        SXTB     R7,R7            ;; SignExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??dir_find_2
// 1466         dir = dj->dir;                  /* Ptr to the directory entry of current index */
??dir_find_3:
        LDR      R0,[R4, #+20]
        MOVS     R6,R0
// 1467         c = dir[DIR_Name];
        LDRB     R0,[R6, #+0]
        MOVS     R5,R0
// 1468         if (c == 0)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_find_4
// 1469         {
// 1470             res = FR_NO_FILE;    /* Reached to end of table */
        MOVS     R0,#+4
        MOVS     R7,R0
// 1471             break;
        B.N      ??dir_find_2
// 1472         }
// 1473 #if _USE_LFN    /* LFN configuration */
// 1474         a = dir[DIR_Attr] & AM_MASK;
// 1475         if (c == DDE || ((a & AM_VOL) && a != AM_LFN))      /* An entry without valid data */
// 1476         {
// 1477             ord = 0xFF;
// 1478         }
// 1479         else
// 1480         {
// 1481             if (a == AM_LFN)            /* An LFN entry is found */
// 1482             {
// 1483                 if (dj->lfn)
// 1484                 {
// 1485                     if (c & LLE)        /* Is it start of LFN sequence? */
// 1486                     {
// 1487                         sum = dir[LDIR_Chksum];
// 1488                         c &= ~LLE;
// 1489                         ord = c;    /* LFN start order */
// 1490                         dj->lfn_idx = dj->index;
// 1491                     }
// 1492                     /* Check validity of the LFN entry and compare it with given name */
// 1493                     ord = (c == ord && sum == dir[LDIR_Chksum] && cmp_lfn(dj->lfn, dir)) ? ord - 1 : 0xFF;
// 1494                 }
// 1495             }
// 1496             else                    /* An SFN entry is found */
// 1497             {
// 1498                 if (!ord && sum == sum_sfn(dir)) break; /* LFN matched? */
// 1499                 ord = 0xFF;
// 1500                 dj->lfn_idx = 0xFFFF;   /* Reset LFN sequence */
// 1501                 if (!(dj->fn[NS] & NS_LOSS) && !mem_cmp(dir, dj->fn, 11)) break;    /* SFN matched? */
// 1502             }
// 1503         }
// 1504 #else       /* Non LFN configuration */
// 1505         if (!(dir[DIR_Attr] & AM_VOL) && !mem_cmp(dir, dj->fn, 11)) /* Is it a valid entry? */
??dir_find_4:
        LDRB     R0,[R6, #+11]
        LSLS     R0,R0,#+28
        BMI.N    ??dir_find_5
        MOVS     R2,#+11
        LDR      R1,[R4, #+24]
        MOVS     R0,R6
          CFI FunCall mem_cmp
        BL       mem_cmp
        CMP      R0,#+0
        BEQ.N    ??dir_find_2
// 1506             break;
// 1507 #endif
// 1508         res = dir_next(dj, 0);      /* Next entry */
??dir_find_5:
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_next
        BL       dir_next
        MOVS     R7,R0
// 1509     }
// 1510     while (res == FR_OK);
        SXTB     R7,R7            ;; SignExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??dir_find_0
// 1511 
// 1512     return res;
??dir_find_2:
        MOVS     R0,R7
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
??dir_find_1:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock13
// 1513 }
// 1514 
// 1515 
// 1516 
// 1517 
// 1518 /*-----------------------------------------------------------------------*/
// 1519 /* Read an object from the directory                                     */
// 1520 /*-----------------------------------------------------------------------*/
// 1521 #if _FS_MINIMIZE <= 1

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function dir_read
        THUMB
// 1522 static
// 1523 FRESULT dir_read (
// 1524     DIR *dj         /* Pointer to the directory object that pointing the entry to be read */
// 1525 )
// 1526 {
dir_read:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
// 1527     FRESULT res;
// 1528     uint8 c, *dir;
// 1529 #if _USE_LFN
// 1530     uint8 a, ord = 0xFF, sum = 0xFF;
// 1531 #endif
// 1532 
// 1533     res = FR_NO_FILE;
        MOVS     R0,#+4
        MOVS     R5,R0
// 1534     while (dj->sect)
??dir_read_0:
        LDR      R0,[R4, #+16]
        CMP      R0,#+0
        BEQ.N    ??dir_read_1
// 1535     {
// 1536         res = move_window(dj->fs, dj->sect);
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
// 1537         if (res != FR_OK) break;
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_read_1
// 1538         dir = dj->dir;                  /* Ptr to the directory entry of current index */
??dir_read_2:
        LDR      R0,[R4, #+20]
        MOVS     R7,R0
// 1539         c = dir[DIR_Name];
        LDRB     R0,[R7, #+0]
        MOVS     R6,R0
// 1540         if (c == 0)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??dir_read_3
// 1541         {
// 1542             res = FR_NO_FILE;    /* Reached to end of table */
        MOVS     R0,#+4
        MOVS     R5,R0
// 1543             break;
        B.N      ??dir_read_1
// 1544         }
// 1545 #if _USE_LFN    /* LFN configuration */
// 1546         a = dir[DIR_Attr] & AM_MASK;
// 1547         if (c == DDE || (!_FS_RPATH && c == '.') || ((a & AM_VOL) && a != AM_LFN))      /* An entry without valid data */
// 1548         {
// 1549             ord = 0xFF;
// 1550         }
// 1551         else
// 1552         {
// 1553             if (a == AM_LFN)            /* An LFN entry is found */
// 1554             {
// 1555                 if (c & LLE)            /* Is it start of LFN sequence? */
// 1556                 {
// 1557                     sum = dir[LDIR_Chksum];
// 1558                     c &= ~LLE;
// 1559                     ord = c;
// 1560                     dj->lfn_idx = dj->index;
// 1561                 }
// 1562                 /* Check LFN validity and capture it */
// 1563                 ord = (c == ord && sum == dir[LDIR_Chksum] && pick_lfn(dj->lfn, dir)) ? ord - 1 : 0xFF;
// 1564             }
// 1565             else                    /* An SFN entry is found */
// 1566             {
// 1567                 if (ord || sum != sum_sfn(dir)) /* Is there a valid LFN? */
// 1568                     dj->lfn_idx = 0xFFFF;       /* It has no LFN. */
// 1569                 break;
// 1570             }
// 1571         }
// 1572 #else       /* Non LFN configuration */
// 1573         if (c != DDE && (_FS_RPATH || c != '.') && !(dir[DIR_Attr] & AM_VOL))   /* Is it a valid entry? */
??dir_read_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+229
        BEQ.N    ??dir_read_4
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+46
        BEQ.N    ??dir_read_4
        LDRB     R0,[R7, #+11]
        LSLS     R0,R0,#+28
        BPL.N    ??dir_read_1
// 1574             break;
// 1575 #endif
// 1576         res = dir_next(dj, 0);              /* Next entry */
??dir_read_4:
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_next
        BL       dir_next
        MOVS     R5,R0
// 1577         if (res != FR_OK) break;
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??dir_read_0
// 1578     }
// 1579 
// 1580     if (res != FR_OK) dj->sect = 0;
??dir_read_1:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??dir_read_5
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
// 1581 
// 1582     return res;
??dir_read_5:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock14
// 1583 }
// 1584 #endif
// 1585 
// 1586 
// 1587 
// 1588 /*-----------------------------------------------------------------------*/
// 1589 /* Register an object to the directory                                   */
// 1590 /*-----------------------------------------------------------------------*/
// 1591 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function dir_register
        THUMB
// 1592 static
// 1593 FRESULT dir_register (  /* FR_OK:Successful, FR_DENIED:No free entry or too many SFN collision, FR_DISK_ERR:Disk error */
// 1594     DIR *dj             /* Target directory with object name to be created */
// 1595 )
// 1596 {
dir_register:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
// 1597     FRESULT res;
// 1598     uint8 c, *dir;
// 1599 #if _USE_LFN    /* LFN configuration */
// 1600     uint16 n, ne, is;
// 1601     uint8 sn[12], *fn, sum;
// 1602     uint16 *lfn;
// 1603 
// 1604 
// 1605     fn = dj->fn;
// 1606     lfn = dj->lfn;
// 1607     mem_cpy(sn, fn, 12);
// 1608 
// 1609     if (_FS_RPATH && (sn[NS] & NS_DOT))     /* Cannot create dot entry */
// 1610         return FR_INVALID_NAME;
// 1611 
// 1612     if (sn[NS] & NS_LOSS)           /* When LFN is out of 8.3 format, generate a numbered name */
// 1613     {
// 1614         fn[NS] = 0;
// 1615         dj->lfn = 0;            /* Find only SFN */
// 1616         for (n = 1; n < 100; n++)
// 1617         {
// 1618             gen_numname(fn, sn, lfn, n);    /* Generate a numbered name */
// 1619             res = dir_find(dj);             /* Check if the name collides with existing SFN */
// 1620             if (res != FR_OK) break;
// 1621         }
// 1622         if (n == 100) return FR_DENIED;     /* Abort if too many collisions */
// 1623         if (res != FR_NO_FILE) return res;  /* Abort if the result is other than 'not collided' */
// 1624         fn[NS] = sn[NS];
// 1625         dj->lfn = lfn;
// 1626     }
// 1627 
// 1628     if (sn[NS] & NS_LFN)            /* When LFN is to be created, reserve an SFN + LFN entries. */
// 1629     {
// 1630         for (ne = 0; lfn[ne]; ne++) ;
// 1631         ne = (ne + 25) / 13;
// 1632     }
// 1633     else                        /* Otherwise reserve only an SFN entry. */
// 1634     {
// 1635         ne = 1;
// 1636     }
// 1637 
// 1638     /* Reserve contiguous entries */
// 1639     res = dir_sdi(dj, 0);
// 1640     if (res != FR_OK) return res;
// 1641     n = is = 0;
// 1642     do
// 1643     {
// 1644         res = move_window(dj->fs, dj->sect);
// 1645         if (res != FR_OK) break;
// 1646         c = *dj->dir;               /* Check the entry status */
// 1647         if (c == DDE || c == 0)     /* Is it a blank entry? */
// 1648         {
// 1649             if (n == 0) is = dj->index; /* First index of the contiguous entry */
// 1650             if (++n == ne) break;   /* A contiguous entry that required count is found */
// 1651         }
// 1652         else
// 1653         {
// 1654             n = 0;                  /* Not a blank entry. Restart to search */
// 1655         }
// 1656         res = dir_next(dj, 1);      /* Next entry with table stretch */
// 1657     }
// 1658     while (res == FR_OK);
// 1659 
// 1660     if (res == FR_OK && ne > 1)     /* Initialize LFN entry if needed */
// 1661     {
// 1662         res = dir_sdi(dj, is);
// 1663         if (res == FR_OK)
// 1664         {
// 1665             sum = sum_sfn(dj->fn);  /* Sum of the SFN tied to the LFN */
// 1666             ne--;
// 1667             do                      /* Store LFN entries in bottom first */
// 1668             {
// 1669                 res = move_window(dj->fs, dj->sect);
// 1670                 if (res != FR_OK) break;
// 1671                 fit_lfn(dj->lfn, dj->dir, (uint8)ne, sum);
// 1672                 dj->fs->wflag = 1;
// 1673                 res = dir_next(dj, 0);  /* Next entry */
// 1674             }
// 1675             while (res == FR_OK && --ne);
// 1676         }
// 1677     }
// 1678 
// 1679 #else   /* Non LFN configuration */
// 1680     res = dir_sdi(dj, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
        MOVS     R5,R0
// 1681     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_0
// 1682     {
// 1683         do      /* Find a blank entry for the SFN */
// 1684         {
// 1685             res = move_window(dj->fs, dj->sect);
??dir_register_1:
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
// 1686             if (res != FR_OK) break;
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_0
// 1687             c = *dj->dir;
??dir_register_2:
        LDR      R0,[R4, #+20]
        LDRB     R0,[R0, #+0]
        MOVS     R6,R0
// 1688             if (c == DDE || c == 0) break;  /* Is it a blank entry? */
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+229
        BEQ.N    ??dir_register_3
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??dir_register_4
??dir_register_3:
        B.N      ??dir_register_0
// 1689             res = dir_next(dj, 1);          /* Next entry with table stretch */
??dir_register_4:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall dir_next
        BL       dir_next
        MOVS     R5,R0
// 1690         }
// 1691         while (res == FR_OK);
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??dir_register_1
// 1692     }
// 1693 #endif
// 1694 
// 1695     if (res == FR_OK)       /* Initialize the SFN entry */
??dir_register_0:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_5
// 1696     {
// 1697         res = move_window(dj->fs, dj->sect);
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
// 1698         if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_5
// 1699         {
// 1700             dir = dj->dir;
        LDR      R0,[R4, #+20]
        MOVS     R7,R0
// 1701             mem_set(dir, 0, SZ_DIR);    /* Clean the entry */
        MOVS     R2,#+32
        MOVS     R1,#+0
        MOVS     R0,R7
          CFI FunCall mem_set
        BL       mem_set
// 1702             mem_cpy(dir, dj->fn, 11);   /* Put SFN */
        MOVS     R2,#+11
        LDR      R1,[R4, #+24]
        MOVS     R0,R7
          CFI FunCall mem_cpy
        BL       mem_cpy
// 1703 #if _USE_LFN
// 1704             dir[DIR_NTres] = *(dj->fn + NS) & (NS_BODY | NS_EXT);   /* Put NT flag */
// 1705 #endif
// 1706             dj->fs->wflag = 1;
        MOVS     R0,#+1
        LDR      R1,[R4, #+0]
        STRB     R0,[R1, #+4]
// 1707         }
// 1708     }
// 1709 
// 1710     return res;
??dir_register_5:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock15
// 1711 }
// 1712 #endif /* !_FS_READONLY */
// 1713 
// 1714 
// 1715 
// 1716 
// 1717 /*-----------------------------------------------------------------------*/
// 1718 /* Remove an object from the directory                                   */
// 1719 /*-----------------------------------------------------------------------*/
// 1720 #if !_FS_READONLY && !_FS_MINIMIZE

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function dir_remove
        THUMB
// 1721 static
// 1722 FRESULT dir_remove (    /* FR_OK: Successful, FR_DISK_ERR: A disk error */
// 1723     DIR *dj             /* Directory object pointing the entry to be removed */
// 1724 )
// 1725 {
dir_remove:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
// 1726     FRESULT res;
// 1727 #if _USE_LFN    /* LFN configuration */
// 1728     uint16 i;
// 1729 
// 1730     i = dj->index;  /* SFN index */
// 1731     res = dir_sdi(dj, (uint16)((dj->lfn_idx == 0xFFFF) ? i : dj->lfn_idx)); /* Goto the SFN or top of the LFN entries */
// 1732     if (res == FR_OK)
// 1733     {
// 1734         do
// 1735         {
// 1736             res = move_window(dj->fs, dj->sect);
// 1737             if (res != FR_OK) break;
// 1738             *dj->dir = DDE;         /* Mark the entry "deleted" */
// 1739             dj->fs->wflag = 1;
// 1740             if (dj->index >= i) break;  /* When reached SFN, all entries of the object has been deleted. */
// 1741             res = dir_next(dj, 0);      /* Next entry */
// 1742         }
// 1743         while (res == FR_OK);
// 1744         if (res == FR_NO_FILE) res = FR_INT_ERR;
// 1745     }
// 1746 
// 1747 #else           /* Non LFN configuration */
// 1748     res = dir_sdi(dj, dj->index);
        LDRH     R1,[R4, #+6]
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
        MOVS     R5,R0
// 1749     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_remove_0
// 1750     {
// 1751         res = move_window(dj->fs, dj->sect);
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
// 1752         if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_remove_0
// 1753         {
// 1754             *dj->dir = DDE;         /* Mark the entry "deleted" */
        MOVS     R0,#+229
        LDR      R1,[R4, #+20]
        STRB     R0,[R1, #+0]
// 1755             dj->fs->wflag = 1;
        MOVS     R0,#+1
        LDR      R1,[R4, #+0]
        STRB     R0,[R1, #+4]
// 1756         }
// 1757     }
// 1758 #endif
// 1759 
// 1760     return res;
??dir_remove_0:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock16
// 1761 }
// 1762 #endif /* !_FS_READONLY */
// 1763 
// 1764 
// 1765 
// 1766 
// 1767 /*-----------------------------------------------------------------------*/
// 1768 /* Pick a segment and create the object name in directory form           */
// 1769 /*-----------------------------------------------------------------------*/
// 1770 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function create_name
        THUMB
// 1771 static
// 1772 FRESULT create_name (
// 1773     DIR *dj,            /* Pointer to the directory object */
// 1774     const TCHAR **path  /* Pointer to pointer to the segment in the path string */
// 1775 )
// 1776 {
create_name:
        PUSH     {R0,R1,R4-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+44
        SUB      SP,SP,#+4
          CFI CFA R13+48
// 1777 #ifdef _EXCVT
// 1778     static const uint8 excvt[] = _EXCVT;    /* Upper conversion table for extended chars */
// 1779 #endif
// 1780 
// 1781 #if _USE_LFN    /* LFN configuration */
// 1782     uint8 b, cf;
// 1783     uint16 w, *lfn;
// 1784     uint32 i, ni, si, di;
// 1785     const TCHAR *p;
// 1786 
// 1787     /* Create LFN in Unicode */
// 1788     for (p = *path; *p == '/' || *p == '\\'; p++) ; /* Strip duplicated separator */
// 1789     lfn = dj->lfn;
// 1790     si = di = 0;
// 1791     for (;;)
// 1792     {
// 1793         w = p[si++];                    /* Get a character */
// 1794         if (w < ' ' || w == '/' || w == '\\') break;    /* Break on end of segment */
// 1795         if (di >= _MAX_LFN)             /* Reject too long name */
// 1796             return FR_INVALID_NAME;
// 1797 #if !_LFN_UNICODE
// 1798         w &= 0xFF;
// 1799         if (IsDBCS1(w))                 /* Check if it is a DBC 1st byte (always false on SBCS cfg) */
// 1800         {
// 1801             b = (uint8)p[si++];         /* Get 2nd byte */
// 1802             if (!IsDBCS2(b))
// 1803                 return FR_INVALID_NAME; /* Reject invalid sequence */
// 1804             w = (w << 8) + b;           /* Create a DBC */
// 1805         }
// 1806         w = ff_convert(w, 1);           /* Convert ANSI/OEM to Unicode */
// 1807         if (!w) return FR_INVALID_NAME; /* Reject invalid code */
// 1808 #endif
// 1809         if (w < 0x80 && chk_chr("\"*:<>\?|\x7F", w)) /* Reject illegal chars for LFN */
// 1810             return FR_INVALID_NAME;
// 1811         lfn[di++] = w;                  /* Store the Unicode char */
// 1812     }
// 1813     *path = &p[si];                     /* Return pointer to the next segment */
// 1814     cf = (w < ' ') ? NS_LAST : 0;       /* Set last segment flag if end of path */
// 1815 #if _FS_RPATH
// 1816     if ((di == 1 && lfn[di-1] == '.') || /* Is this a dot entry? */
// 1817             (di == 2 && lfn[di-1] == '.' && lfn[di-2] == '.'))
// 1818     {
// 1819         lfn[di] = 0;
// 1820         for (i = 0; i < 11; i++)
// 1821             dj->fn[i] = (i < di) ? '.' : ' ';
// 1822         dj->fn[i] = cf | NS_DOT;        /* This is a dot entry */
// 1823         return FR_OK;
// 1824     }
// 1825 #endif
// 1826     while (di)                          /* Strip trailing spaces and dots */
// 1827     {
// 1828         w = lfn[di-1];
// 1829         if (w != ' ' && w != '.') break;
// 1830         di--;
// 1831     }
// 1832     if (!di) return FR_INVALID_NAME;    /* Reject nul string */
// 1833 
// 1834     lfn[di] = 0;                        /* LFN is created */
// 1835 
// 1836     /* Create SFN in directory form */
// 1837     mem_set(dj->fn, ' ', 11);
// 1838     for (si = 0; lfn[si] == ' ' || lfn[si] == '.'; si++) ;  /* Strip leading spaces and dots */
// 1839     if (si) cf |= NS_LOSS | NS_LFN;
// 1840     while (di && lfn[di - 1] != '.') di--;  /* Find extension (di<=si: no extension) */
// 1841 
// 1842     b = i = 0;
// 1843     ni = 8;
// 1844     for (;;)
// 1845     {
// 1846         w = lfn[si++];                  /* Get an LFN char */
// 1847         if (!w) break;                  /* Break on end of the LFN */
// 1848         if (w == ' ' || (w == '.' && si != di))     /* Remove spaces and dots */
// 1849         {
// 1850             cf |= NS_LOSS | NS_LFN;
// 1851             continue;
// 1852         }
// 1853 
// 1854         if (i >= ni || si == di)        /* Extension or end of SFN */
// 1855         {
// 1856             if (ni == 11)               /* Long extension */
// 1857             {
// 1858                 cf |= NS_LOSS | NS_LFN;
// 1859                 break;
// 1860             }
// 1861             if (si != di) cf |= NS_LOSS | NS_LFN;   /* Out of 8.3 format */
// 1862             if (si > di) break;         /* No extension */
// 1863             si = di;
// 1864             i = 8;
// 1865             ni = 11;    /* Enter extension section */
// 1866             b <<= 2;
// 1867             continue;
// 1868         }
// 1869 
// 1870         if (w >= 0x80)                  /* Non ASCII char */
// 1871         {
// 1872 #ifdef _EXCVT
// 1873             w = ff_convert(w, 0);       /* Unicode -> OEM code */
// 1874             if (w) w = excvt[w - 0x80]; /* Convert extended char to upper (SBCS) */
// 1875 #else
// 1876             w = ff_convert(ff_wtoupper(w), 0);  /* Upper converted Unicode -> OEM code */
// 1877 #endif
// 1878             cf |= NS_LFN;               /* Force create LFN entry */
// 1879         }
// 1880 
// 1881         if (_DF1S && w >= 0x100)        /* Double byte char (always false on SBCS cfg) */
// 1882         {
// 1883             if (i >= ni - 1)
// 1884             {
// 1885                 cf |= NS_LOSS | NS_LFN;
// 1886                 i = ni;
// 1887                 continue;
// 1888             }
// 1889             dj->fn[i++] = (uint8)(w >> 8);
// 1890         }
// 1891         else                        /* Single byte char */
// 1892         {
// 1893             if (!w || chk_chr("+,;=[]", w))     /* Replace illegal chars for SFN */
// 1894             {
// 1895                 w = '_';
// 1896                 cf |= NS_LOSS | NS_LFN;/* Lossy conversion */
// 1897             }
// 1898             else
// 1899             {
// 1900                 if (IsUpper(w))         /* ASCII large capital */
// 1901                 {
// 1902                     b |= 2;
// 1903                 }
// 1904                 else
// 1905                 {
// 1906                     if (IsLower(w))     /* ASCII small capital */
// 1907                     {
// 1908                         b |= 1;
// 1909                         w -= 0x20;
// 1910                     }
// 1911                 }
// 1912             }
// 1913         }
// 1914         dj->fn[i++] = (uint8)w;
// 1915     }
// 1916 
// 1917     if (dj->fn[0] == DDE) dj->fn[0] = NDDE; /* If the first char collides with deleted mark, replace it with 0x05 */
// 1918 
// 1919     if (ni == 8) b <<= 2;
// 1920     if ((b & 0x0C) == 0x0C || (b & 0x03) == 0x03)   /* Create LFN entry when there are composite capitals */
// 1921         cf |= NS_LFN;
// 1922     if (!(cf & NS_LFN))                         /* When LFN is in 8.3 format without extended char, NT flags are created */
// 1923     {
// 1924         if ((b & 0x03) == 0x01) cf |= NS_EXT;   /* NT flag (Extension has only small capital) */
// 1925         if ((b & 0x0C) == 0x04) cf |= NS_BODY;  /* NT flag (Filename has only small capital) */
// 1926     }
// 1927 
// 1928     dj->fn[NS] = cf;    /* SFN is created */
// 1929 
// 1930     return FR_OK;
// 1931 
// 1932 
// 1933 #else   /* Non-LFN configuration */
// 1934     uint8 b, c, d, *sfn;
// 1935     uint32 ni, si, i;
// 1936     const char *p;
// 1937 
// 1938     /* Create file name in directory form */
// 1939     for (p = *path; *p == '/' || *p == '\\'; p++) ; /* Strip duplicated separator */
        LDR      R0,[SP, #+8]
        LDR      R0,[R0, #+0]
        MOV      R11,R0
??create_name_0:
        LDRSB    R0,[R11, #+0]
        CMP      R0,#+47
        BEQ.N    ??create_name_1
        LDRSB    R0,[R11, #+0]
        CMP      R0,#+92
        BNE.N    ??create_name_2
??create_name_1:
        ADDS     R11,R11,#+1
        B.N      ??create_name_0
// 1940     sfn = dj->fn;
??create_name_2:
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+24]
        MOVS     R7,R0
// 1941     mem_set(sfn, ' ', 11);
        MOVS     R2,#+11
        MOVS     R1,#+32
        MOVS     R0,R7
          CFI FunCall mem_set
        BL       mem_set
// 1942     si = i = b = 0;
        MOVS     R0,#+0
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOV      R10,R4
        MOV      R9,R10
// 1943     ni = 8;
        MOVS     R0,#+8
        MOV      R8,R0
// 1944 #if _FS_RPATH
// 1945     if (p[si] == '.')   /* Is this a dot entry? */
// 1946     {
// 1947         for (;;)
// 1948         {
// 1949             c = (uint8)p[si++];
// 1950             if (c != '.' || si >= 3) break;
// 1951             sfn[i++] = c;
// 1952         }
// 1953         if (c != '/' && c != '\\' && c > ' ') return FR_INVALID_NAME;
// 1954         *path = &p[si];                                 /* Return pointer to the next segment */
// 1955         sfn[NS] = (c <= ' ') ? NS_LAST | NS_DOT : NS_DOT;   /* Set last segment flag if end of path */
// 1956         return FR_OK;
// 1957     }
// 1958 #endif
// 1959     for (;;)
// 1960     {
// 1961         c = (uint8)p[si++];
??create_name_3:
        LDRB     R0,[R9, R11]
        MOVS     R5,R0
        ADDS     R9,R9,#+1
// 1962         if (c <= ' ' || c == '/' || c == '\\') break;   /* Break on end of segment */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+33
        BLT.N    ??create_name_4
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+47
        BEQ.N    ??create_name_4
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+92
        BNE.N    ??create_name_5
// 1963         if (c == '.' || i >= ni)
// 1964         {
// 1965             if (ni != 8 || c != '.') return FR_INVALID_NAME;
// 1966             i = 8;
// 1967             ni = 11;
// 1968             b <<= 2;
// 1969             continue;
// 1970         }
// 1971         if (c >= 0x80)                  /* Extended char? */
// 1972         {
// 1973             b |= 3;                     /* Eliminate NT flag */
// 1974 #ifdef _EXCVT
// 1975             c = excvt[c-0x80];          /* Upper conversion (SBCS) */
// 1976 #else
// 1977 #if !_DF1S  /* ASCII only cfg */
// 1978     return FR_INVALID_NAME;
// 1979 #endif
// 1980 #endif
// 1981         }
// 1982         if (IsDBCS1(c))                 /* Check if it is a DBC 1st byte (always false on SBCS cfg) */
// 1983         {
// 1984             d = (uint8)p[si++];         /* Get 2nd byte */
// 1985             if (!IsDBCS2(d) || i >= ni - 1) /* Reject invalid DBC */
// 1986                 return FR_INVALID_NAME;
// 1987             sfn[i++] = c;
// 1988             sfn[i++] = d;
// 1989         }
// 1990         else                        /* Single byte code */
// 1991         {
// 1992             if (chk_chr("\"*+,:;<=>\?[]|\x7F", c))  /* Reject illegal chrs for SFN */
// 1993                 return FR_INVALID_NAME;
// 1994             if (IsUpper(c))             /* ASCII large capital? */
// 1995             {
// 1996                 b |= 2;
// 1997             }
// 1998             else
// 1999             {
// 2000                 if (IsLower(c))         /* ASCII small capital? */
// 2001                 {
// 2002                     b |= 1;
// 2003                     c -= 0x20;
// 2004                 }
// 2005             }
// 2006             sfn[i++] = c;
// 2007         }
// 2008     }
// 2009     *path = &p[si];                     /* Return pointer to the next segment */
??create_name_4:
        ADDS     R0,R9,R11
        LDR      R1,[SP, #+8]
        STR      R0,[R1, #+0]
// 2010     c = (c <= ' ') ? NS_LAST : 0;       /* Set last segment flag if end of path */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+33
        BGE.N    ??create_name_6
        B.N      ??create_name_7
??create_name_5:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+46
        BEQ.N    ??create_name_8
        CMP      R10,R8
        BCC.N    ??create_name_9
??create_name_8:
        CMP      R8,#+8
        BNE.N    ??create_name_10
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+46
        BEQ.N    ??create_name_11
??create_name_10:
        MOVS     R0,#+6
        B.N      ??create_name_12
??create_name_11:
        MOVS     R0,#+8
        MOV      R10,R0
        MOVS     R0,#+11
        MOV      R8,R0
        LSLS     R4,R4,#+2
        B.N      ??create_name_3
??create_name_9:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+128
        BLT.N    ??create_name_13
        ORRS     R4,R4,#0x3
??create_name_13:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+129
        BLT.N    ??create_name_14
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+255
        BEQ.N    ??create_name_14
        LDRB     R0,[R9, R11]
        MOVS     R6,R0
        ADDS     R9,R9,#+1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+64
        BLT.N    ??create_name_15
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+127
        BLT.N    ??create_name_16
??create_name_15:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+128
        BLT.N    ??create_name_17
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+255
        BEQ.N    ??create_name_17
??create_name_16:
        SUBS     R0,R8,#+1
        CMP      R10,R0
        BCC.N    ??create_name_18
??create_name_17:
        MOVS     R0,#+6
        B.N      ??create_name_12
??create_name_18:
        STRB     R5,[R10, R7]
        ADDS     R10,R10,#+1
        STRB     R6,[R10, R7]
        ADDS     R10,R10,#+1
        B.N      ??create_name_3
??create_name_14:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,R5
        LDR.W    R0,??DataTable3
          CFI FunCall chk_chr
        BL       chk_chr
        CMP      R0,#+0
        BEQ.N    ??create_name_19
        MOVS     R0,#+6
        B.N      ??create_name_12
??create_name_19:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+65
        BLT.N    ??create_name_20
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+91
        BGE.N    ??create_name_20
        ORRS     R4,R4,#0x2
        B.N      ??create_name_21
??create_name_20:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+97
        BLT.N    ??create_name_21
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+123
        BGE.N    ??create_name_21
        ORRS     R4,R4,#0x1
        SUBS     R5,R5,#+32
??create_name_21:
        STRB     R5,[R10, R7]
        ADDS     R10,R10,#+1
        B.N      ??create_name_3
??create_name_7:
        MOVS     R5,#+4
        B.N      ??create_name_22
??create_name_6:
        MOVS     R5,#+0
// 2011 
// 2012     if (!i) return FR_INVALID_NAME;     /* Reject nul string */
??create_name_22:
        CMP      R10,#+0
        BNE.N    ??create_name_23
        MOVS     R0,#+6
        B.N      ??create_name_12
// 2013     if (sfn[0] == DDE) sfn[0] = NDDE;   /* When first char collides with DDE, replace it with 0x05 */
??create_name_23:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+229
        BNE.N    ??create_name_24
        MOVS     R0,#+5
        STRB     R0,[R7, #+0]
// 2014 
// 2015     if (ni == 8) b <<= 2;
??create_name_24:
        CMP      R8,#+8
        BNE.N    ??create_name_25
        LSLS     R4,R4,#+2
// 2016     if ((b & 0x03) == 0x01) c |= NS_EXT;    /* NT flag (Name extension has only small capital) */
??create_name_25:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ANDS     R0,R4,#0x3
        CMP      R0,#+1
        BNE.N    ??create_name_26
        ORRS     R5,R5,#0x10
// 2017     if ((b & 0x0C) == 0x04) c |= NS_BODY;   /* NT flag (Name body has only small capital) */
??create_name_26:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ANDS     R0,R4,#0xC
        CMP      R0,#+4
        BNE.N    ??create_name_27
        ORRS     R5,R5,#0x8
// 2018 
// 2019     sfn[NS] = c;        /* Store NT flag, File name is created */
??create_name_27:
        STRB     R5,[R7, #+11]
// 2020 
// 2021     return FR_OK;
        MOVS     R0,#+0
??create_name_12:
        POP      {R1-R11,PC}      ;; return
          CFI EndBlock cfiBlock17
// 2022 #endif
// 2023 }
// 2024 
// 2025 
// 2026 
// 2027 
// 2028 /*-----------------------------------------------------------------------*/
// 2029 /* Get file information from directory entry                             */
// 2030 /*-----------------------------------------------------------------------*/
// 2031 #if _FS_MINIMIZE <= 1

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function get_fileinfo
          CFI NoCalls
        THUMB
// 2032 static
// 2033 void get_fileinfo (     /* No return code */
// 2034     DIR *dj,            /* Pointer to the directory object */
// 2035     FILINFO *fno        /* Pointer to the file information to be filled */
// 2036 )
// 2037 {
get_fileinfo:
        PUSH     {R4-R7}
          CFI R7 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
// 2038     uint32 i;
// 2039     uint8 nt, *dir;
// 2040     TCHAR *p, c;
// 2041 
// 2042 
// 2043     p = fno->fname;
        ADDS     R7,R1,#+9
        MOVS     R5,R7
// 2044     if (dj->sect)
        LDR      R7,[R0, #+16]
        CMP      R7,#+0
        BEQ.N    ??get_fileinfo_0
// 2045     {
// 2046         dir = dj->dir;
        LDR      R7,[R0, #+20]
        MOVS     R3,R7
// 2047         nt = dir[DIR_NTres];        /* NT flag */
        LDRB     R7,[R3, #+12]
        MOVS     R2,R7
// 2048         for (i = 0; i < 8; i++)     /* Copy name body */
        MOVS     R7,#+0
        MOVS     R6,R7
??get_fileinfo_1:
        CMP      R6,#+8
        BCS.N    ??get_fileinfo_2
// 2049         {
// 2050             c = dir[i];
        LDRSB    R7,[R6, R3]
        MOVS     R4,R7
// 2051             if (c == ' ') break;
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+32
        BEQ.N    ??get_fileinfo_2
// 2052             if (c == NDDE) c = (TCHAR)DDE;
??get_fileinfo_3:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+5
        BNE.N    ??get_fileinfo_4
        MVNS     R7,#+26
        MOVS     R4,R7
// 2053             if (_USE_LFN && (nt & NS_BODY) && IsUpper(c)) c += 0x20;
// 2054 #if _LFN_UNICODE
// 2055             if (IsDBCS1(c) && i < 7 && IsDBCS2(dir[i+1]))
// 2056                 c = (c << 8) | dir[++i];
// 2057             c = ff_convert(c, 1);
// 2058             if (!c) c = '?';
// 2059 #endif
// 2060             *p++ = c;
??get_fileinfo_4:
        STRB     R4,[R5, #+0]
        ADDS     R5,R5,#+1
// 2061         }
        ADDS     R6,R6,#+1
        B.N      ??get_fileinfo_1
// 2062         if (dir[8] != ' ')          /* Copy name extension */
??get_fileinfo_2:
        LDRB     R7,[R3, #+8]
        CMP      R7,#+32
        BEQ.N    ??get_fileinfo_5
// 2063         {
// 2064             *p++ = '.';
        MOVS     R7,#+46
        STRB     R7,[R5, #+0]
        ADDS     R5,R5,#+1
// 2065             for (i = 8; i < 11; i++)
        MOVS     R7,#+8
        MOVS     R6,R7
??get_fileinfo_6:
        CMP      R6,#+11
        BCS.N    ??get_fileinfo_5
// 2066             {
// 2067                 c = dir[i];
        LDRSB    R7,[R6, R3]
        MOVS     R4,R7
// 2068                 if (c == ' ') break;
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+32
        BEQ.N    ??get_fileinfo_5
// 2069                 if (_USE_LFN && (nt & NS_EXT) && IsUpper(c)) c += 0x20;
// 2070 #if _LFN_UNICODE
// 2071                 if (IsDBCS1(c) && i < 10 && IsDBCS2(dir[i+1]))
// 2072                     c = (c << 8) | dir[++i];
// 2073                 c = ff_convert(c, 1);
// 2074                 if (!c) c = '?';
// 2075 #endif
// 2076                 *p++ = c;
??get_fileinfo_7:
        STRB     R4,[R5, #+0]
        ADDS     R5,R5,#+1
// 2077             }
        ADDS     R6,R6,#+1
        B.N      ??get_fileinfo_6
// 2078         }
// 2079         fno->fattrib = dir[DIR_Attr];               /* Attribute */
??get_fileinfo_5:
        LDRB     R7,[R3, #+11]
        STRB     R7,[R1, #+8]
// 2080         fno->fsize = LD_DWORD(dir + DIR_FileSize);  /* Size */
        LDRB     R7,[R3, #+31]
        LDRB     R12,[R3, #+30]
        LSLS     R12,R12,#+16
        ORRS     R7,R12,R7, LSL #+24
        LDRB     R12,[R3, #+29]
        ORRS     R7,R7,R12, LSL #+8
        LDRB     R12,[R3, #+28]
        ORRS     R7,R12,R7
        STR      R7,[R1, #+0]
// 2081         fno->fdate = LD_WORD(dir + DIR_WrtDate);        /* Date */
        LDRB     R7,[R3, #+25]
        LDRB     R12,[R3, #+24]
        ORRS     R7,R12,R7, LSL #+8
        STRH     R7,[R1, #+4]
// 2082         fno->ftime = LD_WORD(dir + DIR_WrtTime);        /* Time */
        LDRB     R7,[R3, #+23]
        LDRB     R12,[R3, #+22]
        ORRS     R7,R12,R7, LSL #+8
        STRH     R7,[R1, #+6]
// 2083     }
// 2084     *p = 0;     /* Terminate SFN str by a \0 */
??get_fileinfo_0:
        MOVS     R7,#+0
        STRB     R7,[R5, #+0]
// 2085 
// 2086 #if _USE_LFN
// 2087     if (fno->lfname && fno->lfsize)
// 2088     {
// 2089         TCHAR *tp = fno->lfname;
// 2090         uint16 w, *lfn;
// 2091 
// 2092         i = 0;
// 2093         if (dj->sect && dj->lfn_idx != 0xFFFF)  /* Get LFN if available */
// 2094         {
// 2095             lfn = dj->lfn;
// 2096             while ((w = *lfn++) != 0)           /* Get an LFN char */
// 2097             {
// 2098 #if !_LFN_UNICODE
// 2099                 w = ff_convert(w, 0);           /* Unicode -> OEM conversion */
// 2100                 if (!w)
// 2101                 {
// 2102                     i = 0;    /* Could not convert, no LFN */
// 2103                     break;
// 2104                 }
// 2105                 if (_DF1S && w >= 0x100)        /* Put 1st byte if it is a DBC (always false on SBCS cfg) */
// 2106                     tp[i++] = (TCHAR)(w >> 8);
// 2107 #endif
// 2108                 if (i >= fno->lfsize - 1)
// 2109                 {
// 2110                     i = 0;    /* Buffer overflow, no LFN */
// 2111                     break;
// 2112                 }
// 2113                 tp[i++] = (TCHAR)w;
// 2114             }
// 2115         }
// 2116         tp[i] = 0;  /* Terminate the LFN str by a \0 */
// 2117     }
// 2118 #endif
// 2119 }
        POP      {R4-R7}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock18
// 2120 #endif /* _FS_MINIMIZE <= 1 */
// 2121 
// 2122 
// 2123 
// 2124 
// 2125 /*-----------------------------------------------------------------------*/
// 2126 /* Follow a file path                                                    */
// 2127 /*-----------------------------------------------------------------------*/
// 2128 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function follow_path
        THUMB
// 2129 static
// 2130 FRESULT follow_path (   /* FR_OK(0): successful, !=0: error code */
// 2131     DIR *dj,            /* Directory object to return last directory and found object */
// 2132     const TCHAR *path   /* Full-path string to find a file or directory */
// 2133 )
// 2134 {
follow_path:
        PUSH     {R1,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
// 2135     FRESULT res;
// 2136     uint8 *dir, ns;
// 2137 
// 2138 
// 2139 #if _FS_RPATH
// 2140     if (*path == '/' || *path == '\\')   /* There is a heading separator */
// 2141     {
// 2142         path++;
// 2143         dj->sclust = 0;     /* Strip it and start from the root dir */
// 2144     }
// 2145     else                            /* No heading separator */
// 2146     {
// 2147         dj->sclust = dj->fs->cdir;  /* Start from the current dir */
// 2148     }
// 2149 #else
// 2150     if (*path == '/' || *path == '\\')  /* Strip heading separator if exist */
        LDR      R0,[SP, #+0]
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+47
        BEQ.N    ??follow_path_0
        LDR      R0,[SP, #+0]
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+92
        BNE.N    ??follow_path_1
// 2151         path++;
??follow_path_0:
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
// 2152     dj->sclust = 0;                     /* Start from the root dir */
??follow_path_1:
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
// 2153 #endif
// 2154 
// 2155     if ((uint32)*path < ' ')            /* Nul path means the start directory itself */
        LDR      R0,[SP, #+0]
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+32
        BCS.N    ??follow_path_2
// 2156     {
// 2157         res = dir_sdi(dj, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
        MOVS     R5,R0
// 2158         dj->dir = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+20]
        B.N      ??follow_path_3
// 2159 
// 2160     }
// 2161     else                            /* Follow path */
// 2162     {
// 2163         for (;;)
// 2164         {
// 2165             res = create_name(dj, &path);   /* Get a segment */
??follow_path_2:
        ADD      R1,SP,#+0
        MOVS     R0,R4
          CFI FunCall create_name
        BL       create_name
        MOVS     R5,R0
// 2166             if (res != FR_OK) break;
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??follow_path_3
// 2167             res = dir_find(dj);             /* Find it */
??follow_path_4:
        MOVS     R0,R4
          CFI FunCall dir_find
        BL       dir_find
        MOVS     R5,R0
// 2168             ns = *(dj->fn + NS);
        LDR      R0,[R4, #+24]
        LDRB     R0,[R0, #+11]
        MOVS     R7,R0
// 2169             if (res != FR_OK)               /* Failed to find the object */
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??follow_path_5
// 2170             {
// 2171                 if (res != FR_NO_FILE) break;   /* Abort if any hard error occured */
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BNE.N    ??follow_path_3
// 2172                 /* Object not found */
// 2173                 if (_FS_RPATH && (ns & NS_DOT))     /* If dot entry is not exit */
// 2174                 {
// 2175                     dj->sclust = 0;
// 2176                     dj->dir = 0;    /* It is the root dir */
// 2177                     res = FR_OK;
// 2178                     if (!(ns & NS_LAST)) continue;
// 2179                 }
// 2180                 else                            /* Could not find the object */
// 2181                 {
// 2182                     if (!(ns & NS_LAST)) res = FR_NO_PATH;
??follow_path_6:
        LSLS     R0,R7,#+29
        BMI.N    ??follow_path_7
        MOVS     R0,#+5
        MOVS     R5,R0
// 2183                 }
// 2184                 break;
??follow_path_7:
        B.N      ??follow_path_3
// 2185             }
// 2186             if (ns & NS_LAST) break;            /* Last segment match. Function completed. */
??follow_path_5:
        LSLS     R0,R7,#+29
        BMI.N    ??follow_path_3
// 2187             dir = dj->dir;                      /* There is next segment. Follow the sub directory */
??follow_path_8:
        LDR      R0,[R4, #+20]
        MOVS     R6,R0
// 2188             if (!(dir[DIR_Attr] & AM_DIR))      /* Cannot follow because it is a file */
        LDRB     R0,[R6, #+11]
        LSLS     R0,R0,#+27
        BMI.N    ??follow_path_9
// 2189             {
// 2190                 res = FR_NO_PATH;
        MOVS     R0,#+5
        MOVS     R5,R0
// 2191                 break;
        B.N      ??follow_path_3
// 2192             }
// 2193             dj->sclust = LD_CLUST(dir);
??follow_path_9:
        LDRB     R0,[R6, #+21]
        LDRB     R1,[R6, #+20]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDRB     R1,[R6, #+27]
        LDRB     R2,[R6, #+26]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R1,R0, LSL #+16
        STR      R0,[R4, #+8]
        B.N      ??follow_path_2
// 2194         }
// 2195     }
// 2196 
// 2197     return res;
??follow_path_3:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock19
// 2198 }
// 2199 
// 2200 
// 2201 
// 2202 
// 2203 /*-----------------------------------------------------------------------*/
// 2204 /* Load a sector and check if it is an FAT Volume Boot Record            */
// 2205 /*-----------------------------------------------------------------------*/
// 2206 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function check_fs
        THUMB
// 2207 static
// 2208 uint8 check_fs (    /* 0:FAT-VBR, 1:Valid BR but not FAT, 2:Not a BR, 3:Disk error */
// 2209     FATFS *fs,  /* File system object */
// 2210     uint32 sect /* Sector# (lba) to check if it is an FAT boot record or not */
// 2211 )
// 2212 {
check_fs:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
// 2213     if (disk_read(fs->drv, fs->win, sect, 1) != RES_OK) /* Load boot record */
        MOVS     R3,#+1
        MOVS     R2,R5
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??check_fs_0
// 2214         return 3;
        MOVS     R0,#+3
        B.N      ??check_fs_1
// 2215     if (LD_WORD(&fs->win[BS_55AA]) != 0xAA55)       /* Check record signature (always placed at offset 510 even if the sector size is >512) */
??check_fs_0:
        LDRB     R0,[R4, #+559]
        LDRB     R1,[R4, #+558]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVW     R1,#+43605
        CMP      R0,R1
        BEQ.N    ??check_fs_2
// 2216         return 2;
        MOVS     R0,#+2
        B.N      ??check_fs_1
// 2217 
// 2218     if ((LD_DWORD(&fs->win[BS_FilSysType]) & 0xFFFFFF) == 0x544146) /* Check "FAT" string */
??check_fs_2:
        LDRB     R0,[R4, #+104]
        LDRB     R1,[R4, #+103]
        LSLS     R1,R1,#+8
        ORRS     R0,R1,R0, LSL #+16
        LDRB     R1,[R4, #+102]
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable3_1  ;; 0x544146
        CMP      R0,R1
        BNE.N    ??check_fs_3
// 2219         return 0;
        MOVS     R0,#+0
        B.N      ??check_fs_1
// 2220     if ((LD_DWORD(&fs->win[BS_FilSysType32]) & 0xFFFFFF) == 0x544146)
??check_fs_3:
        LDRB     R0,[R4, #+132]
        LDRB     R1,[R4, #+131]
        LSLS     R1,R1,#+8
        ORRS     R0,R1,R0, LSL #+16
        LDRB     R1,[R4, #+130]
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable3_1  ;; 0x544146
        CMP      R0,R1
        BNE.N    ??check_fs_4
// 2221         return 0;
        MOVS     R0,#+0
        B.N      ??check_fs_1
// 2222 
// 2223     return 1;
??check_fs_4:
        MOVS     R0,#+1
??check_fs_1:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock20
// 2224 }
// 2225 
// 2226 
// 2227 
// 2228 
// 2229 /*-----------------------------------------------------------------------*/
// 2230 /* Check if the file system object is valid or not                       */
// 2231 /*-----------------------------------------------------------------------*/
// 2232 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function chk_mounted
        THUMB
// 2233 static
// 2234 FRESULT chk_mounted (   /* FR_OK(0): successful, !=0: any error occurred */
// 2235     const TCHAR **path, /* Pointer to pointer to the path name (drive number) */
// 2236     FATFS **rfs,        /* Pointer to pointer to the found file system object */
// 2237     uint8 chk_wp            /* !=0: Check media write protection for write access */
// 2238 )
// 2239 {
chk_mounted:
        PUSH     {R0,R1,R4-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+44
        SUB      SP,SP,#+28
          CFI CFA R13+72
        MOV      R11,R2
// 2240     uint8 fmt, b, pi, *tbl;
// 2241     uint32 vol;
// 2242     DSTATUS stat;
// 2243     uint32 bsect, fasize, tsect, sysect, nclst, szbfat;
// 2244     uint16 nrsv;
// 2245     const TCHAR *p = *path;
        LDR      R0,[SP, #+28]
        LDR      R9,[R0, #+0]
// 2246     FATFS *fs;
// 2247 
// 2248     /* Get logical drive number from the path name */
// 2249     vol = p[0] - '0';                   /* Is there a drive number? */
        LDRSB    R0,[R9, #+0]
        SUBS     R0,R0,#+48
        STR      R0,[SP, #+8]
// 2250     if (vol <= 9 && p[1] == ':')        /* Found a drive number, get and strip it */
        LDR      R0,[SP, #+8]
        CMP      R0,#+10
        BCS.N    ??chk_mounted_0
        LDRSB    R0,[R9, #+1]
        CMP      R0,#+58
        BNE.N    ??chk_mounted_0
// 2251     {
// 2252         p += 2;
        ADDS     R9,R9,#+2
// 2253         *path = p;              /* Return pointer to the path name */
        LDR      R0,[SP, #+28]
        STR      R9,[R0, #+0]
        B.N      ??chk_mounted_1
// 2254     }
// 2255     else                            /* No drive number is given */
// 2256     {
// 2257 #if _FS_RPATH
// 2258         vol = CurrVol;                  /* Use current drive */
// 2259 #else
// 2260         vol = 0;                        /* Use drive 0 */
??chk_mounted_0:
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
// 2261 #endif
// 2262     }
// 2263 
// 2264     /* Check if the file system object is valid or not */
// 2265     if (vol >= _VOLUMES)                /* Is the drive number valid? */
??chk_mounted_1:
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BEQ.N    ??chk_mounted_2
// 2266         return FR_INVALID_DRIVE;
        MOVS     R0,#+11
        B.N      ??chk_mounted_3
// 2267     *rfs = fs = FatFs[vol];             /* Return pointer to the corresponding file system object */
??chk_mounted_2:
        LDR.W    R0,??DataTable3_2
        LDR      R1,[SP, #+8]
        LDR      R0,[R0, R1, LSL #+2]
        MOV      R10,R0
        LDR      R0,[SP, #+32]
        STR      R10,[R0, #+0]
// 2268     if (!fs) return FR_NOT_ENABLED;     /* Is the file system object available? */
        CMP      R10,#+0
        BNE.N    ??chk_mounted_4
        MOVS     R0,#+12
        B.N      ??chk_mounted_3
// 2269 
// 2270     ENTER_FF(fs);                       /* Lock file system */
// 2271 
// 2272     if (fs->fs_type)                    /* If the logical drive has been mounted */
??chk_mounted_4:
        LDRB     R0,[R10, #+0]
        CMP      R0,#+0
        BEQ.N    ??chk_mounted_5
// 2273     {
// 2274         stat = disk_status(fs->drv);
        LDRB     R0,[R10, #+1]
          CFI FunCall disk_status
        BL       disk_status
        STRB     R0,[SP, #+0]
// 2275         if (!(stat & STA_NOINIT))       /* and the physical drive is kept initialized (has not been changed), */
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+31
        BMI.N    ??chk_mounted_5
// 2276         {
// 2277             if (!_FS_READONLY && chk_wp && (stat & STA_PROTECT))    /* Check write protection if needed */
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+0
        BEQ.N    ??chk_mounted_6
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??chk_mounted_6
// 2278                 return FR_WRITE_PROTECTED;
        MOVS     R0,#+10
        B.N      ??chk_mounted_3
// 2279             return FR_OK;               /* The file system object is valid */
??chk_mounted_6:
        MOVS     R0,#+0
        B.N      ??chk_mounted_3
// 2280         }
// 2281     }
// 2282 
// 2283     /* The file system object is not valid. */
// 2284     /* Following code attempts to mount the volume. (analyze BPB and initialize the fs object) */
// 2285 
// 2286     fs->fs_type = 0;                    /* Clear the file system object */
??chk_mounted_5:
        MOVS     R0,#+0
        STRB     R0,[R10, #+0]
// 2287     fs->drv = LD2PD(vol);               /* Bind the logical drive and a physical drive */
        LDR      R0,[SP, #+8]
        STRB     R0,[R10, #+1]
// 2288     stat = disk_initialize(fs->drv);    /* Initialize low level disk I/O layer */
        LDRB     R0,[R10, #+1]
          CFI FunCall disk_initialize
        BL       disk_initialize
        STRB     R0,[SP, #+0]
// 2289     if (stat & STA_NOINIT)              /* Check if the initialization succeeded */
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??chk_mounted_7
// 2290         return FR_NOT_READY;            /* Failed to initialize due to no media or hard error */
        MOVS     R0,#+3
        B.N      ??chk_mounted_3
// 2291     if (!_FS_READONLY && chk_wp && (stat & STA_PROTECT))    /* Check disk write protection if needed */
??chk_mounted_7:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+0
        BEQ.N    ??chk_mounted_8
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??chk_mounted_8
// 2292         return FR_WRITE_PROTECTED;
        MOVS     R0,#+10
        B.N      ??chk_mounted_3
// 2293 #if _MAX_SS != 512                      /* Get disk sector size (variable sector size cfg only) */
// 2294     if (disk_ioctl(fs->drv, GET_SECTOR_SIZE, &fs->ssize) != RES_OK)
// 2295         return FR_DISK_ERR;
// 2296 #endif
// 2297     /* Search FAT partition on the drive. Supports only generic partitionings, FDISK and SFD. */
// 2298     fmt = check_fs(fs, bsect = 0);      /* Load sector 0 and check if it is an FAT-VBR (in SFD) */
??chk_mounted_8:
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        LDR      R1,[SP, #+4]
        MOV      R0,R10
          CFI FunCall check_fs
        BL       check_fs
        MOVS     R4,R0
// 2299     if (LD2PT(vol) && !fmt) fmt = 1;    /* Force non-SFD if the volume is forced partition */
// 2300     if (fmt == 1)                       /* Not an FAT-VBR, the physical drive can be partitioned */
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??chk_mounted_9
// 2301     {
// 2302         /* Check the partition listed in the partition table */
// 2303         pi = LD2PT(vol);
        MOVS     R0,#+0
        MOVS     R6,R0
// 2304         if (pi) pi--;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??chk_mounted_10
        SUBS     R6,R6,#+1
// 2305         tbl = &fs->win[MBR_Table + pi * SZ_PTE];/* Partition table */
??chk_mounted_10:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADDS     R0,R10,R6, LSL #+4
        ADDS     R0,R0,#+494
        STR      R0,[SP, #+12]
// 2306         if (tbl[4])                         /* Is the partition existing? */
        LDR      R0,[SP, #+12]
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BEQ.N    ??chk_mounted_9
// 2307         {
// 2308             bsect = LD_DWORD(&tbl[8]);      /* Partition offset in LBA */
        LDR      R0,[SP, #+12]
        LDRB     R0,[R0, #+11]
        LDR      R1,[SP, #+12]
        LDRB     R1,[R1, #+10]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDR      R1,[SP, #+12]
        LDRB     R1,[R1, #+9]
        ORRS     R0,R0,R1, LSL #+8
        LDR      R1,[SP, #+12]
        LDRB     R1,[R1, #+8]
        ORRS     R0,R1,R0
        STR      R0,[SP, #+4]
// 2309             fmt = check_fs(fs, bsect);      /* Check the partition */
        LDR      R1,[SP, #+4]
        MOV      R0,R10
          CFI FunCall check_fs
        BL       check_fs
        MOVS     R4,R0
// 2310         }
// 2311     }
// 2312     if (fmt == 3) return FR_DISK_ERR;
??chk_mounted_9:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BNE.N    ??chk_mounted_11
        MOVS     R0,#+1
        B.N      ??chk_mounted_3
// 2313     if (fmt) return FR_NO_FILESYSTEM;       /* No FAT volume is found */
??chk_mounted_11:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??chk_mounted_12
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2314 
// 2315     /* An FAT volume is found. Following code initializes the file system object */
// 2316 
// 2317     if (LD_WORD(fs->win + BPB_BytsPerSec) != SS(fs))        /* (BPB_BytsPerSec must be equal to the physical sector size) */
??chk_mounted_12:
        LDRB     R0,[R10, #+60]
        LDRB     R1,[R10, #+59]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+512
        BEQ.N    ??chk_mounted_13
// 2318         return FR_NO_FILESYSTEM;
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2319 
// 2320     fasize = LD_WORD(fs->win + BPB_FATSz16);                /* Number of sectors per FAT */
??chk_mounted_13:
        LDRB     R0,[R10, #+71]
        LDRB     R1,[R10, #+70]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R7,R0
// 2321     if (!fasize) fasize = LD_DWORD(fs->win + BPB_FATSz32);
        CMP      R7,#+0
        BNE.N    ??chk_mounted_14
        LDRB     R0,[R10, #+87]
        LDRB     R1,[R10, #+86]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R10, #+85]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R10, #+84]
        ORRS     R0,R1,R0
        MOVS     R7,R0
// 2322     fs->fsize = fasize;
??chk_mounted_14:
        STR      R7,[R10, #+28]
// 2323 
// 2324     fs->n_fats = b = fs->win[BPB_NumFATs];              /* Number of FAT copies */
        LDRB     R0,[R10, #+64]
        MOVS     R5,R0
        STRB     R5,[R10, #+3]
// 2325     if (b != 1 && b != 2) return FR_NO_FILESYSTEM;      /* (Must be 1 or 2) */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BEQ.N    ??chk_mounted_15
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+2
        BEQ.N    ??chk_mounted_15
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2326     fasize *= b;                                        /* Number of sectors for FAT area */
??chk_mounted_15:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MULS     R7,R5,R7
// 2327 
// 2328     fs->csize = b = fs->win[BPB_SecPerClus];            /* Number of sectors per cluster */
        LDRB     R0,[R10, #+61]
        MOVS     R5,R0
        STRB     R5,[R10, #+2]
// 2329     if (!b || (b & (b - 1))) return FR_NO_FILESYSTEM;   /* (Must be power of 2) */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??chk_mounted_16
        SUBS     R1,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        TST      R0,R1
        BEQ.N    ??chk_mounted_17
??chk_mounted_16:
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2330 
// 2331     fs->n_rootdir = LD_WORD(fs->win + BPB_RootEntCnt);  /* Number of root directory entries */
??chk_mounted_17:
        LDRB     R0,[R10, #+66]
        LDRB     R1,[R10, #+65]
        ORRS     R0,R1,R0, LSL #+8
        STRH     R0,[R10, #+8]
// 2332     if (fs->n_rootdir % (SS(fs) / SZ_DIR)) return FR_NO_FILESYSTEM; /* (BPB_RootEntCnt must be sector aligned) */
        LDRH     R0,[R10, #+8]
        MOVS     R1,#+16
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BEQ.N    ??chk_mounted_18
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2333 
// 2334     tsect = LD_WORD(fs->win + BPB_TotSec16);                /* Number of sectors on the volume */
??chk_mounted_18:
        LDRB     R0,[R10, #+68]
        LDRB     R1,[R10, #+67]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[SP, #+20]
// 2335     if (!tsect) tsect = LD_DWORD(fs->win + BPB_TotSec32);
        LDR      R0,[SP, #+20]
        CMP      R0,#+0
        BNE.N    ??chk_mounted_19
        LDRB     R0,[R10, #+83]
        LDRB     R1,[R10, #+82]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R10, #+81]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R10, #+80]
        ORRS     R0,R1,R0
        STR      R0,[SP, #+20]
// 2336 
// 2337     nrsv = LD_WORD(fs->win + BPB_RsvdSecCnt);               /* Number of reserved sectors */
??chk_mounted_19:
        LDRB     R0,[R10, #+63]
        LDRB     R1,[R10, #+62]
        ORRS     R0,R1,R0, LSL #+8
        STRH     R0,[SP, #+2]
// 2338     if (!nrsv) return FR_NO_FILESYSTEM;                 /* (BPB_RsvdSecCnt must not be 0) */
        LDRH     R0,[SP, #+2]
        CMP      R0,#+0
        BNE.N    ??chk_mounted_20
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2339 
// 2340     /* Determine the FAT sub type */
// 2341     sysect = nrsv + fasize + fs->n_rootdir / (SS(fs) / SZ_DIR); /* RSV+FAT+DIR */
??chk_mounted_20:
        LDRH     R0,[SP, #+2]
        UXTAH    R0,R7,R0
        LDRH     R1,[R10, #+8]
        ADDS     R0,R0,R1, LSR #+4
        STR      R0,[SP, #+24]
// 2342     if (tsect < sysect) return FR_NO_FILESYSTEM;        /* (Invalid volume size) */
        LDR      R0,[SP, #+20]
        LDR      R1,[SP, #+24]
        CMP      R0,R1
        BCS.N    ??chk_mounted_21
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2343     nclst = (tsect - sysect) / fs->csize;               /* Number of clusters */
??chk_mounted_21:
        LDR      R0,[SP, #+20]
        LDR      R1,[SP, #+24]
        SUBS     R0,R0,R1
        LDRB     R1,[R10, #+2]
        UDIV     R0,R0,R1
        STR      R0,[SP, #+16]
// 2344     if (!nclst) return FR_NO_FILESYSTEM;                /* (Invalid volume size) */
        LDR      R0,[SP, #+16]
        CMP      R0,#+0
        BNE.N    ??chk_mounted_22
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2345     fmt = FS_FAT12;
??chk_mounted_22:
        MOVS     R0,#+1
        MOVS     R4,R0
// 2346     if (nclst >= MIN_FAT16) fmt = FS_FAT16;
        LDR      R0,[SP, #+16]
        MOVW     R1,#+4086
        CMP      R0,R1
        BCC.N    ??chk_mounted_23
        MOVS     R0,#+2
        MOVS     R4,R0
// 2347     if (nclst >= MIN_FAT32) fmt = FS_FAT32;
??chk_mounted_23:
        LDR      R0,[SP, #+16]
        MOVW     R1,#+65526
        CMP      R0,R1
        BCC.N    ??chk_mounted_24
        MOVS     R0,#+3
        MOVS     R4,R0
// 2348 
// 2349     /* Boundaries and Limits */
// 2350     fs->n_fatent = nclst + 2;                           /* Number of FAT entries */
??chk_mounted_24:
        LDR      R0,[SP, #+16]
        ADDS     R0,R0,#+2
        STR      R0,[R10, #+24]
// 2351     fs->database = bsect + sysect;                      /* Data start sector */
        LDR      R0,[SP, #+4]
        LDR      R1,[SP, #+24]
        ADDS     R0,R1,R0
        STR      R0,[R10, #+40]
// 2352     fs->fatbase = bsect + nrsv;                         /* FAT start sector */
        LDR      R0,[SP, #+4]
        LDRH     R1,[SP, #+2]
        UXTAH    R0,R0,R1
        STR      R0,[R10, #+32]
// 2353     if (fmt == FS_FAT32)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BNE.N    ??chk_mounted_25
// 2354     {
// 2355         if (fs->n_rootdir) return FR_NO_FILESYSTEM;     /* (BPB_RootEntCnt must be 0) */
        LDRH     R0,[R10, #+8]
        CMP      R0,#+0
        BEQ.N    ??chk_mounted_26
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2356         fs->dirbase = LD_DWORD(fs->win + BPB_RootClus); /* Root directory start cluster */
??chk_mounted_26:
        LDRB     R0,[R10, #+95]
        LDRB     R1,[R10, #+94]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R10, #+93]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R10, #+92]
        ORRS     R0,R1,R0
        STR      R0,[R10, #+36]
// 2357         szbfat = fs->n_fatent * 4;                      /* (Required FAT size) */
        LDR      R0,[R10, #+24]
        LSLS     R0,R0,#+2
        MOV      R8,R0
        B.N      ??chk_mounted_27
// 2358     }
// 2359     else
// 2360     {
// 2361         if (!fs->n_rootdir) return FR_NO_FILESYSTEM;    /* (BPB_RootEntCnt must not be 0) */
??chk_mounted_25:
        LDRH     R0,[R10, #+8]
        CMP      R0,#+0
        BNE.N    ??chk_mounted_28
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2362         fs->dirbase = fs->fatbase + fasize;             /* Root directory start sector */
??chk_mounted_28:
        LDR      R0,[R10, #+32]
        ADDS     R0,R7,R0
        STR      R0,[R10, #+36]
// 2363         szbfat = (fmt == FS_FAT16) ?                    /* (Required FAT size) */
// 2364                  fs->n_fatent * 2 : fs->n_fatent * 3 / 2 + (fs->n_fatent & 1);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BNE.N    ??chk_mounted_29
        LDR      R0,[R10, #+24]
        LSLS     R8,R0,#+1
        B.N      ??chk_mounted_27
??chk_mounted_29:
        LDR      R0,[R10, #+24]
        MOVS     R1,#+3
        MULS     R0,R1,R0
        LDRB     R1,[R10, #+24]
        ANDS     R1,R1,#0x1
        ADDS     R8,R1,R0, LSR #+1
// 2365     }
// 2366     if (fs->fsize < (szbfat + (SS(fs) - 1)) / SS(fs))   /* (BPB_FATSz must not be less than required) */
??chk_mounted_27:
        LDR      R0,[R10, #+28]
        ADDW     R1,R8,#+511
        CMP      R0,R1, LSR #+9
        BCS.N    ??chk_mounted_30
// 2367         return FR_NO_FILESYSTEM;
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2368 
// 2369 #if !_FS_READONLY
// 2370     /* Initialize cluster allocation information */
// 2371     fs->free_clust = 0xFFFFFFFF;
??chk_mounted_30:
        MOVS     R0,#-1
        STR      R0,[R10, #+16]
// 2372     fs->last_clust = 0;
        MOVS     R0,#+0
        STR      R0,[R10, #+12]
// 2373 
// 2374     /* Get fsinfo if available */
// 2375     if (fmt == FS_FAT32)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BNE.N    ??chk_mounted_31
// 2376     {
// 2377         fs->fsi_flag = 0;
        MOVS     R0,#+0
        STRB     R0,[R10, #+5]
// 2378         fs->fsi_sector = bsect + LD_WORD(fs->win + BPB_FSInfo);
        LDR      R0,[SP, #+4]
        LDRB     R1,[R10, #+97]
        LDRB     R2,[R10, #+96]
        ORRS     R1,R2,R1, LSL #+8
        UXTAH    R0,R0,R1
        STR      R0,[R10, #+20]
// 2379         if (disk_read(fs->drv, fs->win, fs->fsi_sector, 1) == RES_OK &&
// 2380                 LD_WORD(fs->win + BS_55AA) == 0xAA55 &&
// 2381                 LD_DWORD(fs->win + FSI_LeadSig) == 0x41615252 &&
// 2382                 LD_DWORD(fs->win + FSI_StrucSig) == 0x61417272)
        MOVS     R3,#+1
        LDR      R2,[R10, #+20]
        ADDS     R1,R10,#+48
        LDRB     R0,[R10, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BNE.N    ??chk_mounted_31
        LDRB     R0,[R10, #+559]
        LDRB     R1,[R10, #+558]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVW     R1,#+43605
        CMP      R0,R1
        BNE.N    ??chk_mounted_31
        LDRB     R0,[R10, #+51]
        LDRB     R1,[R10, #+50]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R10, #+49]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R10, #+48]
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable3_3  ;; 0x41615252
        CMP      R0,R1
        BNE.N    ??chk_mounted_31
        LDRB     R0,[R10, #+535]
        LDRB     R1,[R10, #+534]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R10, #+533]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R10, #+532]
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable3_4  ;; 0x61417272
        CMP      R0,R1
        BNE.N    ??chk_mounted_31
// 2383         {
// 2384             fs->last_clust = LD_DWORD(fs->win + FSI_Nxt_Free);
        LDRB     R0,[R10, #+543]
        LDRB     R1,[R10, #+542]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R10, #+541]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R10, #+540]
        ORRS     R0,R1,R0
        STR      R0,[R10, #+12]
// 2385             fs->free_clust = LD_DWORD(fs->win + FSI_Free_Count);
        LDRB     R0,[R10, #+539]
        LDRB     R1,[R10, #+538]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R10, #+537]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R10, #+536]
        ORRS     R0,R1,R0
        STR      R0,[R10, #+16]
// 2386         }
// 2387     }
// 2388 #endif
// 2389     fs->fs_type = fmt;      /* FAT sub-type */
??chk_mounted_31:
        STRB     R4,[R10, #+0]
// 2390     fs->id = ++Fsid;        /* File system mount ID */
        LDR.N    R0,??DataTable3_5
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable3_5
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable3_5
        LDRH     R0,[R0, #+0]
        STRH     R0,[R10, #+6]
// 2391     fs->winsect = 0;        /* Invalidate sector cache */
        MOVS     R0,#+0
        STR      R0,[R10, #+44]
// 2392     fs->wflag = 0;
        MOVS     R0,#+0
        STRB     R0,[R10, #+4]
// 2393 #if _FS_RPATH
// 2394     fs->cdir = 0;           /* Current directory (root dir) */
// 2395 #endif
// 2396 #if _FS_SHARE               /* Clear file lock semaphores */
// 2397     clear_lock(fs);
// 2398 #endif
// 2399 
// 2400     return FR_OK;
        MOVS     R0,#+0
??chk_mounted_3:
        ADD      SP,SP,#+36
          CFI CFA R13+36
        POP      {R4-R11,PC}      ;; return
          CFI EndBlock cfiBlock21
// 2401 }
// 2402 
// 2403 
// 2404 
// 2405 
// 2406 /*-----------------------------------------------------------------------*/
// 2407 /* Check if the file/dir object is valid or not                          */
// 2408 /*-----------------------------------------------------------------------*/
// 2409 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function validate
        THUMB
// 2410 static
// 2411 FRESULT validate (  /* FR_OK(0): The object is valid, !=0: Invalid */
// 2412     FATFS *fs,      /* Pointer to the file system object */
// 2413     uint16 id           /* Member id of the target object to be checked */
// 2414 )
// 2415 {
validate:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
// 2416     if (!fs || !fs->fs_type || fs->id != id)
        CMP      R4,#+0
        BEQ.N    ??validate_0
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??validate_0
        LDRH     R0,[R4, #+6]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R0,R5
        BEQ.N    ??validate_1
// 2417         return FR_INVALID_OBJECT;
??validate_0:
        MOVS     R0,#+9
        B.N      ??validate_2
// 2418 
// 2419     ENTER_FF(fs);       /* Lock file system */
// 2420 
// 2421     if (disk_status(fs->drv) & STA_NOINIT)
??validate_1:
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_status
        BL       disk_status
        LSLS     R0,R0,#+31
        BPL.N    ??validate_3
// 2422         return FR_NOT_READY;
        MOVS     R0,#+3
        B.N      ??validate_2
// 2423 
// 2424     return FR_OK;
??validate_3:
        MOVS     R0,#+0
??validate_2:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock22
// 2425 }
// 2426 
// 2427 
// 2428 
// 2429 
// 2430 /*--------------------------------------------------------------------------
// 2431 
// 2432    Public Functions
// 2433 
// 2434 --------------------------------------------------------------------------*/
// 2435 
// 2436 
// 2437 
// 2438 /*-----------------------------------------------------------------------*/
// 2439 /* Mount/Unmount a Logical Drive                                         */
// 2440 /*-----------------------------------------------------------------------*/
// 2441 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function f_mount
          CFI NoCalls
        THUMB
// 2442 FRESULT f_mount (
// 2443     uint8 vol,      /* Logical drive number to be mounted/unmounted */
// 2444     FATFS *fs       /* Pointer to new file system object (NULL for unmount)*/
// 2445 )
// 2446 {
f_mount:
        MOVS     R2,R0
// 2447     FATFS *rfs;
// 2448 
// 2449 
// 2450     if (vol >= _VOLUMES)        /* Check if the drive number is valid */
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??f_mount_0
// 2451         return FR_INVALID_DRIVE;
        MOVS     R0,#+11
        B.N      ??f_mount_1
// 2452     rfs = FatFs[vol];           /* Get current fs object */
??f_mount_0:
        LDR.N    R0,??DataTable3_2
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR      R0,[R0, R2, LSL #+2]
        MOVS     R3,R0
// 2453 
// 2454     if (rfs)
        CMP      R3,#+0
        BEQ.N    ??f_mount_2
// 2455     {
// 2456 #if _FS_SHARE
// 2457         clear_lock(rfs);
// 2458 #endif
// 2459 #if _FS_REENTRANT               /* Discard sync object of the current volume */
// 2460         if (!ff_del_syncobj(rfs->sobj)) return FR_INT_ERR;
// 2461 #endif
// 2462         rfs->fs_type = 0;       /* Clear old fs object */
        MOVS     R0,#+0
        STRB     R0,[R3, #+0]
// 2463     }
// 2464 
// 2465     if (fs)
??f_mount_2:
        CMP      R1,#+0
        BEQ.N    ??f_mount_3
// 2466     {
// 2467         fs->fs_type = 0;        /* Clear new fs object */
        MOVS     R0,#+0
        STRB     R0,[R1, #+0]
// 2468 #if _FS_REENTRANT               /* Create sync object for the new volume */
// 2469         if (!ff_cre_syncobj(vol, &fs->sobj)) return FR_INT_ERR;
// 2470 #endif
// 2471     }
// 2472     FatFs[vol] = fs;            /* Register new fs object */
??f_mount_3:
        LDR.N    R0,??DataTable3_2
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STR      R1,[R0, R2, LSL #+2]
// 2473 
// 2474     return FR_OK;
        MOVS     R0,#+0
??f_mount_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock23
// 2475 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x544146

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     FatFs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x41615252

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x61417272

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     Fsid
// 2476 
// 2477 
// 2478 
// 2479 
// 2480 /*-----------------------------------------------------------------------*/
// 2481 /* Open or Create a File                                                 */
// 2482 /*-----------------------------------------------------------------------*/
// 2483 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function f_open
        THUMB
// 2484 FRESULT f_open (
// 2485     FIL *fp,            /* Pointer to the blank file object */
// 2486     const TCHAR *path,  /* Pointer to the file name */
// 2487     uint8 mode          /* Access mode and file open mode flags */
// 2488 )
// 2489 {
f_open:
        PUSH     {R1,R4-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        SUB      SP,SP,#+40
          CFI CFA R13+72
        MOVS     R4,R0
        MOVS     R7,R2
// 2490     FRESULT res;
// 2491     DIR dj;
// 2492     uint8 *dir;
// 2493     DEF_NAMEBUF;
// 2494 
// 2495 
// 2496     fp->fs = 0;         /* Clear file object */
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
// 2497 
// 2498 #if !_FS_READONLY
// 2499     mode &= FA_READ | FA_WRITE | FA_CREATE_ALWAYS | FA_OPEN_ALWAYS | FA_CREATE_NEW;
        ANDS     R7,R7,#0x1F
// 2500     res = chk_mounted(&path, &dj.fs, (uint8)(mode & ~FA_READ));
        ANDS     R2,R7,#0xFE
        ADD      R1,SP,#+0
        ADD      R0,SP,#+40
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOVS     R5,R0
// 2501 #else
// 2502     mode &= FA_READ;
// 2503     res = chk_mounted(&path, &dj.fs, 0);
// 2504 #endif
// 2505     INIT_BUF(dj);
        ADD      R0,SP,#+28
        STR      R0,[SP, #+24]
// 2506     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_0
// 2507         res = follow_path(&dj, path);   /* Follow the file path */
        LDR      R1,[SP, #+40]
        ADD      R0,SP,#+0
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 2508     dir = dj.dir;
??f_open_0:
        LDR      R0,[SP, #+20]
        MOVS     R6,R0
// 2509 
// 2510 #if !_FS_READONLY   /* R/W configuration */
// 2511     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_1
// 2512     {
// 2513         if (!dir)   /* Current dir itself */
        CMP      R6,#+0
        BNE.N    ??f_open_1
// 2514             res = FR_INVALID_NAME;
        MOVS     R0,#+6
        MOVS     R5,R0
// 2515 #if _FS_SHARE
// 2516         else
// 2517             res = chk_lock(&dj, (mode & ~FA_READ) ? 1 : 0);
// 2518 #endif
// 2519     }
// 2520     /* Create or Open a file */
// 2521     if (mode & (FA_CREATE_ALWAYS | FA_OPEN_ALWAYS | FA_CREATE_NEW))
??f_open_1:
        MOVS     R0,#+28
        TST      R7,R0
        BEQ.N    ??f_open_2
// 2522     {
// 2523         uint32 dw, cl;
// 2524 
// 2525         if (res != FR_OK)                   /* 没有文件，需要创建新的 No file, create new */
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??f_open_3
// 2526         {
// 2527             if (res == FR_NO_FILE)          /* There is no file to open, create a new entry */
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BNE.N    ??f_open_4
// 2528 #if _FS_SHARE
// 2529                 res = enq_lock() ? dir_register(&dj) : FR_TOO_MANY_OPEN_FILES;
// 2530 #else
// 2531                 res = dir_register(&dj);
        ADD      R0,SP,#+0
          CFI FunCall dir_register
        BL       dir_register
        MOVS     R5,R0
// 2532 #endif
// 2533             mode |= FA_CREATE_ALWAYS;       /* File is created */
??f_open_4:
        ORRS     R7,R7,#0x8
// 2534             dir = dj.dir;                   /* New entry */
        LDR      R0,[SP, #+20]
        MOVS     R6,R0
        B.N      ??f_open_5
// 2535         }
// 2536         else                                /* Any object is already existing */
// 2537         {
// 2538             if (dir[DIR_Attr] & (AM_RDO | AM_DIR))      /* Cannot overwrite it (R/O or DIR) */
??f_open_3:
        LDRB     R0,[R6, #+11]
        MOVS     R1,#+17
        TST      R0,R1
        BEQ.N    ??f_open_6
// 2539             {
// 2540                 res = FR_DENIED;
        MOVS     R0,#+7
        MOVS     R5,R0
        B.N      ??f_open_5
// 2541             }
// 2542             else
// 2543             {
// 2544                 if (mode & FA_CREATE_NEW)   /* 已经有了，不能创建新的 Cannot create as new file */
??f_open_6:
        LSLS     R0,R7,#+29
        BPL.N    ??f_open_5
// 2545                     res = FR_EXIST;
        MOVS     R0,#+8
        MOVS     R5,R0
// 2546             }
// 2547         }
// 2548         if (res == FR_OK && (mode & FA_CREATE_ALWAYS))      /* Truncate it if overwrite mode */
??f_open_5:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_7
        LSLS     R0,R7,#+28
        BPL.N    ??f_open_7
// 2549         {
// 2550             dw = get_fattime();                 /* Created time */
          CFI FunCall get_fattime
        BL       get_fattime
        MOV      R8,R0
// 2551             ST_DWORD(dir + DIR_CrtTime, dw);
        STRB     R8,[R6, #+14]
        MOV      R0,R8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R6, #+15]
        LSRS     R0,R8,#+16
        STRB     R0,[R6, #+16]
        LSRS     R0,R8,#+24
        STRB     R0,[R6, #+17]
// 2552             dir[DIR_Attr] = 0;                  /* Reset attribute */
        MOVS     R0,#+0
        STRB     R0,[R6, #+11]
// 2553             ST_DWORD(dir + DIR_FileSize, 0);        /* size = 0 */
        MOVS     R0,#+0
        STRB     R0,[R6, #+28]
        MOVS     R0,#+0
        STRB     R0,[R6, #+29]
        MOVS     R0,#+0
        STRB     R0,[R6, #+30]
        MOVS     R0,#+0
        STRB     R0,[R6, #+31]
// 2554             cl = LD_CLUST(dir);                 /* Get start cluster */
        LDRB     R0,[R6, #+21]
        LDRB     R1,[R6, #+20]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDRB     R1,[R6, #+27]
        LDRB     R2,[R6, #+26]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R1,R0, LSL #+16
        MOV      R9,R0
// 2555             ST_CLUST(dir, 0);                   /* cluster = 0 */
        MOVS     R0,#+0
        STRB     R0,[R6, #+26]
        MOVS     R0,#+0
        STRB     R0,[R6, #+27]
        MOVS     R0,#+0
        STRB     R0,[R6, #+20]
        MOVS     R0,#+0
        STRB     R0,[R6, #+21]
// 2556             dj.fs->wflag = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+0]
        STRB     R0,[R1, #+4]
// 2557             if (cl)                             /* Remove the cluster chain if exist */
        CMP      R9,#+0
        BEQ.N    ??f_open_7
// 2558             {
// 2559                 dw = dj.fs->winsect;
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+44]
        MOV      R8,R0
// 2560                 res = remove_chain(dj.fs, cl);
        MOV      R1,R9
        LDR      R0,[SP, #+0]
          CFI FunCall remove_chain
        BL       remove_chain
        MOVS     R5,R0
// 2561                 if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_7
// 2562                 {
// 2563                     dj.fs->last_clust = cl - 1; /* Reuse the cluster hole */
        SUBS     R0,R9,#+1
        LDR      R1,[SP, #+0]
        STR      R0,[R1, #+12]
// 2564                     res = move_window(dj.fs, dw);
        MOV      R1,R8
        LDR      R0,[SP, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
        B.N      ??f_open_7
// 2565                 }
// 2566             }
// 2567         }
// 2568     }
// 2569     else    /* Open an existing file */
// 2570     {
// 2571         if (res == FR_OK)                       /* Follow succeeded */
??f_open_2:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_7
// 2572         {
// 2573             if (dir[DIR_Attr] & AM_DIR)         /* It is a directory */
        LDRB     R0,[R6, #+11]
        LSLS     R0,R0,#+27
        BPL.N    ??f_open_8
// 2574             {
// 2575                 res = FR_NO_FILE;
        MOVS     R0,#+4
        MOVS     R5,R0
        B.N      ??f_open_7
// 2576             }
// 2577             else
// 2578             {
// 2579                 if ((mode & FA_WRITE) && (dir[DIR_Attr] & AM_RDO)) /* R/O violation */
??f_open_8:
        LSLS     R0,R7,#+30
        BPL.N    ??f_open_7
        LDRB     R0,[R6, #+11]
        LSLS     R0,R0,#+31
        BPL.N    ??f_open_7
// 2580                     res = FR_DENIED;
        MOVS     R0,#+7
        MOVS     R5,R0
// 2581             }
// 2582         }
// 2583     }
// 2584     if (res == FR_OK)
??f_open_7:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_9
// 2585     {
// 2586         if (mode & FA_CREATE_ALWAYS)            /* Set file change flag if created or overwritten */
        LSLS     R0,R7,#+28
        BPL.N    ??f_open_10
// 2587             mode |= FA__WRITTEN;
        ORRS     R7,R7,#0x20
// 2588         fp->dir_sect = dj.fs->winsect;          /* Pointer to the directory entry */
??f_open_10:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+44]
        STR      R0,[R4, #+28]
// 2589         fp->dir_ptr = dir;
        STR      R6,[R4, #+32]
// 2590 #if _FS_SHARE
// 2591         fp->lockid = inc_lock(&dj, (mode & ~FA_READ) ? 1 : 0);
// 2592         if (!fp->lockid) res = FR_INT_ERR;
// 2593 #endif
// 2594     }
// 2595 
// 2596 #else               /* R/O configuration */
// 2597     if (res == FR_OK)                   /* Follow succeeded */
// 2598     {
// 2599         if (!dir)                       /* Current dir itself */
// 2600         {
// 2601             res = FR_INVALID_NAME;
// 2602         }
// 2603         else
// 2604         {
// 2605             if (dir[DIR_Attr] & AM_DIR) /* It is a directory */
// 2606                 res = FR_NO_FILE;
// 2607         }
// 2608     }
// 2609 #endif
// 2610     FREE_BUF();
// 2611 
// 2612     if (res == FR_OK)
??f_open_9:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_11
// 2613     {
// 2614         fp->flag = mode;                    /* File access mode */
        STRB     R7,[R4, #+6]
// 2615         fp->sclust = LD_CLUST(dir);         /* File start cluster */
        LDRB     R0,[R6, #+21]
        LDRB     R1,[R6, #+20]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDRB     R1,[R6, #+27]
        LDRB     R2,[R6, #+26]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R1,R0, LSL #+16
        STR      R0,[R4, #+16]
// 2616         fp->fsize = LD_DWORD(dir + DIR_FileSize);   /* File size */
        LDRB     R0,[R6, #+31]
        LDRB     R1,[R6, #+30]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R6, #+29]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R6, #+28]
        ORRS     R0,R1,R0
        STR      R0,[R4, #+12]
// 2617         fp->fptr = 0;                       /* File pointer */
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
// 2618         fp->dsect = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+24]
// 2619 #if _USE_FASTSEEK
// 2620         fp->cltbl = 0;                      /* Normal seek mode */
// 2621 #endif
// 2622         fp->fs = dj.fs;
        LDR      R0,[SP, #+0]
        STR      R0,[R4, #+0]
// 2623         fp->id = dj.fs->id; /* Validate file object */
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+6]
        STRH     R0,[R4, #+4]
// 2624     }
// 2625 
// 2626     LEAVE_FF(dj.fs, res);
??f_open_11:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+44
          CFI CFA R13+28
        POP      {R4-R9,PC}       ;; return
          CFI EndBlock cfiBlock24
// 2627 }
// 2628 
// 2629 
// 2630 
// 2631 
// 2632 /*-----------------------------------------------------------------------*/
// 2633 /* Read File                                                             */
// 2634 /*-----------------------------------------------------------------------*/
// 2635 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function f_read
        THUMB
// 2636 FRESULT f_read (
// 2637     FIL *fp,        /* Pointer to the file object */
// 2638     void *buff,     /* Pointer to data buffer */
// 2639     uint32 btr,     /* Number of bytes to read */
// 2640     uint32 *br      /* Pointer to number of bytes read */
// 2641 )
// 2642 {
f_read:
        PUSH     {R1,R4-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+40
        SUB      SP,SP,#+16
          CFI CFA R13+56
        MOVS     R4,R0
        MOVS     R5,R2
        MOVS     R6,R3
// 2643     FRESULT res;
// 2644     uint32 clst, sect, remain;
// 2645     uint32 rcnt, cc;
// 2646     uint8 csect, *rbuff = buff;
        LDR      R11,[SP, #+16]
// 2647 
// 2648 
// 2649     *br = 0;    /* Initialize byte counter */
        MOVS     R0,#+0
        STR      R0,[R6, #+0]
// 2650 
// 2651     res = validate(fp->fs, fp->id);             /* Check validity */
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
          CFI FunCall validate
        BL       validate
        STRB     R0,[SP, #+8]
// 2652     if (res != FR_OK) LEAVE_FF(fp->fs, res);
        LDRSB    R0,[SP, #+8]
        CMP      R0,#+0
        BEQ.N    ??f_read_0
        LDRSB    R0,[SP, #+8]
        B.N      ??f_read_1
// 2653     if (fp->flag & FA__ERROR)                   /* Aborted file? */
??f_read_0:
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+24
        BPL.N    ??f_read_2
// 2654         LEAVE_FF(fp->fs, FR_INT_ERR);
        MOVS     R0,#+2
        B.N      ??f_read_1
// 2655     if (!(fp->flag & FA_READ))                  /* Check access mode */
??f_read_2:
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+31
        BMI.N    ??f_read_3
// 2656         LEAVE_FF(fp->fs, FR_DENIED);
        MOVS     R0,#+7
        B.N      ??f_read_1
// 2657     remain = fp->fsize - fp->fptr;
??f_read_3:
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+8]
        SUBS     R0,R0,R1
        STR      R0,[SP, #+4]
// 2658     if (btr > remain) btr = (uint32)remain;     /* Truncate btr by remaining bytes */
        LDR      R0,[SP, #+4]
        CMP      R0,R5
        BCS.N    ??f_read_4
        LDR      R0,[SP, #+4]
        MOVS     R5,R0
// 2659 
// 2660     for ( ;  btr;                               /* Repeat until all data read */
??f_read_4:
        CMP      R5,#+0
        BEQ.W    ??f_read_5
// 2661             rbuff += rcnt, fp->fptr += rcnt, *br += rcnt, btr -= rcnt)
// 2662     {
// 2663         if ((fp->fptr % SS(fp->fs)) == 0)       /* On the sector boundary? */
        LDR      R0,[R4, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BNE.W    ??f_read_6
// 2664         {
// 2665             csect = (uint8)(fp->fptr / SS(fp->fs) & (fp->fs->csize - 1));   /* Sector offset in the cluster */
        LDR      R0,[R4, #+8]
        LSRS     R0,R0,#+9
        LDR      R1,[R4, #+0]
        LDRB     R1,[R1, #+2]
        SUBS     R1,R1,#+1
        ANDS     R0,R1,R0
        MOV      R10,R0
// 2666             if (!csect)                         /* On the cluster boundary? */
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BNE.N    ??f_read_7
// 2667             {
// 2668                 if (fp->fptr == 0)              /* On the top of the file? */
        LDR      R0,[R4, #+8]
        CMP      R0,#+0
        BNE.N    ??f_read_8
// 2669                 {
// 2670                     clst = fp->sclust;          /* Follow from the origin */
        LDR      R0,[R4, #+16]
        STR      R0,[SP, #+0]
        B.N      ??f_read_9
// 2671                 }
// 2672                 else                        /* Middle or end of the file */
// 2673                 {
// 2674 #if _USE_FASTSEEK
// 2675                     if (fp->cltbl)
// 2676                         clst = clmt_clust(fp, fp->fptr);    /* Get cluster# from the CLMT */
// 2677                     else
// 2678 #endif
// 2679                         clst = get_fat(fp->fs, fp->clust);  /* Follow cluster chain on the FAT */
??f_read_8:
        LDR      R1,[R4, #+20]
        LDR      R0,[R4, #+0]
          CFI FunCall get_fat
        BL       get_fat
        STR      R0,[SP, #+0]
// 2680                 }
// 2681                 if (clst < 2) ABORT(fp->fs, FR_INT_ERR);
??f_read_9:
        LDR      R0,[SP, #+0]
        CMP      R0,#+2
        BCS.N    ??f_read_10
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+2
        B.N      ??f_read_1
// 2682                 if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
??f_read_10:
        LDR      R0,[SP, #+0]
        CMN      R0,#+1
        BNE.N    ??f_read_11
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_read_1
// 2683                 fp->clust = clst;               /* Update current cluster */
??f_read_11:
        LDR      R0,[SP, #+0]
        STR      R0,[R4, #+20]
// 2684             }
// 2685             sect = clust2sect(fp->fs, fp->clust);   /* Get current sector */
??f_read_7:
        LDR      R1,[R4, #+20]
        LDR      R0,[R4, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        MOVS     R7,R0
// 2686             if (!sect) ABORT(fp->fs, FR_INT_ERR);
        CMP      R7,#+0
        BNE.N    ??f_read_12
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+2
        B.N      ??f_read_1
// 2687             sect += csect;
??f_read_12:
        UXTAB    R7,R7,R10
// 2688             cc = btr / SS(fp->fs);              /* When remaining bytes >= sector size, */
        LSRS     R0,R5,#+9
        MOV      R9,R0
// 2689             if (cc)                             /* Read maximum contiguous sectors directly */
        CMP      R9,#+0
        BEQ.N    ??f_read_13
// 2690             {
// 2691                 if (csect + cc > fp->fs->csize) /* Clip at cluster boundary */
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+2]
        UXTAB    R1,R9,R10
        CMP      R0,R1
        BCS.N    ??f_read_14
// 2692                     cc = fp->fs->csize - csect;
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+2]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        SUBS     R0,R0,R10
        MOV      R9,R0
// 2693                 if (disk_read(fp->fs->drv, rbuff, sect, (uint8)cc) != RES_OK)
??f_read_14:
        MOV      R3,R9
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,R7
        MOV      R1,R11
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??f_read_15
// 2694                     ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_read_1
// 2695 #if !_FS_READONLY && _FS_MINIMIZE <= 2          /* Replace one of the read sectors with cached data if it contains a dirty sector */
// 2696 #if _FS_TINY
// 2697                 if (fp->fs->wflag && fp->fs->winsect - sect < cc)
// 2698                     mem_cpy(rbuff + ((fp->fs->winsect - sect) * SS(fp->fs)), fp->fs->win, SS(fp->fs));
// 2699 #else
// 2700                 if ((fp->flag & FA__DIRTY) && fp->dsect - sect < cc)
??f_read_15:
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_read_16
        LDR      R0,[R4, #+24]
        SUBS     R0,R0,R7
        CMP      R0,R9
        BCS.N    ??f_read_16
// 2701                     mem_cpy(rbuff + ((fp->dsect - sect) * SS(fp->fs)), fp->buf, SS(fp->fs));
        MOV      R2,#+512
        ADDS     R1,R4,#+36
        LDR      R0,[R4, #+24]
        SUBS     R0,R0,R7
        MOV      R3,#+512
        MLA      R0,R3,R0,R11
          CFI FunCall mem_cpy
        BL       mem_cpy
// 2702 #endif
// 2703 #endif
// 2704                 rcnt = SS(fp->fs) * cc;         /* Number of bytes transferred */
??f_read_16:
        MOV      R0,#+512
        MUL      R0,R0,R9
        MOV      R8,R0
// 2705                 continue;
        B.N      ??f_read_17
// 2706             }
// 2707 #if !_FS_TINY
// 2708             if (fp->dsect != sect)              /* Load data sector if not in cache */
??f_read_13:
        LDR      R0,[R4, #+24]
        CMP      R0,R7
        BEQ.N    ??f_read_18
// 2709             {
// 2710 #if !_FS_READONLY
// 2711                 if (fp->flag & FA__DIRTY)       /* Write-back dirty sector cache */
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_read_19
// 2712                 {
// 2713                     if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
        MOVS     R3,#+1
        LDR      R2,[R4, #+24]
        ADDS     R1,R4,#+36
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_read_20
// 2714                         ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_read_1
// 2715                     fp->flag &= ~FA__DIRTY;
??f_read_20:
        LDRB     R0,[R4, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R4, #+6]
// 2716                 }
// 2717 #endif
// 2718                 if (disk_read(fp->fs->drv, fp->buf, sect, 1) != RES_OK) /* Fill sector cache */
??f_read_19:
        MOVS     R3,#+1
        MOVS     R2,R7
        ADDS     R1,R4,#+36
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??f_read_18
// 2719                     ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_read_1
// 2720             }
// 2721 #endif
// 2722             fp->dsect = sect;
??f_read_18:
        STR      R7,[R4, #+24]
// 2723         }
// 2724         rcnt = SS(fp->fs) - (fp->fptr % SS(fp->fs));    /* Get partial sector data from sector buffer */
??f_read_6:
        LDR      R0,[R4, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        RSBS     R0,R2,#+512
        MOV      R8,R0
// 2725         if (rcnt > btr) rcnt = btr;
        CMP      R5,R8
        BCS.N    ??f_read_21
        MOV      R8,R5
// 2726 #if _FS_TINY
// 2727         if (move_window(fp->fs, fp->dsect))     /* Move sector window */
// 2728             ABORT(fp->fs, FR_DISK_ERR);
// 2729         mem_cpy(rbuff, &fp->fs->win[fp->fptr % SS(fp->fs)], rcnt);  /* Pick partial sector */
// 2730 #else
// 2731         mem_cpy(rbuff, &fp->buf[fp->fptr % SS(fp->fs)], rcnt);  /* Pick partial sector */
??f_read_21:
        MOV      R2,R8
        LDR      R0,[R4, #+8]
        MOV      R1,#+512
        UDIV     R3,R0,R1
        MLS      R3,R3,R1,R0
        ADDS     R0,R3,R4
        ADDS     R1,R0,#+36
        MOV      R0,R11
          CFI FunCall mem_cpy
        BL       mem_cpy
// 2732 #endif
// 2733     }
??f_read_17:
        ADDS     R11,R8,R11
        LDR      R0,[R4, #+8]
        ADDS     R0,R8,R0
        STR      R0,[R4, #+8]
        LDR      R0,[R6, #+0]
        ADDS     R0,R8,R0
        STR      R0,[R6, #+0]
        SUBS     R5,R5,R8
        B.N      ??f_read_4
// 2734 
// 2735     LEAVE_FF(fp->fs, FR_OK);
??f_read_5:
        MOVS     R0,#+0
??f_read_1:
        ADD      SP,SP,#+20
          CFI CFA R13+36
        POP      {R4-R11,PC}      ;; return
          CFI EndBlock cfiBlock25
// 2736 }
// 2737 
// 2738 
// 2739 
// 2740 
// 2741 #if !_FS_READONLY
// 2742 /*-----------------------------------------------------------------------*/
// 2743 /* Write File                                                            */
// 2744 /*-----------------------------------------------------------------------*/
// 2745 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock26 Using cfiCommon0
          CFI Function f_write
        THUMB
// 2746 FRESULT f_write (
// 2747     FIL *fp,            /* Pointer to the file object */
// 2748     const void *buff,   /* Pointer to the data to be written */
// 2749     uint32 btw,         /* Number of bytes to write */
// 2750     uint32 *bw          /* Pointer to number of bytes written */
// 2751 )
// 2752 {
f_write:
        PUSH     {R1,R4-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+40
        SUB      SP,SP,#+8
          CFI CFA R13+48
        MOVS     R4,R0
        MOVS     R5,R2
        MOVS     R6,R3
// 2753     FRESULT res;
// 2754     uint32 clst, sect;
// 2755     uint32 wcnt, cc;
// 2756     const uint8 *wbuff = buff;
        LDR      R11,[SP, #+8]
// 2757     uint8 csect;
// 2758 
// 2759 
// 2760     *bw = 0;    /* Initialize byte counter */
        MOVS     R0,#+0
        STR      R0,[R6, #+0]
// 2761 
// 2762     res = validate(fp->fs, fp->id);         /* Check validity */
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
          CFI FunCall validate
        BL       validate
        STRB     R0,[SP, #+1]
// 2763     if (res != FR_OK) LEAVE_FF(fp->fs, res);
        LDRSB    R0,[SP, #+1]
        CMP      R0,#+0
        BEQ.N    ??f_write_0
        LDRSB    R0,[SP, #+1]
        B.N      ??f_write_1
// 2764     if (fp->flag & FA__ERROR)               /* Aborted file? */
??f_write_0:
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+24
        BPL.N    ??f_write_2
// 2765         LEAVE_FF(fp->fs, FR_INT_ERR);
        MOVS     R0,#+2
        B.N      ??f_write_1
// 2766     if (!(fp->flag & FA_WRITE))             /* Check access mode */
??f_write_2:
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+30
        BMI.N    ??f_write_3
// 2767         LEAVE_FF(fp->fs, FR_DENIED);
        MOVS     R0,#+7
        B.N      ??f_write_1
// 2768     if ((uint32)(fp->fsize + btw) < fp->fsize) btw = 0; /* File size cannot reach 4GB */
??f_write_3:
        LDR      R0,[R4, #+12]
        ADDS     R0,R5,R0
        LDR      R1,[R4, #+12]
        CMP      R0,R1
        BCS.N    ??f_write_4
        MOVS     R0,#+0
        MOVS     R5,R0
// 2769 
// 2770     for ( ;  btw;                           /* Repeat until all data written */
??f_write_4:
        CMP      R5,#+0
        BEQ.W    ??f_write_5
// 2771             wbuff += wcnt, fp->fptr += wcnt, *bw += wcnt, btw -= wcnt)
// 2772     {
// 2773         if ((fp->fptr % SS(fp->fs)) == 0)   /* On the sector boundary? */
        LDR      R0,[R4, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BNE.W    ??f_write_6
// 2774         {
// 2775             csect = (uint8)(fp->fptr / SS(fp->fs) & (fp->fs->csize - 1));   /* Sector offset in the cluster */
        LDR      R0,[R4, #+8]
        LSRS     R0,R0,#+9
        LDR      R1,[R4, #+0]
        LDRB     R1,[R1, #+2]
        SUBS     R1,R1,#+1
        ANDS     R0,R1,R0
        STRB     R0,[SP, #+0]
// 2776             if (!csect)                     /* On the cluster boundary? */
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??f_write_7
// 2777             {
// 2778                 if (fp->fptr == 0)          /* On the top of the file? */
        LDR      R0,[R4, #+8]
        CMP      R0,#+0
        BNE.N    ??f_write_8
// 2779                 {
// 2780                     clst = fp->sclust;      /* Follow from the origin */
        LDR      R0,[R4, #+16]
        MOVS     R7,R0
// 2781                     if (clst == 0)          /* When no cluster is allocated, */
        CMP      R7,#+0
        BNE.N    ??f_write_9
// 2782                         fp->sclust = clst = create_chain(fp->fs, 0);    /* Create a new cluster chain */
        MOVS     R1,#+0
        LDR      R0,[R4, #+0]
          CFI FunCall create_chain
        BL       create_chain
        MOVS     R7,R0
        STR      R0,[R4, #+16]
        B.N      ??f_write_9
// 2783                 }
// 2784                 else                    /* Middle or end of the file */
// 2785                 {
// 2786 #if _USE_FASTSEEK
// 2787                     if (fp->cltbl)
// 2788                         clst = clmt_clust(fp, fp->fptr);    /* Get cluster# from the CLMT */
// 2789                     else
// 2790 #endif
// 2791                         clst = create_chain(fp->fs, fp->clust); /* Follow or stretch cluster chain on the FAT */
??f_write_8:
        LDR      R1,[R4, #+20]
        LDR      R0,[R4, #+0]
          CFI FunCall create_chain
        BL       create_chain
        MOVS     R7,R0
// 2792                 }
// 2793                 if (clst == 0) break;       /* Could not allocate a new cluster (disk full) */
??f_write_9:
        CMP      R7,#+0
        BEQ.W    ??f_write_5
// 2794                 if (clst == 1) ABORT(fp->fs, FR_INT_ERR);
??f_write_10:
        CMP      R7,#+1
        BNE.N    ??f_write_11
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+2
        B.N      ??f_write_1
// 2795                 if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
??f_write_11:
        CMN      R7,#+1
        BNE.N    ??f_write_12
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_write_1
// 2796                 fp->clust = clst;           /* Update current cluster */
??f_write_12:
        STR      R7,[R4, #+20]
// 2797             }
// 2798 #if _FS_TINY
// 2799             if (fp->fs->winsect == fp->dsect && move_window(fp->fs, 0)) /* Write-back sector cache */
// 2800                 ABORT(fp->fs, FR_DISK_ERR);
// 2801 #else
// 2802             if (fp->flag & FA__DIRTY)       /* Write-back sector cache */
??f_write_7:
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_write_13
// 2803             {
// 2804                 if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
        MOVS     R3,#+1
        LDR      R2,[R4, #+24]
        ADDS     R1,R4,#+36
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_write_14
// 2805                     ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_write_1
// 2806                 fp->flag &= ~FA__DIRTY;
??f_write_14:
        LDRB     R0,[R4, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R4, #+6]
// 2807             }
// 2808 #endif
// 2809             sect = clust2sect(fp->fs, fp->clust);   /* Get current sector */
??f_write_13:
        LDR      R1,[R4, #+20]
        LDR      R0,[R4, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        MOV      R8,R0
// 2810             if (!sect) ABORT(fp->fs, FR_INT_ERR);
        CMP      R8,#+0
        BNE.N    ??f_write_15
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+2
        B.N      ??f_write_1
// 2811             sect += csect;
??f_write_15:
        LDRB     R0,[SP, #+0]
        UXTAB    R8,R8,R0
// 2812             cc = btw / SS(fp->fs);          /* When remaining bytes >= sector size, */
        LSRS     R0,R5,#+9
        MOV      R10,R0
// 2813             if (cc)                         /* Write maximum contiguous sectors directly */
        CMP      R10,#+0
        BEQ.N    ??f_write_16
// 2814             {
// 2815                 if (csect + cc > fp->fs->csize) /* Clip at cluster boundary */
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+2]
        LDRB     R1,[SP, #+0]
        UXTAB    R1,R10,R1
        CMP      R0,R1
        BCS.N    ??f_write_17
// 2816                     cc = fp->fs->csize - csect;
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+2]
        LDRB     R1,[SP, #+0]
        SUBS     R0,R0,R1
        MOV      R10,R0
// 2817                 if (disk_write(fp->fs->drv, wbuff, sect, (uint8)cc) != RES_OK)
??f_write_17:
        MOV      R3,R10
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOV      R2,R8
        MOV      R1,R11
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_write_18
// 2818                     ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_write_1
// 2819 #if _FS_TINY
// 2820                 if (fp->fs->winsect - sect < cc)    /* Refill sector cache if it gets invalidated by the direct write */
// 2821                 {
// 2822                     mem_cpy(fp->fs->win, wbuff + ((fp->fs->winsect - sect) * SS(fp->fs)), SS(fp->fs));
// 2823                     fp->fs->wflag = 0;
// 2824                 }
// 2825 #else
// 2826                 if (fp->dsect - sect < cc)   /* Refill sector cache if it gets invalidated by the direct write */
??f_write_18:
        LDR      R0,[R4, #+24]
        SUBS     R0,R0,R8
        CMP      R0,R10
        BCS.N    ??f_write_19
// 2827                 {
// 2828                     mem_cpy(fp->buf, wbuff + ((fp->dsect - sect) * SS(fp->fs)), SS(fp->fs));
        MOV      R2,#+512
        LDR      R0,[R4, #+24]
        SUBS     R0,R0,R8
        MOV      R1,#+512
        MLA      R1,R1,R0,R11
        ADDS     R0,R4,#+36
          CFI FunCall mem_cpy
        BL       mem_cpy
// 2829                     fp->flag &= ~FA__DIRTY;
        LDRB     R0,[R4, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R4, #+6]
// 2830                 }
// 2831 #endif
// 2832                 wcnt = SS(fp->fs) * cc;     /* Number of bytes transferred */
??f_write_19:
        MOV      R0,#+512
        MUL      R0,R0,R10
        MOV      R9,R0
// 2833                 continue;
        B.N      ??f_write_20
// 2834             }
// 2835 #if _FS_TINY
// 2836             if (fp->fptr >= fp->fsize)      /* Avoid silly cache filling at growing edge */
// 2837             {
// 2838                 if (move_window(fp->fs, 0)) ABORT(fp->fs, FR_DISK_ERR);
// 2839                 fp->fs->winsect = sect;
// 2840             }
// 2841 #else
// 2842             if (fp->dsect != sect)          /* Fill sector cache with file data */
??f_write_16:
        LDR      R0,[R4, #+24]
        CMP      R0,R8
        BEQ.N    ??f_write_21
// 2843             {
// 2844                 if (fp->fptr < fp->fsize &&
// 2845                         disk_read(fp->fs->drv, fp->buf, sect, 1) != RES_OK)
        LDR      R0,[R4, #+8]
        LDR      R1,[R4, #+12]
        CMP      R0,R1
        BCS.N    ??f_write_21
        MOVS     R3,#+1
        MOV      R2,R8
        ADDS     R1,R4,#+36
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??f_write_21
// 2846                     ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_write_1
// 2847             }
// 2848 #endif
// 2849             fp->dsect = sect;
??f_write_21:
        STR      R8,[R4, #+24]
// 2850         }
// 2851         wcnt = SS(fp->fs) - (fp->fptr % SS(fp->fs));/* Put partial sector into file I/O buffer */
??f_write_6:
        LDR      R0,[R4, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        RSBS     R0,R2,#+512
        MOV      R9,R0
// 2852         if (wcnt > btw) wcnt = btw;
        CMP      R5,R9
        BCS.N    ??f_write_22
        MOV      R9,R5
// 2853 #if _FS_TINY
// 2854         if (move_window(fp->fs, fp->dsect)) /* Move sector window */
// 2855             ABORT(fp->fs, FR_DISK_ERR);
// 2856         mem_cpy(&fp->fs->win[fp->fptr % SS(fp->fs)], wbuff, wcnt);  /* Fit partial sector */
// 2857         fp->fs->wflag = 1;
// 2858 #else
// 2859         mem_cpy(&fp->buf[fp->fptr % SS(fp->fs)], wbuff, wcnt);  /* Fit partial sector */
??f_write_22:
        MOV      R2,R9
        MOV      R1,R11
        LDR      R0,[R4, #+8]
        MOV      R3,#+512
        UDIV     R12,R0,R3
        MLS      R12,R12,R3,R0
        ADDS     R0,R12,R4
        ADDS     R0,R0,#+36
          CFI FunCall mem_cpy
        BL       mem_cpy
// 2860         fp->flag |= FA__DIRTY;
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x40
        STRB     R0,[R4, #+6]
// 2861 #endif
// 2862     }
??f_write_20:
        ADDS     R11,R9,R11
        LDR      R0,[R4, #+8]
        ADDS     R0,R9,R0
        STR      R0,[R4, #+8]
        LDR      R0,[R6, #+0]
        ADDS     R0,R9,R0
        STR      R0,[R6, #+0]
        SUBS     R5,R5,R9
        B.N      ??f_write_4
// 2863 
// 2864     if (fp->fptr > fp->fsize) fp->fsize = fp->fptr; /* Update file size if needed */
??f_write_5:
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+8]
        CMP      R0,R1
        BCS.N    ??f_write_23
        LDR      R0,[R4, #+8]
        STR      R0,[R4, #+12]
// 2865     fp->flag |= FA__WRITTEN;                        /* Set file change flag */
??f_write_23:
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x20
        STRB     R0,[R4, #+6]
// 2866 
// 2867     LEAVE_FF(fp->fs, FR_OK);
        MOVS     R0,#+0
??f_write_1:
        POP      {R1-R11,PC}      ;; return
          CFI EndBlock cfiBlock26
// 2868 }
// 2869 
// 2870 
// 2871 
// 2872 
// 2873 /*-----------------------------------------------------------------------*/
// 2874 /* Synchronize the File Object                                           */
// 2875 /*-----------------------------------------------------------------------*/
// 2876 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock27 Using cfiCommon0
          CFI Function f_sync
        THUMB
// 2877 FRESULT f_sync (
// 2878     FIL *fp     /* Pointer to the file object */
// 2879 )
// 2880 {
f_sync:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
// 2881     FRESULT res;
// 2882     uint32 tim;
// 2883     uint8 *dir;
// 2884 
// 2885 
// 2886     res = validate(fp->fs, fp->id);     /* Check validity of the object */
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
          CFI FunCall validate
        BL       validate
        MOVS     R5,R0
// 2887     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_sync_0
// 2888     {
// 2889         if (fp->flag & FA__WRITTEN)     /* Has the file been written? */
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+26
        BPL.N    ??f_sync_0
// 2890         {
// 2891 #if !_FS_TINY   /* Write-back dirty buffer */
// 2892             if (fp->flag & FA__DIRTY)
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_sync_1
// 2893             {
// 2894                 if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
        MOVS     R3,#+1
        LDR      R2,[R4, #+24]
        ADDS     R1,R4,#+36
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_sync_2
// 2895                     LEAVE_FF(fp->fs, FR_DISK_ERR);
        MOVS     R0,#+1
        B.N      ??f_sync_3
// 2896                 fp->flag &= ~FA__DIRTY;
??f_sync_2:
        LDRB     R0,[R4, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R4, #+6]
// 2897             }
// 2898 #endif
// 2899             /* Update the directory entry */
// 2900             res = move_window(fp->fs, fp->dir_sect);
??f_sync_1:
        LDR      R1,[R4, #+28]
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
// 2901             if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_sync_0
// 2902             {
// 2903                 dir = fp->dir_ptr;
        LDR      R0,[R4, #+32]
        MOVS     R7,R0
// 2904                 dir[DIR_Attr] |= AM_ARC;                    /* Set archive bit */
        LDRB     R0,[R7, #+11]
        ORRS     R0,R0,#0x20
        STRB     R0,[R7, #+11]
// 2905                 ST_DWORD(dir + DIR_FileSize, fp->fsize);        /* Update file size */
        LDR      R0,[R4, #+12]
        STRB     R0,[R7, #+28]
        LDR      R0,[R4, #+12]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R7, #+29]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+16
        STRB     R0,[R7, #+30]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+24
        STRB     R0,[R7, #+31]
// 2906                 ST_CLUST(dir, fp->sclust);                  /* Update start cluster */
        LDR      R0,[R4, #+16]
        STRB     R0,[R7, #+26]
        LDR      R0,[R4, #+16]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R7, #+27]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+16
        STRB     R0,[R7, #+20]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R7, #+21]
// 2907                 tim = get_fattime();                        /* Update updated time */
          CFI FunCall get_fattime
        BL       get_fattime
        MOVS     R6,R0
// 2908                 ST_DWORD(dir + DIR_WrtTime, tim);
        STRB     R6,[R7, #+22]
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R7, #+23]
        LSRS     R0,R6,#+16
        STRB     R0,[R7, #+24]
        LSRS     R0,R6,#+24
        STRB     R0,[R7, #+25]
// 2909                 fp->flag &= ~FA__WRITTEN;
        LDRB     R0,[R4, #+6]
        ANDS     R0,R0,#0xDF
        STRB     R0,[R4, #+6]
// 2910                 fp->fs->wflag = 1;
        MOVS     R0,#+1
        LDR      R1,[R4, #+0]
        STRB     R0,[R1, #+4]
// 2911                 res = sync(fp->fs);
        LDR      R0,[R4, #+0]
          CFI FunCall sync
        BL       sync
        MOVS     R5,R0
// 2912             }
// 2913         }
// 2914     }
// 2915 
// 2916     LEAVE_FF(fp->fs, res);
??f_sync_0:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
??f_sync_3:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock27
// 2917 }
// 2918 
// 2919 #endif /* !_FS_READONLY */
// 2920 
// 2921 
// 2922 
// 2923 
// 2924 /*-----------------------------------------------------------------------*/
// 2925 /* Close File                                                            */
// 2926 /*-----------------------------------------------------------------------*/
// 2927 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock28 Using cfiCommon0
          CFI Function f_close
        THUMB
// 2928 FRESULT f_close (
// 2929     FIL *fp     /* Pointer to the file object to be closed */
// 2930 )
// 2931 {
f_close:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
// 2932     FRESULT res;
// 2933 
// 2934 #if _FS_READONLY
// 2935     FATFS *fs = fp->fs;
// 2936     res = validate(fs, fp->id);
// 2937     if (res == FR_OK) fp->fs = 0;   /* Discard file object */
// 2938     LEAVE_FF(fs, res);
// 2939 
// 2940 #else
// 2941     res = f_sync(fp);       /* Flush cached data */
        MOVS     R0,R4
          CFI FunCall f_sync
        BL       f_sync
        MOVS     R5,R0
// 2942 #if _FS_SHARE
// 2943     if (res == FR_OK)       /* Decrement open counter */
// 2944     {
// 2945 #if _FS_REENTRANT
// 2946         res = validate(fp->fs, fp->id);
// 2947         if (res == FR_OK)
// 2948         {
// 2949             res = dec_lock(fp->lockid);
// 2950             unlock_fs(fp->fs, FR_OK);
// 2951         }
// 2952 #else
// 2953     res = dec_lock(fp->lockid);
// 2954 #endif
// 2955     }
// 2956 #endif
// 2957     if (res == FR_OK) fp->fs = 0;   /* Discard file object */
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_close_0
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
// 2958     return res;
??f_close_0:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock28
// 2959 #endif
// 2960 }
// 2961 
// 2962 
// 2963 
// 2964 
// 2965 /*-----------------------------------------------------------------------*/
// 2966 /* Current Drive/Directory Handlings                                     */
// 2967 /*-----------------------------------------------------------------------*/
// 2968 
// 2969 #if _FS_RPATH >= 1
// 2970 
// 2971 FRESULT f_chdrive (
// 2972     uint8 drv       /* Drive number */
// 2973 )
// 2974 {
// 2975     if (drv >= _VOLUMES) return FR_INVALID_DRIVE;
// 2976 
// 2977     CurrVol = drv;
// 2978 
// 2979     return FR_OK;
// 2980 }
// 2981 
// 2982 
// 2983 
// 2984 FRESULT f_chdir (
// 2985     const TCHAR *path   /* Pointer to the directory path */
// 2986 )
// 2987 {
// 2988     FRESULT res;
// 2989     DIR dj;
// 2990     DEF_NAMEBUF;
// 2991 
// 2992 
// 2993     res = chk_mounted(&path, &dj.fs, 0);
// 2994     if (res == FR_OK)
// 2995     {
// 2996         INIT_BUF(dj);
// 2997         res = follow_path(&dj, path);       /* Follow the path */
// 2998         FREE_BUF();
// 2999         if (res == FR_OK)                   /* Follow completed */
// 3000         {
// 3001             if (!dj.dir)
// 3002             {
// 3003                 dj.fs->cdir = dj.sclust;    /* Start directory itself */
// 3004             }
// 3005             else
// 3006             {
// 3007                 if (dj.dir[DIR_Attr] & AM_DIR)  /* Reached to the directory */
// 3008                     dj.fs->cdir = LD_CLUST(dj.dir);
// 3009                 else
// 3010                     res = FR_NO_PATH;       /* Reached but a file */
// 3011             }
// 3012         }
// 3013         if (res == FR_NO_FILE) res = FR_NO_PATH;
// 3014     }
// 3015 
// 3016     LEAVE_FF(dj.fs, res);
// 3017 }
// 3018 
// 3019 
// 3020 #if _FS_RPATH >= 2
// 3021 FRESULT f_getcwd (
// 3022     TCHAR *path,    /* Pointer to the directory path */
// 3023     uint32 sz_path  /* Size of path */
// 3024 )
// 3025 {
// 3026     FRESULT res;
// 3027     DIR dj;
// 3028     uint32 i, n;
// 3029     uint32 ccl;
// 3030     TCHAR *tp;
// 3031     FILINFO fno;
// 3032     DEF_NAMEBUF;
// 3033 
// 3034 
// 3035     *path = 0;
// 3036     res = chk_mounted((const TCHAR **)&path, &dj.fs, 0);    /* Get current volume */
// 3037     if (res == FR_OK)
// 3038     {
// 3039         INIT_BUF(dj);
// 3040         i = sz_path;        /* Bottom of buffer (dir stack base) */
// 3041         dj.sclust = dj.fs->cdir;            /* Start to follow upper dir from current dir */
// 3042         while ((ccl = dj.sclust) != 0)      /* Repeat while current dir is a sub-dir */
// 3043         {
// 3044             res = dir_sdi(&dj, 1);          /* Get parent dir */
// 3045             if (res != FR_OK) break;
// 3046             res = dir_read(&dj);
// 3047             if (res != FR_OK) break;
// 3048             dj.sclust = LD_CLUST(dj.dir);   /* Goto parent dir */
// 3049             res = dir_sdi(&dj, 0);
// 3050             if (res != FR_OK) break;
// 3051             do                              /* Find the entry links to the child dir */
// 3052             {
// 3053                 res = dir_read(&dj);
// 3054                 if (res != FR_OK) break;
// 3055                 if (ccl == LD_CLUST(dj.dir)) break; /* Found the entry */
// 3056                 res = dir_next(&dj, 0);
// 3057             }
// 3058             while (res == FR_OK);
// 3059             if (res == FR_NO_FILE) res = FR_INT_ERR;/* It cannot be 'not found'. */
// 3060             if (res != FR_OK) break;
// 3061 #if _USE_LFN
// 3062             fno.lfname = path;
// 3063             fno.lfsize = i;
// 3064 #endif
// 3065             get_fileinfo(&dj, &fno);        /* Get the dir name and push it to the buffer */
// 3066             tp = fno.fname;
// 3067             if (_USE_LFN && *path) tp = path;
// 3068             for (n = 0; tp[n]; n++) ;
// 3069             if (i < n + 3)
// 3070             {
// 3071                 res = FR_NOT_ENOUGH_CORE;
// 3072                 break;
// 3073             }
// 3074             while (n) path[--i] = tp[--n];
// 3075             path[--i] = '/';
// 3076         }
// 3077         tp = path;
// 3078         if (res == FR_OK)
// 3079         {
// 3080             *tp++ = '0' + CurrVol;          /* Put drive number */
// 3081             *tp++ = ':';
// 3082             if (i == sz_path)               /* Root-dir */
// 3083             {
// 3084                 *tp++ = '/';
// 3085             }
// 3086             else                        /* Sub-dir */
// 3087             {
// 3088                 do      /* Add stacked path str */
// 3089                     *tp++ = path[i++];
// 3090                 while (i < sz_path);
// 3091             }
// 3092         }
// 3093         *tp = 0;
// 3094         FREE_BUF();
// 3095     }
// 3096 
// 3097     LEAVE_FF(dj.fs, res);
// 3098 }
// 3099 #endif /* _FS_RPATH >= 2 */
// 3100 #endif /* _FS_RPATH >= 1 */
// 3101 
// 3102 
// 3103 
// 3104 #if _FS_MINIMIZE <= 2
// 3105 /*-----------------------------------------------------------------------*/
// 3106 /* Seek File R/W Pointer                                                 */
// 3107 /*-----------------------------------------------------------------------*/
// 3108 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock29 Using cfiCommon0
          CFI Function f_lseek
        THUMB
// 3109 FRESULT f_lseek (
// 3110     FIL *fp,        /* Pointer to the file object */
// 3111     uint32 ofs      /* File pointer from top of file */
// 3112 )
// 3113 {
f_lseek:
        PUSH     {R4-R10,LR}
          CFI R14 Frame(CFA, -4)
          CFI R10 Frame(CFA, -8)
          CFI R9 Frame(CFA, -12)
          CFI R8 Frame(CFA, -16)
          CFI R7 Frame(CFA, -20)
          CFI R6 Frame(CFA, -24)
          CFI R5 Frame(CFA, -28)
          CFI R4 Frame(CFA, -32)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
// 3114     FRESULT res;
// 3115 
// 3116 
// 3117     res = validate(fp->fs, fp->id);     /* Check validity of the object */
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
          CFI FunCall validate
        BL       validate
        MOVS     R6,R0
// 3118     if (res != FR_OK) LEAVE_FF(fp->fs, res);
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??f_lseek_0
        MOVS     R0,R6
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        B.N      ??f_lseek_1
// 3119     if (fp->flag & FA__ERROR)           /* Check abort flag */
??f_lseek_0:
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+24
        BPL.N    ??f_lseek_2
// 3120         LEAVE_FF(fp->fs, FR_INT_ERR);
        MOVS     R0,#+2
        B.N      ??f_lseek_1
// 3121 
// 3122 #if _USE_FASTSEEK
// 3123     if (fp->cltbl)      /* Fast seek */
// 3124     {
// 3125         uint32 cl, pcl, ncl, tcl, dsc, tlen, ulen, *tbl;
// 3126 
// 3127         if (ofs == CREATE_LINKMAP)      /* Create CLMT */
// 3128         {
// 3129             tbl = fp->cltbl;
// 3130             tlen = *tbl++;
// 3131             ulen = 2;   /* Given table size and required table size */
// 3132             cl = fp->sclust;            /* Top of the chain */
// 3133             if (cl)
// 3134             {
// 3135                 do
// 3136                 {
// 3137                     /* Get a fragment */
// 3138                     tcl = cl;
// 3139                     ncl = 0;
// 3140                     ulen += 2;  /* Top, length and used items */
// 3141                     do
// 3142                     {
// 3143                         pcl = cl;
// 3144                         ncl++;
// 3145                         cl = get_fat(fp->fs, cl);
// 3146                         if (cl <= 1) ABORT(fp->fs, FR_INT_ERR);
// 3147                         if (cl == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
// 3148                     }
// 3149                     while (cl == pcl + 1);
// 3150                     if (ulen <= tlen)       /* Store the length and top of the fragment */
// 3151                     {
// 3152                         *tbl++ = ncl;
// 3153                         *tbl++ = tcl;
// 3154                     }
// 3155                 }
// 3156                 while (cl < fp->fs->n_fatent);  /* Repeat until end of chain */
// 3157             }
// 3158             *fp->cltbl = ulen;  /* Number of items used */
// 3159             if (ulen <= tlen)
// 3160                 *tbl = 0;       /* Terminate table */
// 3161             else
// 3162                 res = FR_NOT_ENOUGH_CORE;   /* Given table size is smaller than required */
// 3163 
// 3164         }
// 3165         else                        /* Fast seek */
// 3166         {
// 3167             if (ofs > fp->fsize)        /* Clip offset at the file size */
// 3168                 ofs = fp->fsize;
// 3169             fp->fptr = ofs;             /* Set file pointer */
// 3170             if (ofs)
// 3171             {
// 3172                 fp->clust = clmt_clust(fp, ofs - 1);
// 3173                 dsc = clust2sect(fp->fs, fp->clust);
// 3174                 if (!dsc) ABORT(fp->fs, FR_INT_ERR);
// 3175                 dsc += (ofs - 1) / SS(fp->fs) & (fp->fs->csize - 1);
// 3176                 if (fp->fptr % SS(fp->fs) && dsc != fp->dsect)      /* Refill sector cache if needed */
// 3177                 {
// 3178 #if !_FS_TINY
// 3179 #if !_FS_READONLY
// 3180                     if (fp->flag & FA__DIRTY)       /* Write-back dirty sector cache */
// 3181                     {
// 3182                         if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
// 3183                             ABORT(fp->fs, FR_DISK_ERR);
// 3184                         fp->flag &= ~FA__DIRTY;
// 3185                     }
// 3186 #endif
// 3187                     if (disk_read(fp->fs->drv, fp->buf, dsc, 1) != RES_OK)  /* Load current sector */
// 3188                         ABORT(fp->fs, FR_DISK_ERR);
// 3189 #endif
// 3190                     fp->dsect = dsc;
// 3191                 }
// 3192             }
// 3193         }
// 3194     }
// 3195     else
// 3196 #endif
// 3197 
// 3198         /* Normal Seek */
// 3199     {
// 3200         uint32 clst, bcs, nsect, ifptr;
// 3201 
// 3202         if (ofs > fp->fsize                 /* In read-only mode, clip offset with the file size */
// 3203 #if !_FS_READONLY
// 3204                 && !(fp->flag & FA_WRITE)
// 3205 #endif
// 3206            ) ofs = fp->fsize;
??f_lseek_2:
        LDR      R0,[R4, #+12]
        CMP      R0,R5
        BCS.N    ??f_lseek_3
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+30
        BMI.N    ??f_lseek_3
        LDR      R0,[R4, #+12]
        MOVS     R5,R0
// 3207 
// 3208         ifptr = fp->fptr;
??f_lseek_3:
        LDR      R0,[R4, #+8]
        MOV      R10,R0
// 3209         fp->fptr = nsect = 0;
        MOVS     R0,#+0
        MOV      R9,R0
        STR      R9,[R4, #+8]
// 3210         if (ofs)
        CMP      R5,#+0
        BEQ.W    ??f_lseek_4
// 3211         {
// 3212             bcs = (uint32)fp->fs->csize * SS(fp->fs);   /* Cluster size (byte) */
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+2]
        MOV      R1,#+512
        MULS     R0,R1,R0
        MOV      R8,R0
// 3213             if (ifptr > 0 &&
// 3214                     (ofs - 1) / bcs >= (ifptr - 1) / bcs)   /* When seek to same or following cluster, */
        CMP      R10,#+0
        BEQ.N    ??f_lseek_5
        SUBS     R0,R10,#+1
        UDIV     R0,R0,R8
        SUBS     R1,R5,#+1
        UDIV     R1,R1,R8
        CMP      R1,R0
        BCC.N    ??f_lseek_5
// 3215             {
// 3216                 fp->fptr = (ifptr - 1) & ~(bcs - 1);    /* start from the current cluster */
        SUBS     R0,R10,#+1
        SUBS     R1,R8,#+1
        BICS     R0,R0,R1
        STR      R0,[R4, #+8]
// 3217                 ofs -= fp->fptr;
        LDR      R0,[R4, #+8]
        SUBS     R5,R5,R0
// 3218                 clst = fp->clust;
        LDR      R0,[R4, #+20]
        MOVS     R7,R0
        B.N      ??f_lseek_6
// 3219             }
// 3220             else                                    /* When seek to back cluster, */
// 3221             {
// 3222                 clst = fp->sclust;                      /* start from the first cluster */
??f_lseek_5:
        LDR      R0,[R4, #+16]
        MOVS     R7,R0
// 3223 #if !_FS_READONLY
// 3224                 if (clst == 0)                          /* If no cluster chain, create a new chain */
        CMP      R7,#+0
        BNE.N    ??f_lseek_7
// 3225                 {
// 3226                     clst = create_chain(fp->fs, 0);
        MOVS     R1,#+0
        LDR      R0,[R4, #+0]
          CFI FunCall create_chain
        BL       create_chain
        MOVS     R7,R0
// 3227                     if (clst == 1) ABORT(fp->fs, FR_INT_ERR);
        CMP      R7,#+1
        BNE.N    ??f_lseek_8
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+2
        B.N      ??f_lseek_1
// 3228                     if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
??f_lseek_8:
        CMN      R7,#+1
        BNE.N    ??f_lseek_9
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
// 3229                     fp->sclust = clst;
??f_lseek_9:
        STR      R7,[R4, #+16]
// 3230                 }
// 3231 #endif
// 3232                 fp->clust = clst;
??f_lseek_7:
        STR      R7,[R4, #+20]
// 3233             }
// 3234             if (clst != 0)
??f_lseek_6:
        CMP      R7,#+0
        BEQ.N    ??f_lseek_4
// 3235             {
// 3236                 while (ofs > bcs)                       /* Cluster following loop */
??f_lseek_10:
        CMP      R8,R5
        BCS.N    ??f_lseek_11
// 3237                 {
// 3238 #if !_FS_READONLY
// 3239                     if (fp->flag & FA_WRITE)            /* Check if in write mode or not */
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+30
        BPL.N    ??f_lseek_12
// 3240                     {
// 3241                         clst = create_chain(fp->fs, clst);  /* Force stretch if in write mode */
        MOVS     R1,R7
        LDR      R0,[R4, #+0]
          CFI FunCall create_chain
        BL       create_chain
        MOVS     R7,R0
// 3242                         if (clst == 0)                  /* When disk gets full, clip file size */
        CMP      R7,#+0
        BNE.N    ??f_lseek_13
// 3243                         {
// 3244                             ofs = bcs;
        MOV      R5,R8
// 3245                             break;
        B.N      ??f_lseek_11
// 3246                         }
// 3247                     }
// 3248                     else
// 3249 #endif
// 3250                         clst = get_fat(fp->fs, clst);   /* Follow cluster chain if not in write mode */
??f_lseek_12:
        MOVS     R1,R7
        LDR      R0,[R4, #+0]
          CFI FunCall get_fat
        BL       get_fat
        MOVS     R7,R0
// 3251                     if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
??f_lseek_13:
        CMN      R7,#+1
        BNE.N    ??f_lseek_14
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
// 3252                     if (clst <= 1 || clst >= fp->fs->n_fatent) ABORT(fp->fs, FR_INT_ERR);
??f_lseek_14:
        CMP      R7,#+2
        BCC.N    ??f_lseek_15
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+24]
        CMP      R7,R0
        BCC.N    ??f_lseek_16
??f_lseek_15:
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+2
        B.N      ??f_lseek_1
// 3253                     fp->clust = clst;
??f_lseek_16:
        STR      R7,[R4, #+20]
// 3254                     fp->fptr += bcs;
        LDR      R0,[R4, #+8]
        ADDS     R0,R8,R0
        STR      R0,[R4, #+8]
// 3255                     ofs -= bcs;
        SUBS     R5,R5,R8
        B.N      ??f_lseek_10
// 3256                 }
// 3257                 fp->fptr += ofs;
??f_lseek_11:
        LDR      R0,[R4, #+8]
        ADDS     R0,R5,R0
        STR      R0,[R4, #+8]
// 3258                 if (ofs % SS(fp->fs))
        MOV      R0,#+512
        UDIV     R1,R5,R0
        MLS      R1,R1,R0,R5
        CMP      R1,#+0
        BEQ.N    ??f_lseek_4
// 3259                 {
// 3260                     nsect = clust2sect(fp->fs, clst);   /* Current sector */
        MOVS     R1,R7
        LDR      R0,[R4, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        MOV      R9,R0
// 3261                     if (!nsect) ABORT(fp->fs, FR_INT_ERR);
        CMP      R9,#+0
        BNE.N    ??f_lseek_17
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+2
        B.N      ??f_lseek_1
// 3262                     nsect += ofs / SS(fp->fs);
??f_lseek_17:
        ADDS     R9,R9,R5, LSR #+9
// 3263                 }
// 3264             }
// 3265         }
// 3266         if (fp->fptr % SS(fp->fs) && nsect != fp->dsect)    /* Fill sector cache if needed */
??f_lseek_4:
        LDR      R0,[R4, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BEQ.N    ??f_lseek_18
        LDR      R0,[R4, #+24]
        CMP      R9,R0
        BEQ.N    ??f_lseek_18
// 3267         {
// 3268 #if !_FS_TINY
// 3269 #if !_FS_READONLY
// 3270             if (fp->flag & FA__DIRTY)           /* Write-back dirty sector cache */
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_lseek_19
// 3271             {
// 3272                 if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
        MOVS     R3,#+1
        LDR      R2,[R4, #+24]
        ADDS     R1,R4,#+36
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_lseek_20
// 3273                     ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
// 3274                 fp->flag &= ~FA__DIRTY;
??f_lseek_20:
        LDRB     R0,[R4, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R4, #+6]
// 3275             }
// 3276 #endif
// 3277             if (disk_read(fp->fs->drv, fp->buf, nsect, 1) != RES_OK)    /* Fill sector cache */
??f_lseek_19:
        MOVS     R3,#+1
        MOV      R2,R9
        ADDS     R1,R4,#+36
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??f_lseek_21
// 3278                 ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
// 3279 #endif
// 3280             fp->dsect = nsect;
??f_lseek_21:
        STR      R9,[R4, #+24]
// 3281         }
// 3282 #if !_FS_READONLY
// 3283         if (fp->fptr > fp->fsize)           /* Set file change flag if the file size is extended */
??f_lseek_18:
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+8]
        CMP      R0,R1
        BCS.N    ??f_lseek_22
// 3284         {
// 3285             fp->fsize = fp->fptr;
        LDR      R0,[R4, #+8]
        STR      R0,[R4, #+12]
// 3286             fp->flag |= FA__WRITTEN;
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x20
        STRB     R0,[R4, #+6]
// 3287         }
// 3288 #endif
// 3289     }
// 3290 
// 3291     LEAVE_FF(fp->fs, res);
??f_lseek_22:
        MOVS     R0,R6
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
??f_lseek_1:
        POP      {R4-R10,PC}      ;; return
          CFI EndBlock cfiBlock29
// 3292 }
// 3293 
// 3294 
// 3295 
// 3296 #if _FS_MINIMIZE <= 1
// 3297 /*-----------------------------------------------------------------------*/
// 3298 /* Create a Directroy Object                                             */
// 3299 /*-----------------------------------------------------------------------*/
// 3300 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock30 Using cfiCommon0
          CFI Function f_opendir
        THUMB
// 3301 FRESULT f_opendir (
// 3302     DIR *dj,            /* Pointer to directory object to create */
// 3303     const TCHAR *path   /* Pointer to the directory path */
// 3304 )
// 3305 {
f_opendir:
        PUSH     {R1,R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        SUB      SP,SP,#+16
          CFI CFA R13+32
        MOVS     R4,R0
// 3306     FRESULT res;
// 3307     DEF_NAMEBUF;
// 3308 
// 3309 
// 3310     res = chk_mounted(&path, &dj->fs, 0);
        MOVS     R2,#+0
        MOVS     R1,R4
        ADD      R0,SP,#+16
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOVS     R5,R0
// 3311     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_opendir_0
// 3312     {
// 3313         INIT_BUF(*dj);
        ADD      R0,SP,#+0
        STR      R0,[R4, #+24]
// 3314         res = follow_path(dj, path);            /* Follow the path to the directory */
        LDR      R1,[SP, #+16]
        MOVS     R0,R4
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 3315         FREE_BUF();
// 3316         if (res == FR_OK)                       /* Follow completed */
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_opendir_1
// 3317         {
// 3318             if (dj->dir)                        /* It is not the root dir */
        LDR      R0,[R4, #+20]
        CMP      R0,#+0
        BEQ.N    ??f_opendir_2
// 3319             {
// 3320                 if (dj->dir[DIR_Attr] & AM_DIR)     /* The object is a directory */
        LDR      R0,[R4, #+20]
        LDRB     R0,[R0, #+11]
        LSLS     R0,R0,#+27
        BPL.N    ??f_opendir_3
// 3321                 {
// 3322                     dj->sclust = LD_CLUST(dj->dir);
        LDR      R0,[R4, #+20]
        LDRB     R0,[R0, #+21]
        LDR      R1,[R4, #+20]
        LDRB     R1,[R1, #+20]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR      R1,[R4, #+20]
        LDRB     R1,[R1, #+27]
        LDR      R2,[R4, #+20]
        LDRB     R2,[R2, #+26]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R1,R0, LSL #+16
        STR      R0,[R4, #+8]
        B.N      ??f_opendir_2
// 3323                 }
// 3324                 else                        /* The object is not a directory */
// 3325                 {
// 3326                     res = FR_NO_PATH;
??f_opendir_3:
        MOVS     R0,#+5
        MOVS     R5,R0
// 3327                 }
// 3328             }
// 3329             if (res == FR_OK)
??f_opendir_2:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_opendir_1
// 3330             {
// 3331                 dj->id = dj->fs->id;
        LDR      R0,[R4, #+0]
        LDRH     R0,[R0, #+6]
        STRH     R0,[R4, #+4]
// 3332                 res = dir_sdi(dj, 0);           /* Rewind dir */
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
        MOVS     R5,R0
// 3333             }
// 3334         }
// 3335         if (res == FR_NO_FILE) res = FR_NO_PATH;
??f_opendir_1:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BNE.N    ??f_opendir_0
        MOVS     R0,#+5
        MOVS     R5,R0
// 3336     }
// 3337 
// 3338     LEAVE_FF(dj->fs, res);
??f_opendir_0:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+20
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock30
// 3339 }
// 3340 
// 3341 
// 3342 
// 3343 
// 3344 /*-----------------------------------------------------------------------*/
// 3345 /* Read Directory Entry in Sequense                                      */
// 3346 /*-----------------------------------------------------------------------*/
// 3347 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock31 Using cfiCommon0
          CFI Function f_readdir
        THUMB
// 3348 FRESULT f_readdir (
// 3349     DIR *dj,            /* Pointer to the open directory object */
// 3350     FILINFO *fno        /* Pointer to file information to return */
// 3351 )
// 3352 {
f_readdir:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+16
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
// 3353     FRESULT res;
// 3354     DEF_NAMEBUF;
// 3355 
// 3356 
// 3357     res = validate(dj->fs, dj->id);         /* Check validity of the object */
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
          CFI FunCall validate
        BL       validate
        MOVS     R6,R0
// 3358     if (res == FR_OK)
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_readdir_0
// 3359     {
// 3360         if (!fno)
        CMP      R5,#+0
        BNE.N    ??f_readdir_1
// 3361         {
// 3362             res = dir_sdi(dj, 0);           /* Rewind the directory object */
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
        MOVS     R6,R0
        B.N      ??f_readdir_0
// 3363         }
// 3364         else
// 3365         {
// 3366             INIT_BUF(*dj);
??f_readdir_1:
        ADD      R0,SP,#+0
        STR      R0,[R4, #+24]
// 3367             res = dir_read(dj);             /* Read an directory item */
        MOVS     R0,R4
          CFI FunCall dir_read
        BL       dir_read
        MOVS     R6,R0
// 3368             if (res == FR_NO_FILE)          /* Reached end of dir */
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BNE.N    ??f_readdir_2
// 3369             {
// 3370                 dj->sect = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
// 3371                 res = FR_OK;
        MOVS     R0,#+0
        MOVS     R6,R0
// 3372             }
// 3373             if (res == FR_OK)               /* A valid entry is found */
??f_readdir_2:
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_readdir_0
// 3374             {
// 3375                 get_fileinfo(dj, fno);      /* Get the object information */
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall get_fileinfo
        BL       get_fileinfo
// 3376                 res = dir_next(dj, 0);      /* Increment index for next */
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_next
        BL       dir_next
        MOVS     R6,R0
// 3377                 if (res == FR_NO_FILE)
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BNE.N    ??f_readdir_0
// 3378                 {
// 3379                     dj->sect = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
// 3380                     res = FR_OK;
        MOVS     R0,#+0
        MOVS     R6,R0
// 3381                 }
// 3382             }
// 3383             FREE_BUF();
// 3384         }
// 3385     }
// 3386 
// 3387     LEAVE_FF(dj->fs, res);
??f_readdir_0:
        MOVS     R0,R6
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+16
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock31
// 3388 }
// 3389 
// 3390 
// 3391 
// 3392 #if _FS_MINIMIZE == 0
// 3393 /*-----------------------------------------------------------------------*/
// 3394 /* Get File Status                                                       */
// 3395 /*-----------------------------------------------------------------------*/
// 3396 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock32 Using cfiCommon0
          CFI Function f_stat
        THUMB
// 3397 FRESULT f_stat (
// 3398     const TCHAR *path,  /* Pointer to the file path */
// 3399     FILINFO *fno        /* Pointer to file information to return */
// 3400 )
// 3401 {
f_stat:
        PUSH     {R0,R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        SUB      SP,SP,#+40
          CFI CFA R13+56
        MOVS     R4,R1
// 3402     FRESULT res;
// 3403     DIR dj;
// 3404     DEF_NAMEBUF;
// 3405 
// 3406 
// 3407     res = chk_mounted(&path, &dj.fs, 0);
        MOVS     R2,#+0
        ADD      R1,SP,#+12
        ADD      R0,SP,#+40
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOVS     R5,R0
// 3408     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_stat_0
// 3409     {
// 3410         INIT_BUF(dj);
        ADD      R0,SP,#+0
        STR      R0,[SP, #+36]
// 3411         res = follow_path(&dj, path);   /* Follow the file path */
        LDR      R1,[SP, #+40]
        ADD      R0,SP,#+12
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 3412         if (res == FR_OK)               /* Follow completed */
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_stat_0
// 3413         {
// 3414             if (dj.dir)     /* Found an object */
        LDR      R0,[SP, #+32]
        CMP      R0,#+0
        BEQ.N    ??f_stat_1
// 3415                 get_fileinfo(&dj, fno);
        MOVS     R1,R4
        ADD      R0,SP,#+12
          CFI FunCall get_fileinfo
        BL       get_fileinfo
        B.N      ??f_stat_0
// 3416             else            /* It is root dir */
// 3417                 res = FR_INVALID_NAME;
??f_stat_1:
        MOVS     R0,#+6
        MOVS     R5,R0
// 3418         }
// 3419         FREE_BUF();
// 3420     }
// 3421 
// 3422     LEAVE_FF(dj.fs, res);
??f_stat_0:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+44
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock32
// 3423 }
// 3424 
// 3425 
// 3426 
// 3427 #if !_FS_READONLY
// 3428 /*-----------------------------------------------------------------------*/
// 3429 /* Get Number of Free Clusters                                           */
// 3430 /*-----------------------------------------------------------------------*/
// 3431 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock33 Using cfiCommon0
          CFI Function f_getfree
        THUMB
// 3432 FRESULT f_getfree (
// 3433     const TCHAR *path,  /* Pointer to the logical drive number (root dir) */
// 3434     uint32 *nclst,      /* Pointer to the variable to return number of free clusters */
// 3435     FATFS **fatfs       /* Pointer to pointer to corresponding file system object to return */
// 3436 )
// 3437 {
f_getfree:
        PUSH     {R0,R1,R4-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+44
        SUB      SP,SP,#+4
          CFI CFA R13+48
        MOVS     R4,R2
// 3438     FRESULT res;
// 3439     uint32 n, clst, sect, stat;
// 3440     uint32 i;
// 3441     uint8 fat, *p;
// 3442 
// 3443 
// 3444     /* Get drive number */
// 3445     res = chk_mounted(&path, fatfs, 0);
        MOVS     R2,#+0
        MOVS     R1,R4
        ADD      R0,SP,#+4
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOVS     R5,R0
// 3446     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.W    ??f_getfree_0
// 3447     {
// 3448         /* If free_clust is valid, return it without full cluster scan */
// 3449         if ((*fatfs)->free_clust <= (*fatfs)->n_fatent - 2)
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+24]
        SUBS     R0,R0,#+2
        LDR      R1,[R4, #+0]
        LDR      R1,[R1, #+16]
        CMP      R0,R1
        BCC.N    ??f_getfree_1
// 3450         {
// 3451             *nclst = (*fatfs)->free_clust;
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+16]
        LDR      R1,[SP, #+8]
        STR      R0,[R1, #+0]
        B.N      ??f_getfree_0
// 3452         }
// 3453         else
// 3454         {
// 3455             /* Get number of free clusters */
// 3456             fat = (*fatfs)->fs_type;
??f_getfree_1:
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+0]
        STRB     R0,[SP, #+0]
// 3457             n = 0;
        MOVS     R0,#+0
        MOVS     R6,R0
// 3458             if (fat == FS_FAT12)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+1
        BNE.N    ??f_getfree_2
// 3459             {
// 3460                 clst = 2;
        MOVS     R0,#+2
        MOVS     R7,R0
// 3461                 do
// 3462                 {
// 3463                     stat = get_fat(*fatfs, clst);
??f_getfree_3:
        MOVS     R1,R7
        LDR      R0,[R4, #+0]
          CFI FunCall get_fat
        BL       get_fat
        MOV      R9,R0
// 3464                     if (stat == 0xFFFFFFFF)
        CMN      R9,#+1
        BNE.N    ??f_getfree_4
// 3465                     {
// 3466                         res = FR_DISK_ERR;
        MOVS     R0,#+1
        MOVS     R5,R0
// 3467                         break;
        B.N      ??f_getfree_5
// 3468                     }
// 3469                     if (stat == 1)
??f_getfree_4:
        CMP      R9,#+1
        BNE.N    ??f_getfree_6
// 3470                     {
// 3471                         res = FR_INT_ERR;
        MOVS     R0,#+2
        MOVS     R5,R0
// 3472                         break;
        B.N      ??f_getfree_5
// 3473                     }
// 3474                     if (stat == 0) n++;
??f_getfree_6:
        CMP      R9,#+0
        BNE.N    ??f_getfree_7
        ADDS     R6,R6,#+1
// 3475                 }
// 3476                 while (++clst < (*fatfs)->n_fatent);
??f_getfree_7:
        ADDS     R7,R7,#+1
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+24]
        CMP      R7,R0
        BCC.N    ??f_getfree_3
        B.N      ??f_getfree_5
// 3477             }
// 3478             else
// 3479             {
// 3480                 clst = (*fatfs)->n_fatent;
??f_getfree_2:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+24]
        MOVS     R7,R0
// 3481                 sect = (*fatfs)->fatbase;
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+32]
        MOV      R8,R0
// 3482                 i = 0;
        MOVS     R0,#+0
        MOV      R10,R0
// 3483                 p = 0;
        MOVS     R0,#+0
        MOV      R11,R0
// 3484                 do
// 3485                 {
// 3486                     if (!i)
??f_getfree_8:
        CMP      R10,#+0
        BNE.N    ??f_getfree_9
// 3487                     {
// 3488                         res = move_window(*fatfs, sect++);
        MOV      R1,R8
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
        ADDS     R8,R8,#+1
// 3489                         if (res != FR_OK) break;
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_getfree_5
// 3490                         p = (*fatfs)->win;
??f_getfree_10:
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,#+48
        MOV      R11,R0
// 3491                         i = SS(*fatfs);
        MOV      R0,#+512
        MOV      R10,R0
// 3492                     }
// 3493                     if (fat == FS_FAT16)
??f_getfree_9:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+2
        BNE.N    ??f_getfree_11
// 3494                     {
// 3495                         if (LD_WORD(p) == 0) n++;
        LDRB     R0,[R11, #+1]
        LDRB     R1,[R11, #+0]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??f_getfree_12
        ADDS     R6,R6,#+1
// 3496                         p += 2;
??f_getfree_12:
        ADDS     R11,R11,#+2
// 3497                         i -= 2;
        SUBS     R10,R10,#+2
        B.N      ??f_getfree_13
// 3498                     }
// 3499                     else
// 3500                     {
// 3501                         if ((LD_DWORD(p) & 0x0FFFFFFF) == 0) n++;
??f_getfree_11:
        LDRB     R0,[R11, #+3]
        LDRB     R1,[R11, #+2]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R11, #+1]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R11, #+0]
        ORRS     R0,R1,R0
        LSLS     R0,R0,#+4
        BNE.N    ??f_getfree_14
        ADDS     R6,R6,#+1
// 3502                         p += 4;
??f_getfree_14:
        ADDS     R11,R11,#+4
// 3503                         i -= 4;
        SUBS     R10,R10,#+4
// 3504                     }
// 3505                 }
// 3506                 while (--clst);
??f_getfree_13:
        SUBS     R7,R7,#+1
        CMP      R7,#+0
        BNE.N    ??f_getfree_8
// 3507             }
// 3508             (*fatfs)->free_clust = n;
??f_getfree_5:
        LDR      R0,[R4, #+0]
        STR      R6,[R0, #+16]
// 3509             if (fat == FS_FAT32) (*fatfs)->fsi_flag = 1;
        LDRB     R0,[SP, #+0]
        CMP      R0,#+3
        BNE.N    ??f_getfree_15
        MOVS     R0,#+1
        LDR      R1,[R4, #+0]
        STRB     R0,[R1, #+5]
// 3510             *nclst = n;
??f_getfree_15:
        LDR      R0,[SP, #+8]
        STR      R6,[R0, #+0]
// 3511         }
// 3512     }
// 3513     LEAVE_FF(*fatfs, res);
??f_getfree_0:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        POP      {R1-R11,PC}      ;; return
          CFI EndBlock cfiBlock33
// 3514 }
// 3515 
// 3516 
// 3517 
// 3518 
// 3519 /*-----------------------------------------------------------------------*/
// 3520 /* Truncate File                                                         */
// 3521 /*-----------------------------------------------------------------------*/
// 3522 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock34 Using cfiCommon0
          CFI Function f_truncate
        THUMB
// 3523 FRESULT f_truncate (
// 3524     FIL *fp     /* Pointer to the file object */
// 3525 )
// 3526 {
f_truncate:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
// 3527     FRESULT res;
// 3528     uint32 ncl;
// 3529 
// 3530 
// 3531     res = validate(fp->fs, fp->id);     /* Check validity of the object */
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
          CFI FunCall validate
        BL       validate
        MOVS     R5,R0
// 3532     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_truncate_0
// 3533     {
// 3534         if (fp->flag & FA__ERROR)           /* Check abort flag */
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+24
        BPL.N    ??f_truncate_1
// 3535         {
// 3536             res = FR_INT_ERR;
        MOVS     R0,#+2
        MOVS     R5,R0
        B.N      ??f_truncate_0
// 3537         }
// 3538         else
// 3539         {
// 3540             if (!(fp->flag & FA_WRITE))     /* Check access mode */
??f_truncate_1:
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+30
        BMI.N    ??f_truncate_0
// 3541                 res = FR_DENIED;
        MOVS     R0,#+7
        MOVS     R5,R0
// 3542         }
// 3543     }
// 3544     if (res == FR_OK)
??f_truncate_0:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_truncate_2
// 3545     {
// 3546         if (fp->fsize > fp->fptr)
        LDR      R0,[R4, #+8]
        LDR      R1,[R4, #+12]
        CMP      R0,R1
        BCS.N    ??f_truncate_3
// 3547         {
// 3548             fp->fsize = fp->fptr;   /* Set file size to current R/W point */
        LDR      R0,[R4, #+8]
        STR      R0,[R4, #+12]
// 3549             fp->flag |= FA__WRITTEN;
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x20
        STRB     R0,[R4, #+6]
// 3550             if (fp->fptr == 0)      /* When set file size to zero, remove entire cluster chain */
        LDR      R0,[R4, #+8]
        CMP      R0,#+0
        BNE.N    ??f_truncate_4
// 3551             {
// 3552                 res = remove_chain(fp->fs, fp->sclust);
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
          CFI FunCall remove_chain
        BL       remove_chain
        MOVS     R5,R0
// 3553                 fp->sclust = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
        B.N      ??f_truncate_3
// 3554             }
// 3555             else                /* When truncate a part of the file, remove remaining clusters */
// 3556             {
// 3557                 ncl = get_fat(fp->fs, fp->clust);
??f_truncate_4:
        LDR      R1,[R4, #+20]
        LDR      R0,[R4, #+0]
          CFI FunCall get_fat
        BL       get_fat
        MOVS     R6,R0
// 3558                 res = FR_OK;
        MOVS     R0,#+0
        MOVS     R5,R0
// 3559                 if (ncl == 0xFFFFFFFF) res = FR_DISK_ERR;
        CMN      R6,#+1
        BNE.N    ??f_truncate_5
        MOVS     R0,#+1
        MOVS     R5,R0
// 3560                 if (ncl == 1) res = FR_INT_ERR;
??f_truncate_5:
        CMP      R6,#+1
        BNE.N    ??f_truncate_6
        MOVS     R0,#+2
        MOVS     R5,R0
// 3561                 if (res == FR_OK && ncl < fp->fs->n_fatent)
??f_truncate_6:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_truncate_3
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+24]
        CMP      R6,R0
        BCS.N    ??f_truncate_3
// 3562                 {
// 3563                     res = put_fat(fp->fs, fp->clust, 0x0FFFFFFF);
        MVNS     R2,#-268435456
        LDR      R1,[R4, #+20]
        LDR      R0,[R4, #+0]
          CFI FunCall put_fat
        BL       put_fat
        MOVS     R5,R0
// 3564                     if (res == FR_OK) res = remove_chain(fp->fs, ncl);
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_truncate_3
        MOVS     R1,R6
        LDR      R0,[R4, #+0]
          CFI FunCall remove_chain
        BL       remove_chain
        MOVS     R5,R0
// 3565                 }
// 3566             }
// 3567         }
// 3568         if (res != FR_OK) fp->flag |= FA__ERROR;
??f_truncate_3:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??f_truncate_2
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
// 3569     }
// 3570 
// 3571     LEAVE_FF(fp->fs, res);
??f_truncate_2:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock34
// 3572 }
// 3573 
// 3574 
// 3575 
// 3576 
// 3577 /*-----------------------------------------------------------------------*/
// 3578 /* Delete a File or Directory                                            */
// 3579 /*-----------------------------------------------------------------------*/
// 3580 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock35 Using cfiCommon0
          CFI Function f_unlink
        THUMB
// 3581 FRESULT f_unlink (
// 3582     const TCHAR *path       /* Pointer to the file or directory path */
// 3583 )
// 3584 {
f_unlink:
        PUSH     {R0,R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+20
        SUB      SP,SP,#+68
          CFI CFA R13+88
// 3585     FRESULT res;
// 3586     DIR dj, sdj;
// 3587     uint8 *dir;
// 3588     uint32 dclst;
// 3589     DEF_NAMEBUF;
// 3590 
// 3591 
// 3592     res = chk_mounted(&path, &dj.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADD      R0,SP,#+68
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOVS     R4,R0
// 3593     if (res == FR_OK)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_unlink_0
// 3594     {
// 3595         INIT_BUF(dj);
        ADD      R0,SP,#+28
        STR      R0,[SP, #+24]
// 3596         res = follow_path(&dj, path);       /* Follow the file path */
        LDR      R1,[SP, #+68]
        ADD      R0,SP,#+0
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R4,R0
// 3597         if (_FS_RPATH && res == FR_OK && (dj.fn[NS] & NS_DOT))
// 3598             res = FR_INVALID_NAME;          /* Cannot remove dot entry */
// 3599 #if _FS_SHARE
// 3600         if (res == FR_OK) res = chk_lock(&dj, 2);   /* Cannot remove open file */
// 3601 #endif
// 3602         if (res == FR_OK)                   /* The object is accessible */
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_unlink_0
// 3603         {
// 3604             dir = dj.dir;
        LDR      R0,[SP, #+20]
        MOVS     R5,R0
// 3605             if (!dir)
        CMP      R5,#+0
        BNE.N    ??f_unlink_1
// 3606             {
// 3607                 res = FR_INVALID_NAME;      /* Cannot remove the start directory */
        MOVS     R0,#+6
        MOVS     R4,R0
        B.N      ??f_unlink_2
// 3608             }
// 3609             else
// 3610             {
// 3611                 if (dir[DIR_Attr] & AM_RDO)
??f_unlink_1:
        LDRB     R0,[R5, #+11]
        LSLS     R0,R0,#+31
        BPL.N    ??f_unlink_2
// 3612                     res = FR_DENIED;        /* Cannot remove R/O object */
        MOVS     R0,#+7
        MOVS     R4,R0
// 3613             }
// 3614             dclst = LD_CLUST(dir);
??f_unlink_2:
        LDRB     R0,[R5, #+21]
        LDRB     R1,[R5, #+20]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDRB     R1,[R5, #+27]
        LDRB     R2,[R5, #+26]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R1,R0, LSL #+16
        MOVS     R6,R0
// 3615             if (res == FR_OK && (dir[DIR_Attr] & AM_DIR))   /* Is it a sub-dir? */
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_unlink_3
        LDRB     R0,[R5, #+11]
        LSLS     R0,R0,#+27
        BPL.N    ??f_unlink_3
// 3616             {
// 3617                 if (dclst < 2)
        CMP      R6,#+2
        BCS.N    ??f_unlink_4
// 3618                 {
// 3619                     res = FR_INT_ERR;
        MOVS     R0,#+2
        MOVS     R4,R0
        B.N      ??f_unlink_3
// 3620                 }
// 3621                 else
// 3622                 {
// 3623                     mem_cpy(&sdj, &dj, sizeof(DIR));    /* Check if the sub-dir is empty or not */
??f_unlink_4:
        MOVS     R2,#+28
        ADD      R1,SP,#+0
        ADD      R0,SP,#+40
          CFI FunCall mem_cpy
        BL       mem_cpy
// 3624                     sdj.sclust = dclst;
        STR      R6,[SP, #+48]
// 3625                     res = dir_sdi(&sdj, 2);     /* Exclude dot entries */
        MOVS     R1,#+2
        ADD      R0,SP,#+40
          CFI FunCall dir_sdi
        BL       dir_sdi
        MOVS     R4,R0
// 3626                     if (res == FR_OK)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_unlink_3
// 3627                     {
// 3628                         res = dir_read(&sdj);
        ADD      R0,SP,#+40
          CFI FunCall dir_read
        BL       dir_read
        MOVS     R4,R0
// 3629                         if (res == FR_OK            /* Not empty dir */
// 3630 #if _FS_RPATH
// 3631                                 || dclst == sdj.fs->cdir    /* Current dir */
// 3632 #endif
// 3633                            ) res = FR_DENIED;
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_unlink_5
        MOVS     R0,#+7
        MOVS     R4,R0
// 3634                         if (res == FR_NO_FILE) res = FR_OK; /* Empty */
??f_unlink_5:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BNE.N    ??f_unlink_3
        MOVS     R0,#+0
        MOVS     R4,R0
// 3635                     }
// 3636                 }
// 3637             }
// 3638             if (res == FR_OK)
??f_unlink_3:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_unlink_0
// 3639             {
// 3640                 res = dir_remove(&dj);      /* Remove the directory entry */
        ADD      R0,SP,#+0
          CFI FunCall dir_remove
        BL       dir_remove
        MOVS     R4,R0
// 3641                 if (res == FR_OK)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_unlink_0
// 3642                 {
// 3643                     if (dclst)              /* Remove the cluster chain if exist */
        CMP      R6,#+0
        BEQ.N    ??f_unlink_6
// 3644                         res = remove_chain(dj.fs, dclst);
        MOVS     R1,R6
        LDR      R0,[SP, #+0]
          CFI FunCall remove_chain
        BL       remove_chain
        MOVS     R4,R0
// 3645                     if (res == FR_OK) res = sync(dj.fs);
??f_unlink_6:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_unlink_0
        LDR      R0,[SP, #+0]
          CFI FunCall sync
        BL       sync
        MOVS     R4,R0
// 3646                 }
// 3647             }
// 3648         }
// 3649         FREE_BUF();
// 3650     }
// 3651     LEAVE_FF(dj.fs, res);
??f_unlink_0:
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+72
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock35
// 3652 }
// 3653 
// 3654 
// 3655 
// 3656 
// 3657 /*-----------------------------------------------------------------------*/
// 3658 /* Create a Directory                                                    */
// 3659 /*-----------------------------------------------------------------------*/
// 3660 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock36 Using cfiCommon0
          CFI Function f_mkdir
        THUMB
// 3661 FRESULT f_mkdir (
// 3662     const TCHAR *path       /* Pointer to the directory path */
// 3663 )
// 3664 {
f_mkdir:
        PUSH     {R0,R4-R10,LR}
          CFI R14 Frame(CFA, -4)
          CFI R10 Frame(CFA, -8)
          CFI R9 Frame(CFA, -12)
          CFI R8 Frame(CFA, -16)
          CFI R7 Frame(CFA, -20)
          CFI R6 Frame(CFA, -24)
          CFI R5 Frame(CFA, -28)
          CFI R4 Frame(CFA, -32)
          CFI CFA R13+36
        SUB      SP,SP,#+44
          CFI CFA R13+80
// 3665     FRESULT res;
// 3666     DIR dj;
// 3667     uint8 *dir, n;
// 3668     uint32 dsc, dcl, pcl, tim = get_fattime();
          CFI FunCall get_fattime
        BL       get_fattime
        MOV      R10,R0
// 3669     DEF_NAMEBUF;
// 3670 
// 3671 
// 3672     res = chk_mounted(&path, &dj.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADD      R0,SP,#+44
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOVS     R4,R0
// 3673     if (res == FR_OK)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.W    ??f_mkdir_0
// 3674     {
// 3675         INIT_BUF(dj);
        ADD      R0,SP,#+28
        STR      R0,[SP, #+24]
// 3676         res = follow_path(&dj, path);           /* Follow the file path */
        LDR      R1,[SP, #+44]
        ADD      R0,SP,#+0
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R4,R0
// 3677         if (res == FR_OK) res = FR_EXIST;       /* Any object with same name is already existing */
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_mkdir_1
        MOVS     R0,#+8
        MOVS     R4,R0
// 3678         if (_FS_RPATH && res == FR_NO_FILE && (dj.fn[NS] & NS_DOT))
// 3679             res = FR_INVALID_NAME;
// 3680         if (res == FR_NO_FILE)                  /* Can create a new directory */
??f_mkdir_1:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BNE.W    ??f_mkdir_0
// 3681         {
// 3682             dcl = create_chain(dj.fs, 0);       /* Allocate a cluster for the new directory table */
        MOVS     R1,#+0
        LDR      R0,[SP, #+0]
          CFI FunCall create_chain
        BL       create_chain
        MOV      R8,R0
// 3683             res = FR_OK;
        MOVS     R0,#+0
        MOVS     R4,R0
// 3684             if (dcl == 0) res = FR_DENIED;      /* No space to allocate a new cluster */
        CMP      R8,#+0
        BNE.N    ??f_mkdir_2
        MOVS     R0,#+7
        MOVS     R4,R0
// 3685             if (dcl == 1) res = FR_INT_ERR;
??f_mkdir_2:
        CMP      R8,#+1
        BNE.N    ??f_mkdir_3
        MOVS     R0,#+2
        MOVS     R4,R0
// 3686             if (dcl == 0xFFFFFFFF) res = FR_DISK_ERR;
??f_mkdir_3:
        CMN      R8,#+1
        BNE.N    ??f_mkdir_4
        MOVS     R0,#+1
        MOVS     R4,R0
// 3687             if (res == FR_OK)                   /* Flush FAT */
??f_mkdir_4:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_mkdir_5
// 3688                 res = move_window(dj.fs, 0);
        MOVS     R1,#+0
        LDR      R0,[SP, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R4,R0
// 3689             if (res == FR_OK)                   /* Initialize the new directory table */
??f_mkdir_5:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_mkdir_6
// 3690             {
// 3691                 dsc = clust2sect(dj.fs, dcl);
        MOV      R1,R8
        LDR      R0,[SP, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        MOVS     R7,R0
// 3692                 dir = dj.fs->win;
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+48
        MOVS     R5,R0
// 3693                 mem_set(dir, 0, SS(dj.fs));
        MOV      R2,#+512
        MOVS     R1,#+0
        MOVS     R0,R5
          CFI FunCall mem_set
        BL       mem_set
// 3694                 mem_set(dir + DIR_Name, ' ', 8 + 3);    /* Create "." entry */
        MOVS     R2,#+11
        MOVS     R1,#+32
        MOVS     R0,R5
          CFI FunCall mem_set
        BL       mem_set
// 3695                 dir[DIR_Name] = '.';
        MOVS     R0,#+46
        STRB     R0,[R5, #+0]
// 3696                 dir[DIR_Attr] = AM_DIR;
        MOVS     R0,#+16
        STRB     R0,[R5, #+11]
// 3697                 ST_DWORD(dir + DIR_WrtTime, tim);
        STRB     R10,[R5, #+22]
        MOV      R0,R10
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+23]
        LSRS     R0,R10,#+16
        STRB     R0,[R5, #+24]
        LSRS     R0,R10,#+24
        STRB     R0,[R5, #+25]
// 3698                 ST_CLUST(dir, dcl);
        STRB     R8,[R5, #+26]
        MOV      R0,R8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+27]
        LSRS     R0,R8,#+16
        STRB     R0,[R5, #+20]
        LSRS     R0,R8,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+21]
// 3699                 mem_cpy(dir + SZ_DIR, dir, SZ_DIR);     /* Create ".." entry */
        MOVS     R2,#+32
        MOVS     R1,R5
        ADDS     R0,R5,#+32
          CFI FunCall mem_cpy
        BL       mem_cpy
// 3700                 dir[33] = '.';
        MOVS     R0,#+46
        STRB     R0,[R5, #+33]
// 3701                 pcl = dj.sclust;
        LDR      R0,[SP, #+8]
        MOV      R9,R0
// 3702                 if (dj.fs->fs_type == FS_FAT32 && pcl == dj.fs->dirbase)
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??f_mkdir_7
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+36]
        CMP      R9,R0
        BNE.N    ??f_mkdir_7
// 3703                     pcl = 0;
        MOVS     R0,#+0
        MOV      R9,R0
// 3704                 ST_CLUST(dir + SZ_DIR, pcl);
??f_mkdir_7:
        STRB     R9,[R5, #+58]
        MOV      R0,R9
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+59]
        LSRS     R0,R9,#+16
        STRB     R0,[R5, #+52]
        LSRS     R0,R9,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+53]
// 3705                 for (n = dj.fs->csize; n; n--)      /* Write dot entries and clear following sectors */
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+2]
        MOVS     R6,R0
??f_mkdir_8:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??f_mkdir_6
// 3706                 {
// 3707                     dj.fs->winsect = dsc++;
        LDR      R0,[SP, #+0]
        STR      R7,[R0, #+44]
        ADDS     R7,R7,#+1
// 3708                     dj.fs->wflag = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+0]
        STRB     R0,[R1, #+4]
// 3709                     res = move_window(dj.fs, 0);
        MOVS     R1,#+0
        LDR      R0,[SP, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R4,R0
// 3710                     if (res != FR_OK) break;
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_mkdir_6
// 3711                     mem_set(dir, 0, SS(dj.fs));
??f_mkdir_9:
        MOV      R2,#+512
        MOVS     R1,#+0
        MOVS     R0,R5
          CFI FunCall mem_set
        BL       mem_set
// 3712                 }
        SUBS     R6,R6,#+1
        B.N      ??f_mkdir_8
// 3713             }
// 3714             if (res == FR_OK) res = dir_register(&dj);  /* Register the object to the directoy */
??f_mkdir_6:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_mkdir_10
        ADD      R0,SP,#+0
          CFI FunCall dir_register
        BL       dir_register
        MOVS     R4,R0
// 3715             if (res != FR_OK)
??f_mkdir_10:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??f_mkdir_11
// 3716             {
// 3717                 remove_chain(dj.fs, dcl);           /* Could not register, remove cluster chain */
        MOV      R1,R8
        LDR      R0,[SP, #+0]
          CFI FunCall remove_chain
        BL       remove_chain
        B.N      ??f_mkdir_0
// 3718             }
// 3719             else
// 3720             {
// 3721                 dir = dj.dir;
??f_mkdir_11:
        LDR      R0,[SP, #+20]
        MOVS     R5,R0
// 3722                 dir[DIR_Attr] = AM_DIR;             /* Attribute */
        MOVS     R0,#+16
        STRB     R0,[R5, #+11]
// 3723                 ST_DWORD(dir + DIR_WrtTime, tim);       /* Created time */
        STRB     R10,[R5, #+22]
        MOV      R0,R10
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+23]
        LSRS     R0,R10,#+16
        STRB     R0,[R5, #+24]
        LSRS     R0,R10,#+24
        STRB     R0,[R5, #+25]
// 3724                 ST_CLUST(dir, dcl);                 /* Table start cluster */
        STRB     R8,[R5, #+26]
        MOV      R0,R8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+27]
        LSRS     R0,R8,#+16
        STRB     R0,[R5, #+20]
        LSRS     R0,R8,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+21]
// 3725                 dj.fs->wflag = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+0]
        STRB     R0,[R1, #+4]
// 3726                 res = sync(dj.fs);
        LDR      R0,[SP, #+0]
          CFI FunCall sync
        BL       sync
        MOVS     R4,R0
// 3727             }
// 3728         }
// 3729         FREE_BUF();
// 3730     }
// 3731 
// 3732     LEAVE_FF(dj.fs, res);
??f_mkdir_0:
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+48
          CFI CFA R13+32
        POP      {R4-R10,PC}      ;; return
          CFI EndBlock cfiBlock36
// 3733 }
// 3734 
// 3735 
// 3736 
// 3737 
// 3738 /*-----------------------------------------------------------------------*/
// 3739 /* Change Attribute                                                      */
// 3740 /*-----------------------------------------------------------------------*/
// 3741 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock37 Using cfiCommon0
          CFI Function f_chmod
        THUMB
// 3742 FRESULT f_chmod (
// 3743     const TCHAR *path,  /* Pointer to the file path */
// 3744     uint8 value,            /* Attribute bits */
// 3745     uint8 mask          /* Attribute mask to change */
// 3746 )
// 3747 {
f_chmod:
        PUSH     {R0,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        SUB      SP,SP,#+40
          CFI CFA R13+64
        MOVS     R4,R1
        MOVS     R7,R2
// 3748     FRESULT res;
// 3749     DIR dj;
// 3750     uint8 *dir;
// 3751     DEF_NAMEBUF;
// 3752 
// 3753 
// 3754     res = chk_mounted(&path, &dj.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADD      R0,SP,#+40
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOVS     R5,R0
// 3755     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_chmod_0
// 3756     {
// 3757         INIT_BUF(dj);
        ADD      R0,SP,#+28
        STR      R0,[SP, #+24]
// 3758         res = follow_path(&dj, path);       /* Follow the file path */
        LDR      R1,[SP, #+40]
        ADD      R0,SP,#+0
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 3759         FREE_BUF();
// 3760         if (_FS_RPATH && res == FR_OK && (dj.fn[NS] & NS_DOT))
// 3761             res = FR_INVALID_NAME;
// 3762         if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_chmod_0
// 3763         {
// 3764             dir = dj.dir;
        LDR      R0,[SP, #+20]
        MOVS     R6,R0
// 3765             if (!dir)                       /* Is it a root directory? */
        CMP      R6,#+0
        BNE.N    ??f_chmod_1
// 3766             {
// 3767                 res = FR_INVALID_NAME;
        MOVS     R0,#+6
        MOVS     R5,R0
        B.N      ??f_chmod_0
// 3768             }
// 3769             else                        /* File or sub directory */
// 3770             {
// 3771                 mask &= AM_RDO | AM_HID | AM_SYS | AM_ARC;  /* Valid attribute mask */
??f_chmod_1:
        ANDS     R7,R7,#0x27
// 3772                 dir[DIR_Attr] = (value & mask) | (dir[DIR_Attr] & (uint8)~mask);    /* Apply attribute change */
        ANDS     R0,R7,R4
        LDRB     R1,[R6, #+11]
        BICS     R1,R1,R7
        ORRS     R0,R1,R0
        STRB     R0,[R6, #+11]
// 3773                 dj.fs->wflag = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+0]
        STRB     R0,[R1, #+4]
// 3774                 res = sync(dj.fs);
        LDR      R0,[SP, #+0]
          CFI FunCall sync
        BL       sync
        MOVS     R5,R0
// 3775             }
// 3776         }
// 3777     }
// 3778 
// 3779     LEAVE_FF(dj.fs, res);
??f_chmod_0:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+44
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock37
// 3780 }
// 3781 
// 3782 
// 3783 
// 3784 
// 3785 /*-----------------------------------------------------------------------*/
// 3786 /* Change Timestamp                                                      */
// 3787 /*-----------------------------------------------------------------------*/
// 3788 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock38 Using cfiCommon0
          CFI Function f_utime
        THUMB
// 3789 FRESULT f_utime (
// 3790     const TCHAR *path,  /* Pointer to the file/directory name */
// 3791     const FILINFO *fno  /* Pointer to the time stamp to be set */
// 3792 )
// 3793 {
f_utime:
        PUSH     {R0,R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+20
        SUB      SP,SP,#+44
          CFI CFA R13+64
        MOVS     R4,R1
// 3794     FRESULT res;
// 3795     DIR dj;
// 3796     uint8 *dir;
// 3797     DEF_NAMEBUF;
// 3798 
// 3799 
// 3800     res = chk_mounted(&path, &dj.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADD      R0,SP,#+44
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOVS     R5,R0
// 3801     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_utime_0
// 3802     {
// 3803         INIT_BUF(dj);
        ADD      R0,SP,#+28
        STR      R0,[SP, #+24]
// 3804         res = follow_path(&dj, path);   /* Follow the file path */
        LDR      R1,[SP, #+44]
        ADD      R0,SP,#+0
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 3805         FREE_BUF();
// 3806         if (_FS_RPATH && res == FR_OK && (dj.fn[NS] & NS_DOT))
// 3807             res = FR_INVALID_NAME;
// 3808         if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_utime_0
// 3809         {
// 3810             dir = dj.dir;
        LDR      R0,[SP, #+20]
        MOVS     R6,R0
// 3811             if (!dir)                   /* Root directory */
        CMP      R6,#+0
        BNE.N    ??f_utime_1
// 3812             {
// 3813                 res = FR_INVALID_NAME;
        MOVS     R0,#+6
        MOVS     R5,R0
        B.N      ??f_utime_0
// 3814             }
// 3815             else                    /* File or sub-directory */
// 3816             {
// 3817                 ST_WORD(dir + DIR_WrtTime, fno->ftime);
??f_utime_1:
        LDRH     R0,[R4, #+6]
        STRB     R0,[R6, #+22]
        LDRH     R0,[R4, #+6]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R6, #+23]
// 3818                 ST_WORD(dir + DIR_WrtDate, fno->fdate);
        LDRH     R0,[R4, #+4]
        STRB     R0,[R6, #+24]
        LDRH     R0,[R4, #+4]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R6, #+25]
// 3819                 dj.fs->wflag = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+0]
        STRB     R0,[R1, #+4]
// 3820                 res = sync(dj.fs);
        LDR      R0,[SP, #+0]
          CFI FunCall sync
        BL       sync
        MOVS     R5,R0
// 3821             }
// 3822         }
// 3823     }
// 3824 
// 3825     LEAVE_FF(dj.fs, res);
??f_utime_0:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+48
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock38
// 3826 }
// 3827 
// 3828 
// 3829 
// 3830 
// 3831 /*-----------------------------------------------------------------------*/
// 3832 /* Rename File/Directory                                                 */
// 3833 /*-----------------------------------------------------------------------*/
// 3834 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock39 Using cfiCommon0
          CFI Function f_rename
        THUMB
// 3835 FRESULT f_rename (
// 3836     const TCHAR *path_old,  /* Pointer to the old name */
// 3837     const TCHAR *path_new   /* Pointer to the new name */
// 3838 )
// 3839 {
f_rename:
        PUSH     {R0,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        SUB      SP,SP,#+96
          CFI CFA R13+120
        MOVS     R4,R1
// 3840     FRESULT res;
// 3841     DIR djo, djn;
// 3842     uint8 buf[21], *dir;
// 3843     uint32 dw;
// 3844     DEF_NAMEBUF;
// 3845 
// 3846 
// 3847     res = chk_mounted(&path_old, &djo.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+28
        ADD      R0,SP,#+96
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOVS     R5,R0
// 3848     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.W    ??f_rename_0
// 3849     {
// 3850         djn.fs = djo.fs;
        LDR      R0,[SP, #+28]
        STR      R0,[SP, #+0]
// 3851         INIT_BUF(djo);
        ADD      R0,SP,#+56
        STR      R0,[SP, #+52]
// 3852         res = follow_path(&djo, path_old);      /* Check old object */
        LDR      R1,[SP, #+96]
        ADD      R0,SP,#+28
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 3853         if (_FS_RPATH && res == FR_OK && (djo.fn[NS] & NS_DOT))
// 3854             res = FR_INVALID_NAME;
// 3855 #if _FS_SHARE
// 3856         if (res == FR_OK) res = chk_lock(&djo, 2);
// 3857 #endif
// 3858         if (res == FR_OK)                       /* Old object is found */
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.W    ??f_rename_0
// 3859         {
// 3860             if (!djo.dir)                       /* Is root dir? */
        LDR      R0,[SP, #+48]
        CMP      R0,#+0
        BNE.N    ??f_rename_1
// 3861             {
// 3862                 res = FR_NO_FILE;
        MOVS     R0,#+4
        MOVS     R5,R0
        B.N      ??f_rename_0
// 3863             }
// 3864             else
// 3865             {
// 3866                 mem_cpy(buf, djo.dir + DIR_Attr, 21);       /* Save the object information except for name */
??f_rename_1:
        MOVS     R2,#+21
        LDR      R0,[SP, #+48]
        ADDS     R1,R0,#+11
        ADD      R0,SP,#+68
          CFI FunCall mem_cpy
        BL       mem_cpy
// 3867                 mem_cpy(&djn, &djo, sizeof(DIR));       /* Check new object */
        MOVS     R2,#+28
        ADD      R1,SP,#+28
        ADD      R0,SP,#+0
          CFI FunCall mem_cpy
        BL       mem_cpy
// 3868                 res = follow_path(&djn, path_new);
        MOVS     R1,R4
        ADD      R0,SP,#+0
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 3869                 if (res == FR_OK) res = FR_EXIST;       /* The new object name is already existing */
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_2
        MOVS     R0,#+8
        MOVS     R5,R0
// 3870                 if (res == FR_NO_FILE)                  /* Is it a valid path and no name collision? */
??f_rename_2:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BNE.N    ??f_rename_0
// 3871                 {
// 3872                     /* Start critical section that any interruption or error can cause cross-link */
// 3873                     res = dir_register(&djn);           /* Register the new entry */
        ADD      R0,SP,#+0
          CFI FunCall dir_register
        BL       dir_register
        MOVS     R5,R0
// 3874                     if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_0
// 3875                     {
// 3876                         dir = djn.dir;                  /* Copy object information except for name */
        LDR      R0,[SP, #+20]
        MOVS     R6,R0
// 3877                         mem_cpy(dir + 13, buf + 2, 19);
        MOVS     R2,#+19
        ADD      R1,SP,#+70
        ADDS     R0,R6,#+13
          CFI FunCall mem_cpy
        BL       mem_cpy
// 3878                         dir[DIR_Attr] = buf[0] | AM_ARC;
        LDRB     R0,[SP, #+68]
        ORRS     R0,R0,#0x20
        STRB     R0,[R6, #+11]
// 3879                         djo.fs->wflag = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+28]
        STRB     R0,[R1, #+4]
// 3880                         if (djo.sclust != djn.sclust && (dir[DIR_Attr] & AM_DIR))       /* Update .. entry in the directory if needed */
        LDR      R0,[SP, #+36]
        LDR      R1,[SP, #+8]
        CMP      R0,R1
        BEQ.N    ??f_rename_3
        LDRB     R0,[R6, #+11]
        LSLS     R0,R0,#+27
        BPL.N    ??f_rename_3
// 3881                         {
// 3882                             dw = clust2sect(djn.fs, LD_CLUST(dir));
        LDRB     R0,[R6, #+21]
        LDRB     R1,[R6, #+20]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDRB     R1,[R6, #+27]
        LDRB     R2,[R6, #+26]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R1,R1,R0, LSL #+16
        LDR      R0,[SP, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        MOVS     R7,R0
// 3883                             if (!dw)
        CMP      R7,#+0
        BNE.N    ??f_rename_4
// 3884                             {
// 3885                                 res = FR_INT_ERR;
        MOVS     R0,#+2
        MOVS     R5,R0
        B.N      ??f_rename_3
// 3886                             }
// 3887                             else
// 3888                             {
// 3889                                 res = move_window(djn.fs, dw);
??f_rename_4:
        MOVS     R1,R7
        LDR      R0,[SP, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
// 3890                                 dir = djn.fs->win + SZ_DIR; /* .. entry */
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+80
        MOVS     R6,R0
// 3891                                 if (res == FR_OK && dir[1] == '.')
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_3
        LDRB     R0,[R6, #+1]
        CMP      R0,#+46
        BNE.N    ??f_rename_3
// 3892                                 {
// 3893                                     dw = (djn.fs->fs_type == FS_FAT32 && djn.sclust == djn.fs->dirbase) ? 0 : djn.sclust;
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??f_rename_5
        LDR      R0,[SP, #+8]
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+36]
        CMP      R0,R1
        BNE.N    ??f_rename_5
        MOVS     R7,#+0
        B.N      ??f_rename_6
??f_rename_5:
        LDR      R7,[SP, #+8]
// 3894                                     ST_CLUST(dir, dw);
??f_rename_6:
        STRB     R7,[R6, #+26]
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R6, #+27]
        LSRS     R0,R7,#+16
        STRB     R0,[R6, #+20]
        LSRS     R0,R7,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R6, #+21]
// 3895                                     djn.fs->wflag = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+0]
        STRB     R0,[R1, #+4]
// 3896                                 }
// 3897                             }
// 3898                         }
// 3899                         if (res == FR_OK)
??f_rename_3:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_0
// 3900                         {
// 3901                             res = dir_remove(&djo);     /* Remove old entry */
        ADD      R0,SP,#+28
          CFI FunCall dir_remove
        BL       dir_remove
        MOVS     R5,R0
// 3902                             if (res == FR_OK)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_0
// 3903                                 res = sync(djo.fs);
        LDR      R0,[SP, #+28]
          CFI FunCall sync
        BL       sync
        MOVS     R5,R0
// 3904                         }
// 3905                     }
// 3906                     /* End critical section */
// 3907                 }
// 3908             }
// 3909         }
// 3910         FREE_BUF();
// 3911     }
// 3912     LEAVE_FF(djo.fs, res);
??f_rename_0:
        MOVS     R0,R5
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+100
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock39
// 3913 }
// 3914 
// 3915 #endif /* !_FS_READONLY */
// 3916 #endif /* _FS_MINIMIZE == 0 */
// 3917 #endif /* _FS_MINIMIZE <= 1 */
// 3918 #endif /* _FS_MINIMIZE <= 2 */
// 3919 
// 3920 
// 3921 
// 3922 /*-----------------------------------------------------------------------*/
// 3923 /* Forward data to the stream directly (available on only tiny cfg)      */
// 3924 /*-----------------------------------------------------------------------*/
// 3925 #if _USE_FORWARD && _FS_TINY
// 3926 
// 3927 FRESULT f_forward (
// 3928     FIL *fp,                        /* Pointer to the file object */
// 3929     UINT (*func)(const uint8 *, uint32),    /* Pointer to the streaming function */
// 3930     uint32 btr,                     /* Number of bytes to forward */
// 3931     uint32 *bf                      /* Pointer to number of bytes forwarded */
// 3932 )
// 3933 {
// 3934     FRESULT res;
// 3935     uint32 remain, clst, sect;
// 3936     uint32 rcnt;
// 3937     uint8 csect;
// 3938 
// 3939 
// 3940     *bf = 0;    /* Initialize byte counter */
// 3941 
// 3942     res = validate(fp->fs, fp->id);                 /* Check validity of the object */
// 3943     if (res != FR_OK) LEAVE_FF(fp->fs, res);
// 3944     if (fp->flag & FA__ERROR)                       /* Check error flag */
// 3945         LEAVE_FF(fp->fs, FR_INT_ERR);
// 3946     if (!(fp->flag & FA_READ))                      /* Check access mode */
// 3947         LEAVE_FF(fp->fs, FR_DENIED);
// 3948 
// 3949     remain = fp->fsize - fp->fptr;
// 3950     if (btr > remain) btr = (uint32)remain;         /* Truncate btr by remaining bytes */
// 3951 
// 3952     for ( ;  btr && (*func)(0, 0);                  /* Repeat until all data transferred or stream becomes busy */
// 3953             fp->fptr += rcnt, *bf += rcnt, btr -= rcnt)
// 3954     {
// 3955         csect = (uint8)(fp->fptr / SS(fp->fs) & (fp->fs->csize - 1));   /* Sector offset in the cluster */
// 3956         if ((fp->fptr % SS(fp->fs)) == 0)           /* On the sector boundary? */
// 3957         {
// 3958             if (!csect)                             /* On the cluster boundary? */
// 3959             {
// 3960                 clst = (fp->fptr == 0) ?            /* On the top of the file? */
// 3961                        fp->sclust : get_fat(fp->fs, fp->clust);
// 3962                 if (clst <= 1) ABORT(fp->fs, FR_INT_ERR);
// 3963                 if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
// 3964                 fp->clust = clst;                   /* Update current cluster */
// 3965             }
// 3966         }
// 3967         sect = clust2sect(fp->fs, fp->clust);       /* Get current data sector */
// 3968         if (!sect) ABORT(fp->fs, FR_INT_ERR);
// 3969         sect += csect;
// 3970         if (move_window(fp->fs, sect))              /* Move sector window */
// 3971             ABORT(fp->fs, FR_DISK_ERR);
// 3972         fp->dsect = sect;
// 3973         rcnt = SS(fp->fs) - (uint16)(fp->fptr % SS(fp->fs));    /* Forward data from sector window */
// 3974         if (rcnt > btr) rcnt = btr;
// 3975         rcnt = (*func)(&fp->fs->win[(uint16)fp->fptr % SS(fp->fs)], rcnt);
// 3976         if (!rcnt) ABORT(fp->fs, FR_INT_ERR);
// 3977     }
// 3978 
// 3979     LEAVE_FF(fp->fs, FR_OK);
// 3980 }
// 3981 #endif /* _USE_FORWARD */
// 3982 
// 3983 
// 3984 
// 3985 #if _USE_MKFS && !_FS_READONLY
// 3986 /*-----------------------------------------------------------------------*/
// 3987 /* Create File System on the Drive                                       */
// 3988 /*-----------------------------------------------------------------------*/
// 3989 #define N_ROOTDIR   512     /* Number of root dir entries for FAT12/16 */
// 3990 #define N_FATS      1       /* Number of FAT copies (1 or 2) */
// 3991 
// 3992 
// 3993 FRESULT f_mkfs (
// 3994     uint8 drv,      /* Logical drive number */
// 3995     uint8 sfd,      /* Partitioning rule 0:FDISK, 1:SFD */
// 3996     uint32 au           /* Allocation unit size [bytes] */
// 3997 )
// 3998 {
// 3999     static const uint16 vst[] = { 1024,   512,  256,  128,   64,    32,   16,    8,    4,    2,   0};
// 4000     static const uint16 cst[] = {32768, 16384, 8192, 4096, 2048, 16384, 8192, 4096, 2048, 1024, 512};
// 4001     uint8 fmt, md, sys, *tbl, pdrv, part;
// 4002     uint32 n_clst, vs, n, wsect;
// 4003     uint32 i;
// 4004     uint32 b_vol, b_fat, b_dir, b_data; /* LBA */
// 4005     uint32 n_vol, n_rsv, n_fat, n_dir;  /* Size */
// 4006     FATFS *fs;
// 4007     DSTATUS stat;
// 4008 
// 4009 
// 4010     /* Check mounted drive and clear work area */
// 4011     if (drv >= _VOLUMES) return FR_INVALID_DRIVE;
// 4012     if (sfd > 1) return FR_INVALID_PARAMETER;
// 4013     if (au & (au - 1)) return FR_INVALID_PARAMETER;
// 4014     fs = FatFs[drv];
// 4015     if (!fs) return FR_NOT_ENABLED;
// 4016     fs->fs_type = 0;
// 4017     pdrv = LD2PD(drv);  /* Physical drive */
// 4018     part = LD2PT(drv);  /* Partition (0:auto detect, 1-4:get from partition table)*/
// 4019 
// 4020     /* Get disk statics */
// 4021     stat = disk_initialize(pdrv);
// 4022     if (stat & STA_NOINIT) return FR_NOT_READY;
// 4023     if (stat & STA_PROTECT) return FR_WRITE_PROTECTED;
// 4024 #if _MAX_SS != 512                  /* Get disk sector size */
// 4025     if (disk_ioctl(pdrv, GET_SECTOR_SIZE, &SS(fs)) != RES_OK || SS(fs) > _MAX_SS)
// 4026         return FR_DISK_ERR;
// 4027 #endif
// 4028     if (_MULTI_PARTITION && part)
// 4029     {
// 4030         /* Get partition information from partition table in the MBR */
// 4031         if (disk_read(pdrv, fs->win, 0, 1) != RES_OK) return FR_DISK_ERR;
// 4032         if (LD_WORD(fs->win + BS_55AA) != 0xAA55) return FR_MKFS_ABORTED;
// 4033         tbl = &fs->win[MBR_Table + (part - 1) * SZ_PTE];
// 4034         if (!tbl[4]) return FR_MKFS_ABORTED;    /* No partition? */
// 4035         b_vol = LD_DWORD(tbl + 8);  /* Volume start sector */
// 4036         n_vol = LD_DWORD(tbl + 12); /* Volume size */
// 4037     }
// 4038     else
// 4039     {
// 4040         /* Create a partition in this function */
// 4041         if (disk_ioctl(pdrv, GET_SECTOR_COUNT, &n_vol) != RES_OK || n_vol < 128)
// 4042             return FR_DISK_ERR;
// 4043         b_vol = (sfd) ? 0 : 63;     /* Volume start sector */
// 4044         n_vol -= b_vol;             /* Volume size */
// 4045     }
// 4046 
// 4047     if (!au)                /* AU auto selection */
// 4048     {
// 4049         vs = n_vol / (2000 / (SS(fs) / 512));
// 4050         for (i = 0; vs < vst[i]; i++) ;
// 4051         au = cst[i];
// 4052     }
// 4053     au /= SS(fs);       /* Number of sectors per cluster */
// 4054     if (au == 0) au = 1;
// 4055     if (au > 128) au = 128;
// 4056 
// 4057     /* Pre-compute number of clusters and FAT syb-type */
// 4058     n_clst = n_vol / au;
// 4059     fmt = FS_FAT12;
// 4060     if (n_clst >= MIN_FAT16) fmt = FS_FAT16;
// 4061     if (n_clst >= MIN_FAT32) fmt = FS_FAT32;
// 4062 
// 4063     /* Determine offset and size of FAT structure */
// 4064     if (fmt == FS_FAT32)
// 4065     {
// 4066         n_fat = ((n_clst * 4) + 8 + SS(fs) - 1) / SS(fs);
// 4067         n_rsv = 32;
// 4068         n_dir = 0;
// 4069     }
// 4070     else
// 4071     {
// 4072         n_fat = (fmt == FS_FAT12) ? (n_clst * 3 + 1) / 2 + 3 : (n_clst * 2) + 4;
// 4073         n_fat = (n_fat + SS(fs) - 1) / SS(fs);
// 4074         n_rsv = 1;
// 4075         n_dir = (uint32)N_ROOTDIR * SZ_DIR / SS(fs);
// 4076     }
// 4077     b_fat = b_vol + n_rsv;              /* FAT area start sector */
// 4078     b_dir = b_fat + n_fat * N_FATS;     /* Directory area start sector */
// 4079     b_data = b_dir + n_dir;             /* Data area start sector */
// 4080     if (n_vol < b_data + au - b_vol) return FR_MKFS_ABORTED;    /* Too small volume */
// 4081 
// 4082     /* Align data start sector to erase block boundary (for flash memory media) */
// 4083     if (disk_ioctl(pdrv, GET_BLOCK_SIZE, &n) != RES_OK || !n || n > 32768) n = 1;
// 4084     n = (b_data + n - 1) & ~(n - 1);    /* Next nearest erase block from current data start */
// 4085     n = (n - b_data) / N_FATS;
// 4086     if (fmt == FS_FAT32)        /* FAT32: Move FAT offset */
// 4087     {
// 4088         n_rsv += n;
// 4089         b_fat += n;
// 4090     }
// 4091     else                    /* FAT12/16: Expand FAT size */
// 4092     {
// 4093         n_fat += n;
// 4094     }
// 4095 
// 4096     /* Determine number of clusters and final check of validity of the FAT sub-type */
// 4097     n_clst = (n_vol - n_rsv - n_fat * N_FATS - n_dir) / au;
// 4098     if (   (fmt == FS_FAT16 && n_clst < MIN_FAT16)
// 4099             || (fmt == FS_FAT32 && n_clst < MIN_FAT32))
// 4100         return FR_MKFS_ABORTED;
// 4101 
// 4102     switch (fmt)    /* Determine system ID for partition table */
// 4103     {
// 4104     case FS_FAT12:
// 4105         sys = 0x01;
// 4106         break;
// 4107     case FS_FAT16:
// 4108         sys = (n_vol < 0x10000) ? 0x04 : 0x06;
// 4109         break;
// 4110     default:
// 4111         sys = 0x0C;
// 4112     }
// 4113 
// 4114     if (_MULTI_PARTITION && part)
// 4115     {
// 4116         /* Update system ID in the partition table */
// 4117         tbl = &fs->win[MBR_Table + (part - 1) * SZ_PTE];
// 4118         tbl[4] = sys;
// 4119         if (disk_write(pdrv, fs->win, 0, 1) != RES_OK) return FR_DISK_ERR;
// 4120         md = 0xF8;
// 4121     }
// 4122     else
// 4123     {
// 4124         if (sfd)    /* No patition table (SFD) */
// 4125         {
// 4126             md = 0xF0;
// 4127         }
// 4128         else    /* Create partition table (FDISK) */
// 4129         {
// 4130             mem_set(fs->win, 0, SS(fs));
// 4131             tbl = fs->win + MBR_Table;  /* Create partiton table for single partition in the drive */
// 4132             tbl[1] = 1;                     /* Partition start head */
// 4133             tbl[2] = 1;                     /* Partition start sector */
// 4134             tbl[3] = 0;                     /* Partition start cylinder */
// 4135             tbl[4] = sys;                   /* System type */
// 4136             tbl[5] = 254;                   /* Partition end head */
// 4137             n = (b_vol + n_vol) / 63 / 255;
// 4138             tbl[6] = (uint8)((n >> 2) | 63);    /* Partiiton end sector */
// 4139             tbl[7] = (uint8)n;              /* End cylinder */
// 4140             ST_DWORD(tbl + 8, 63);          /* Partition start in LBA */
// 4141             ST_DWORD(tbl + 12, n_vol);      /* Partition size in LBA */
// 4142             ST_WORD(fs->win + BS_55AA, 0xAA55); /* MBR signature */
// 4143             if (disk_write(pdrv, fs->win, 0, 1) != RES_OK)  /* Write it to the MBR sector */
// 4144                 return FR_DISK_ERR;
// 4145             md = 0xF8;
// 4146         }
// 4147     }
// 4148 
// 4149     /* Create BPB in the VBR */
// 4150     tbl = fs->win;                          /* Clear sector */
// 4151     mem_set(tbl, 0, SS(fs));
// 4152     mem_cpy(tbl, "\xEB\xFE\x90" "MSDOS5.0", 11);/* Boot jump code, OEM name */
// 4153     i = SS(fs);                             /* Sector size */
// 4154     ST_WORD(tbl + BPB_BytsPerSec, i);
// 4155     tbl[BPB_SecPerClus] = (uint8)au;            /* Sectors per cluster */
// 4156     ST_WORD(tbl + BPB_RsvdSecCnt, n_rsv);       /* Reserved sectors */
// 4157     tbl[BPB_NumFATs] = N_FATS;              /* Number of FATs */
// 4158     i = (fmt == FS_FAT32) ? 0 : N_ROOTDIR;  /* Number of rootdir entries */
// 4159     ST_WORD(tbl + BPB_RootEntCnt, i);
// 4160     if (n_vol < 0x10000)                    /* Number of total sectors */
// 4161     {
// 4162         ST_WORD(tbl + BPB_TotSec16, n_vol);
// 4163     }
// 4164     else
// 4165     {
// 4166         ST_DWORD(tbl + BPB_TotSec32, n_vol);
// 4167     }
// 4168     tbl[BPB_Media] = md;                    /* Media descriptor */
// 4169     ST_WORD(tbl + BPB_SecPerTrk, 63);           /* Number of sectors per track */
// 4170     ST_WORD(tbl + BPB_NumHeads, 255);           /* Number of heads */
// 4171     ST_DWORD(tbl + BPB_HiddSec, b_vol);     /* Hidden sectors */
// 4172     n = get_fattime();                      /* Use current time as VSN */
// 4173     if (fmt == FS_FAT32)
// 4174     {
// 4175         ST_DWORD(tbl + BS_VolID32, n);      /* VSN */
// 4176         ST_DWORD(tbl + BPB_FATSz32, n_fat); /* Number of sectors per FAT */
// 4177         ST_DWORD(tbl + BPB_RootClus, 2);        /* Root directory start cluster (2) */
// 4178         ST_WORD(tbl + BPB_FSInfo, 1);           /* FSInfo record offset (VBR+1) */
// 4179         ST_WORD(tbl + BPB_BkBootSec, 6);        /* Backup boot record offset (VBR+6) */
// 4180         tbl[BS_DrvNum32] = 0x80;            /* Drive number */
// 4181         tbl[BS_BootSig32] = 0x29;           /* Extended boot signature */
// 4182         mem_cpy(tbl + BS_VolLab32, "NO NAME    " "FAT32   ", 19);   /* Volume label, FAT signature */
// 4183     }
// 4184     else
// 4185     {
// 4186         ST_DWORD(tbl + BS_VolID, n);            /* VSN */
// 4187         ST_WORD(tbl + BPB_FATSz16, n_fat);  /* Number of sectors per FAT */
// 4188         tbl[BS_DrvNum] = 0x80;              /* Drive number */
// 4189         tbl[BS_BootSig] = 0x29;             /* Extended boot signature */
// 4190         mem_cpy(tbl + BS_VolLab, "NO NAME    " "FAT     ", 19); /* Volume label, FAT signature */
// 4191     }
// 4192     ST_WORD(tbl + BS_55AA, 0xAA55);         /* Signature (Offset is fixed here regardless of sector size) */
// 4193     if (disk_write(pdrv, tbl, b_vol, 1) != RES_OK)  /* Write it to the VBR sector */
// 4194         return FR_DISK_ERR;
// 4195     if (fmt == FS_FAT32)                            /* Write backup VBR if needed (VBR+6) */
// 4196         disk_write(pdrv, tbl, b_vol + 6, 1);
// 4197 
// 4198     /* Initialize FAT area */
// 4199     wsect = b_fat;
// 4200     for (i = 0; i < N_FATS; i++)        /* Initialize each FAT copy */
// 4201     {
// 4202         mem_set(tbl, 0, SS(fs));            /* 1st sector of the FAT  */
// 4203         n = md;                             /* Media descriptor byte */
// 4204         if (fmt != FS_FAT32)
// 4205         {
// 4206             n |= (fmt == FS_FAT12) ? 0x00FFFF00 : 0xFFFFFF00;
// 4207             ST_DWORD(tbl + 0, n);               /* Reserve cluster #0-1 (FAT12/16) */
// 4208         }
// 4209         else
// 4210         {
// 4211             n |= 0xFFFFFF00;
// 4212             ST_DWORD(tbl + 0, n);               /* Reserve cluster #0-1 (FAT32) */
// 4213             ST_DWORD(tbl + 4, 0xFFFFFFFF);
// 4214             ST_DWORD(tbl + 8, 0x0FFFFFFF);  /* Reserve cluster #2 for root dir */
// 4215         }
// 4216         if (disk_write(pdrv, tbl, wsect++, 1) != RES_OK)
// 4217             return FR_DISK_ERR;
// 4218         mem_set(tbl, 0, SS(fs));            /* Fill following FAT entries with zero */
// 4219         for (n = 1; n < n_fat; n++)         /* This loop may take a time on FAT32 volume due to many single sector writes */
// 4220         {
// 4221             if (disk_write(pdrv, tbl, wsect++, 1) != RES_OK)
// 4222                 return FR_DISK_ERR;
// 4223         }
// 4224     }
// 4225 
// 4226     /* Initialize root directory */
// 4227     i = (fmt == FS_FAT32) ? au : n_dir;
// 4228     do
// 4229     {
// 4230         if (disk_write(pdrv, tbl, wsect++, 1) != RES_OK)
// 4231             return FR_DISK_ERR;
// 4232     }
// 4233     while (--i);
// 4234 
// 4235 #if _USE_ERASE  /* Erase data area if needed */
// 4236     {
// 4237         uint32 eb[2];
// 4238 
// 4239         eb[0] = wsect;
// 4240         eb[1] = wsect + (n_clst - ((fmt == FS_FAT32) ? 1 : 0)) * au - 1;
// 4241         disk_ioctl(pdrv, CTRL_ERASE_SECTOR, eb);
// 4242     }
// 4243 #endif
// 4244 
// 4245     /* Create FSInfo if needed */
// 4246     if (fmt == FS_FAT32)
// 4247     {
// 4248         ST_DWORD(tbl + FSI_LeadSig, 0x41615252);
// 4249         ST_DWORD(tbl + FSI_StrucSig, 0x61417272);
// 4250         ST_DWORD(tbl + FSI_Free_Count, n_clst - 1); /* Number of free clusters */
// 4251         ST_DWORD(tbl + FSI_Nxt_Free, 2);                /* Last allocated cluster# */
// 4252         ST_WORD(tbl + BS_55AA, 0xAA55);
// 4253         disk_write(pdrv, tbl, b_vol + 1, 1);    /* Write original (VBR+1) */
// 4254         disk_write(pdrv, tbl, b_vol + 7, 1);    /* Write backup (VBR+7) */
// 4255     }
// 4256 
// 4257     return (disk_ioctl(pdrv, CTRL_SYNC, 0) == RES_OK) ? FR_OK : FR_DISK_ERR;
// 4258 }
// 4259 
// 4260 
// 4261 #if _MULTI_PARTITION == 2
// 4262 /*-----------------------------------------------------------------------*/
// 4263 /* Divide Physical Drive                                                 */
// 4264 /*-----------------------------------------------------------------------*/
// 4265 
// 4266 FRESULT f_fdisk (
// 4267     uint8 pdrv,         /* Physical drive number */
// 4268     const uint32 szt[], /* Pointer to the size table for each partitions */
// 4269     void *work          /* Pointer to the working buffer */
// 4270 )
// 4271 {
// 4272     uint32 i, n, sz_cyl, tot_cyl, b_cyl, e_cyl, p_cyl;
// 4273     uint8 s_hd, e_hd, *p, *buf = (uint8 *)work;
// 4274     DSTATUS stat;
// 4275     uint32 sz_disk, sz_part, s_part;
// 4276 
// 4277 
// 4278     stat = disk_initialize(pdrv);
// 4279     if (stat & STA_NOINIT) return FR_NOT_READY;
// 4280     if (stat & STA_PROTECT) return FR_WRITE_PROTECTED;
// 4281     if (disk_ioctl(pdrv, GET_SECTOR_COUNT, &sz_disk)) return FR_DISK_ERR;
// 4282 
// 4283     /* Determine CHS in the table regardless of the drive geometry */
// 4284     for (n = 16; n < 256 && sz_disk / n / 63 > 1024; n *= 2) ;
// 4285     if (n == 256) n--;
// 4286     e_hd = n - 1;
// 4287     sz_cyl = 63 * n;
// 4288     tot_cyl = sz_disk / sz_cyl;
// 4289 
// 4290     /* Create partition table */
// 4291     mem_set(buf, 0, _MAX_SS);
// 4292     p = buf + MBR_Table;
// 4293     b_cyl = 0;
// 4294     for (i = 0; i < 4; i++, p += SZ_PTE)
// 4295     {
// 4296         p_cyl = (szt[i] <= 100) ? (uint32)tot_cyl * szt[i] / 100 : szt[i] / sz_cyl;
// 4297         if (!p_cyl) continue;
// 4298         s_part = (uint32)sz_cyl * b_cyl;
// 4299         sz_part = (uint32)sz_cyl * p_cyl;
// 4300         if (i == 0)     /* Exclude first track of cylinder 0 */
// 4301         {
// 4302             s_hd = 1;
// 4303             s_part += 63;
// 4304             sz_part -= 63;
// 4305         }
// 4306         else
// 4307         {
// 4308             s_hd = 0;
// 4309         }
// 4310         e_cyl = b_cyl + p_cyl - 1;
// 4311         if (e_cyl >= tot_cyl) return FR_INVALID_PARAMETER;
// 4312 
// 4313         /* Set partition table */
// 4314         p[1] = s_hd;                        /* Start head */
// 4315         p[2] = (uint8)((b_cyl >> 2) + 1);   /* Start sector */
// 4316         p[3] = (uint8)b_cyl;                    /* Start cylinder */
// 4317         p[4] = 0x06;                        /* System type (temporary setting) */
// 4318         p[5] = e_hd;                        /* End head */
// 4319         p[6] = (uint8)((e_cyl >> 2) + 63);  /* End sector */
// 4320         p[7] = (uint8)e_cyl;                    /* End cylinder */
// 4321         ST_DWORD(p + 8, s_part);            /* Start sector in LBA */
// 4322         ST_DWORD(p + 12, sz_part);          /* Partition size */
// 4323 
// 4324         /* Next partition */
// 4325         b_cyl += p_cyl;
// 4326     }
// 4327     ST_WORD(p, 0xAA55);
// 4328 
// 4329     /* Write it to the MBR */
// 4330     return (disk_write(pdrv, buf, 0, 1) || disk_ioctl(pdrv, CTRL_SYNC, 0)) ? FR_DISK_ERR : FR_OK;
// 4331 }
// 4332 
// 4333 
// 4334 #endif /* _MULTI_PARTITION == 2 */
// 4335 #endif /* _USE_MKFS && !_FS_READONLY */
// 4336 
// 4337 
// 4338 
// 4339 
// 4340 #if _USE_STRFUNC
// 4341 /*-----------------------------------------------------------------------*/
// 4342 /* Get a string from the file                                            */
// 4343 /*-----------------------------------------------------------------------*/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock40 Using cfiCommon0
          CFI Function f_gets
        THUMB
// 4344 TCHAR *f_gets (
// 4345     TCHAR *buff,    /* Pointer to the string buffer to read */
// 4346     int len,        /* Size of string buffer (characters) */
// 4347     FIL *fil        /* Pointer to the file object */
// 4348 )
// 4349 {
f_gets:
        PUSH     {R4-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+28
        SUB      SP,SP,#+12
          CFI CFA R13+40
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
// 4350     int n = 0;
        MOVS     R7,#+0
// 4351     TCHAR c, *p = buff;
        MOV      R9,R4
// 4352     uint8 s[2];
// 4353     uint32 rc;
// 4354 
// 4355 
// 4356     while (n < len - 1)             /* Read bytes until buffer gets filled */
??f_gets_0:
        SUBS     R0,R5,#+1
        CMP      R7,R0
        BGE.N    ??f_gets_1
// 4357     {
// 4358         f_read(fil, s, 1, &rc);
        ADD      R3,SP,#+0
        MOVS     R2,#+1
        ADD      R1,SP,#+4
        MOVS     R0,R6
          CFI FunCall f_read
        BL       f_read
// 4359         if (rc != 1) break;         /* Break on EOF or error */
        LDR      R0,[SP, #+0]
        CMP      R0,#+1
        BNE.N    ??f_gets_1
// 4360         c = s[0];
??f_gets_2:
        LDRSB    R0,[SP, #+4]
        MOV      R8,R0
// 4361 #if _LFN_UNICODE                    /* Read a character in UTF-8 encoding */
// 4362         if (c >= 0x80)
// 4363         {
// 4364             if (c < 0xC0) continue; /* Skip stray trailer */
// 4365             if (c < 0xE0)           /* Two-byte sequense */
// 4366             {
// 4367                 f_read(fil, s, 1, &rc);
// 4368                 if (rc != 1) break;
// 4369                 c = ((c & 0x1F) << 6) | (s[0] & 0x3F);
// 4370                 if (c < 0x80) c = '?';
// 4371             }
// 4372             else
// 4373             {
// 4374                 if (c < 0xF0)       /* Three-byte sequense */
// 4375                 {
// 4376                     f_read(fil, s, 2, &rc);
// 4377                     if (rc != 2) break;
// 4378                     c = (c << 12) | ((s[0] & 0x3F) << 6) | (s[1] & 0x3F);
// 4379                     if (c < 0x800) c = '?';
// 4380                 }
// 4381                 else            /* Reject four-byte sequense */
// 4382                 {
// 4383                     c = '?';
// 4384                 }
// 4385             }
// 4386         }
// 4387 #endif
// 4388 #if _USE_STRFUNC >= 2
// 4389         if (c == '\r') continue;    /* Strip '\r' */
        SXTB     R8,R8            ;; SignExt  R8,R8,#+24,#+24
        CMP      R8,#+13
        BEQ.N    ??f_gets_0
// 4390 #endif
// 4391         *p++ = c;
??f_gets_3:
        STRB     R8,[R9, #+0]
        ADDS     R9,R9,#+1
// 4392         n++;
        ADDS     R7,R7,#+1
// 4393         if (c == '\n') break;       /* Break on EOL */
        SXTB     R8,R8            ;; SignExt  R8,R8,#+24,#+24
        CMP      R8,#+10
        BNE.N    ??f_gets_0
// 4394     }
// 4395     *p = 0;
??f_gets_1:
        MOVS     R0,#+0
        STRB     R0,[R9, #+0]
// 4396     return n ? buff : 0;            /* When no data read (eof or error), return with error. */
        CMP      R7,#+0
        BNE.N    ??f_gets_4
??f_gets_5:
        MOVS     R4,#+0
??f_gets_4:
        MOVS     R0,R4
        POP      {R1-R9,PC}       ;; return
          CFI EndBlock cfiBlock40
// 4397 }
// 4398 
// 4399 
// 4400 
// 4401 #if !_FS_READONLY
// 4402 #include <stdarg.h>
// 4403 /*-----------------------------------------------------------------------*/
// 4404 /* Put a character to the file                                           */
// 4405 /*-----------------------------------------------------------------------*/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock41 Using cfiCommon0
          CFI Function f_putc
        THUMB
// 4406 int f_putc (
// 4407     TCHAR c,    /* A character to be output */
// 4408     FIL *fil    /* Pointer to the file object */
// 4409 )
// 4410 {
f_putc:
        PUSH     {R2-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
// 4411     uint32 bw, btw;
// 4412     uint8 s[3];
// 4413 
// 4414 
// 4415 #if _USE_STRFUNC >= 2
// 4416     if (c == '\n') f_putc ('\r', fil);  /* LF -> CRLF conversion */
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+10
        BNE.N    ??f_putc_0
        MOVS     R1,R5
        MOVS     R0,#+13
          CFI FunCall f_putc
        BL       f_putc
// 4417 #endif
// 4418 
// 4419 #if _LFN_UNICODE    /* Write the character in UTF-8 encoding */
// 4420     if (c < 0x80)           /* 7-bit */
// 4421     {
// 4422         s[0] = (uint8)c;
// 4423         btw = 1;
// 4424     }
// 4425     else
// 4426     {
// 4427         if (c < 0x800)      /* 11-bit */
// 4428         {
// 4429             s[0] = (uint8)(0xC0 | (c >> 6));
// 4430             s[1] = (uint8)(0x80 | (c & 0x3F));
// 4431             btw = 2;
// 4432         }
// 4433         else            /* 16-bit */
// 4434         {
// 4435             s[0] = (uint8)(0xE0 | (c >> 12));
// 4436             s[1] = (uint8)(0x80 | ((c >> 6) & 0x3F));
// 4437             s[2] = (uint8)(0x80 | (c & 0x3F));
// 4438             btw = 3;
// 4439         }
// 4440     }
// 4441 #else               /* Write the character without conversion */
// 4442     s[0] = (uint8)c;
??f_putc_0:
        STRB     R4,[SP, #+0]
// 4443     btw = 1;
        MOVS     R0,#+1
        MOVS     R6,R0
// 4444 #endif
// 4445     f_write(fil, s, btw, &bw);      /* Write the char to the file */
        ADD      R3,SP,#+4
        MOVS     R2,R6
        ADD      R1,SP,#+0
        MOVS     R0,R5
          CFI FunCall f_write
        BL       f_write
// 4446     return (bw == btw) ? 1 : EOF;   /* Return the result */
        LDR      R0,[SP, #+4]
        CMP      R0,R6
        BNE.N    ??f_putc_1
        MOVS     R0,#+1
        B.N      ??f_putc_2
??f_putc_1:
        MOVS     R0,#-1
??f_putc_2:
        POP      {R1,R2,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock41
// 4447 }
// 4448 
// 4449 
// 4450 
// 4451 
// 4452 /*-----------------------------------------------------------------------*/
// 4453 /* Put a string to the file                                              */
// 4454 /*-----------------------------------------------------------------------*/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock42 Using cfiCommon0
          CFI Function f_puts
        THUMB
// 4455 int f_puts (
// 4456     const TCHAR *str,   /* Pointer to the string to be output */
// 4457     FIL *fil            /* Pointer to the file object */
// 4458 )
// 4459 {
f_puts:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
// 4460     int n;
// 4461 
// 4462 
// 4463     for (n = 0; *str; str++, n++)
        MOVS     R0,#+0
        MOVS     R6,R0
??f_puts_0:
        LDRSB    R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??f_puts_1
// 4464     {
// 4465         if (f_putc(*str, fil) == EOF) return EOF;
        MOVS     R1,R5
        LDRSB    R0,[R4, #+0]
          CFI FunCall f_putc
        BL       f_putc
        CMN      R0,#+1
        BNE.N    ??f_puts_2
        MOVS     R0,#-1
        B.N      ??f_puts_3
// 4466     }
??f_puts_2:
        ADDS     R4,R4,#+1
        ADDS     R6,R6,#+1
        B.N      ??f_puts_0
// 4467     return n;
??f_puts_1:
        MOVS     R0,R6
??f_puts_3:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock42
// 4468 }
// 4469 
// 4470 
// 4471 
// 4472 
// 4473 /*-----------------------------------------------------------------------*/
// 4474 /* Put a formatted string to the file                                    */
// 4475 /*-----------------------------------------------------------------------*/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock43 Using cfiCommon0
          CFI Function f_printf
        THUMB
// 4476 int f_printf (
// 4477     FIL *fil,           /* Pointer to the file object */
// 4478     const TCHAR *str,   /* Pointer to the format string */
// 4479     ...                 /* Optional arguments... */
// 4480 )
// 4481 {
f_printf:
        PUSH     {R0,R2,R3}
          CFI CFA R13+12
        PUSH     {R4-R11,LR}
          CFI R14 Frame(CFA, -16)
          CFI R11 Frame(CFA, -20)
          CFI R10 Frame(CFA, -24)
          CFI R9 Frame(CFA, -28)
          CFI R8 Frame(CFA, -32)
          CFI R7 Frame(CFA, -36)
          CFI R6 Frame(CFA, -40)
          CFI R5 Frame(CFA, -44)
          CFI R4 Frame(CFA, -48)
          CFI CFA R13+48
        SUB      SP,SP,#+40
          CFI CFA R13+88
        MOVS     R4,R1
// 4482     va_list arp;
// 4483     uint8 f, r;
// 4484     uint32 i, j, w;
// 4485     uint32 v;
// 4486     TCHAR c, d, s[16], *p;
// 4487     int res, chc, cc;
// 4488 
// 4489 
// 4490     va_start(arp, str);
        ADD      R0,SP,#+80
        MOVS     R5,R0
// 4491 
// 4492     for (cc = res = 0; cc != EOF; res += cc)
        MOVS     R0,#+0
        MOV      R10,R0
        STR      R10,[SP, #+4]
??f_printf_0:
        LDR      R0,[SP, #+4]
        CMN      R0,#+1
        BEQ.W    ??f_printf_1
// 4493     {
// 4494         c = *str++;
        LDRSB    R0,[R4, #+0]
        STRB     R0,[SP, #+0]
        ADDS     R4,R4,#+1
// 4495         if (c == 0) break;          /* End of string */
        LDRSB    R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.W    ??f_printf_1
// 4496         if (c != '%')               /* Non escape character */
??f_printf_2:
        LDRSB    R0,[SP, #+0]
        CMP      R0,#+37
        BEQ.N    ??f_printf_3
// 4497         {
// 4498             cc = f_putc(c, fil);
        LDR      R1,[SP, #+76]
        LDRSB    R0,[SP, #+0]
          CFI FunCall f_putc
        BL       f_putc
        STR      R0,[SP, #+4]
// 4499             if (cc != EOF) cc = 1;
        LDR      R0,[SP, #+4]
        CMN      R0,#+1
        BEQ.N    ??f_printf_4
        MOVS     R0,#+1
        STR      R0,[SP, #+4]
// 4500             continue;
??f_printf_4:
        B.N      ??f_printf_5
// 4501         }
// 4502         w = f = 0;
??f_printf_3:
        MOVS     R0,#+0
        MOVS     R6,R0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        STR      R6,[SP, #+12]
// 4503         c = *str++;
        LDRSB    R0,[R4, #+0]
        STRB     R0,[SP, #+0]
        ADDS     R4,R4,#+1
// 4504         if (c == '0')               /* Flag: '0' padding */
        LDRSB    R0,[SP, #+0]
        CMP      R0,#+48
        BNE.N    ??f_printf_6
// 4505         {
// 4506             f = 1;
        MOVS     R0,#+1
        MOVS     R6,R0
// 4507             c = *str++;
        LDRSB    R0,[R4, #+0]
        STRB     R0,[SP, #+0]
        ADDS     R4,R4,#+1
        B.N      ??f_printf_7
// 4508         }
// 4509         else
// 4510         {
// 4511             if (c == '-')           /* Flag: left justified */
??f_printf_6:
        LDRSB    R0,[SP, #+0]
        CMP      R0,#+45
        BNE.N    ??f_printf_7
// 4512             {
// 4513                 f = 2;
        MOVS     R0,#+2
        MOVS     R6,R0
// 4514                 c = *str++;
        LDRSB    R0,[R4, #+0]
        STRB     R0,[SP, #+0]
        ADDS     R4,R4,#+1
// 4515             }
// 4516         }
// 4517         while (IsDigit(c))          /* Precision */
??f_printf_7:
        LDRSB    R0,[SP, #+0]
        CMP      R0,#+48
        BLT.N    ??f_printf_8
        LDRSB    R0,[SP, #+0]
        CMP      R0,#+58
        BGE.N    ??f_printf_8
// 4518         {
// 4519             w = w * 10 + c - '0';
        LDR      R0,[SP, #+12]
        MOVS     R1,#+10
        LDRSB    R2,[SP, #+0]
        MLA      R0,R1,R0,R2
        SUBS     R0,R0,#+48
        STR      R0,[SP, #+12]
// 4520             c = *str++;
        LDRSB    R0,[R4, #+0]
        STRB     R0,[SP, #+0]
        ADDS     R4,R4,#+1
        B.N      ??f_printf_7
// 4521         }
// 4522         if (c == 'l' || c == 'L')   /* Prefix: Size is long int */
??f_printf_8:
        LDRSB    R0,[SP, #+0]
        CMP      R0,#+108
        BEQ.N    ??f_printf_9
        LDRSB    R0,[SP, #+0]
        CMP      R0,#+76
        BNE.N    ??f_printf_10
// 4523         {
// 4524             f |= 4;
??f_printf_9:
        ORRS     R6,R6,#0x4
// 4525             c = *str++;
        LDRSB    R0,[R4, #+0]
        STRB     R0,[SP, #+0]
        ADDS     R4,R4,#+1
// 4526         }
// 4527         if (!c) break;
??f_printf_10:
        LDRSB    R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.W    ??f_printf_1
// 4528         d = c;
??f_printf_11:
        LDRSB    R0,[SP, #+0]
        MOV      R8,R0
// 4529         if (IsLower(d)) d -= 0x20;
        SXTB     R8,R8            ;; SignExt  R8,R8,#+24,#+24
        CMP      R8,#+97
        BLT.N    ??f_printf_12
        SXTB     R8,R8            ;; SignExt  R8,R8,#+24,#+24
        CMP      R8,#+123
        BGE.N    ??f_printf_12
        SUBS     R8,R8,#+32
// 4530         switch (d)                  /* Type is... */
??f_printf_12:
        SXTB     R8,R8            ;; SignExt  R8,R8,#+24,#+24
        MOV      R0,R8
        CMP      R0,#+66
        BEQ.N    ??f_printf_13
        CMP      R0,#+67
        BEQ.N    ??f_printf_14
        CMP      R0,#+68
        BEQ.N    ??f_printf_15
        CMP      R0,#+79
        BEQ.N    ??f_printf_16
        CMP      R0,#+83
        BEQ.N    ??f_printf_17
        CMP      R0,#+85
        BEQ.N    ??f_printf_15
        CMP      R0,#+88
        BEQ.N    ??f_printf_18
        B.N      ??f_printf_19
// 4531         {
// 4532         case 'S' :                  /* String */
// 4533             p = va_arg(arp, TCHAR *);
??f_printf_17:
        LDR      R0,[R5, #+0]
        ADDS     R5,R5,#+4
        STR      R0,[SP, #+16]
// 4534             for (j = 0; p[j]; j++) ;
        MOVS     R0,#+0
        MOV      R11,R0
??f_printf_20:
        LDR      R0,[SP, #+16]
        LDRSB    R0,[R11, R0]
        CMP      R0,#+0
        BEQ.N    ??f_printf_21
        ADDS     R11,R11,#+1
        B.N      ??f_printf_20
// 4535             chc = 0;
??f_printf_21:
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
// 4536             if (!(f & 2))
        LSLS     R0,R6,#+30
        BMI.N    ??f_printf_22
// 4537             {
// 4538                 while (j++ < w) chc += (cc = f_putc(' ', fil));
??f_printf_23:
        MOV      R0,R11
        ADDS     R11,R0,#+1
        LDR      R1,[SP, #+12]
        CMP      R0,R1
        BCS.N    ??f_printf_22
        LDR      R1,[SP, #+76]
        MOVS     R0,#+32
          CFI FunCall f_putc
        BL       f_putc
        STR      R0,[SP, #+4]
        LDR      R1,[SP, #+8]
        ADDS     R0,R0,R1
        STR      R0,[SP, #+8]
        B.N      ??f_printf_23
// 4539             }
// 4540             chc += (cc = f_puts(p, fil));
??f_printf_22:
        LDR      R1,[SP, #+76]
        LDR      R0,[SP, #+16]
          CFI FunCall f_puts
        BL       f_puts
        STR      R0,[SP, #+4]
        LDR      R1,[SP, #+8]
        ADDS     R0,R0,R1
        STR      R0,[SP, #+8]
// 4541             while (j++ < w) chc += (cc = f_putc(' ', fil));
??f_printf_24:
        MOV      R0,R11
        ADDS     R11,R0,#+1
        LDR      R1,[SP, #+12]
        CMP      R0,R1
        BCS.N    ??f_printf_25
        LDR      R1,[SP, #+76]
        MOVS     R0,#+32
          CFI FunCall f_putc
        BL       f_putc
        STR      R0,[SP, #+4]
        LDR      R1,[SP, #+8]
        ADDS     R0,R0,R1
        STR      R0,[SP, #+8]
        B.N      ??f_printf_24
// 4542             if (cc != EOF) cc = chc;
??f_printf_25:
        LDR      R0,[SP, #+4]
        CMN      R0,#+1
        BEQ.N    ??f_printf_26
        LDR      R0,[SP, #+8]
        STR      R0,[SP, #+4]
// 4543             continue;
??f_printf_26:
        B.N      ??f_printf_5
// 4544         case 'C' :                  /* Character */
// 4545             cc = f_putc((TCHAR)va_arg(arp, int), fil);
??f_printf_14:
        LDR      R0,[R5, #+0]
        ADDS     R5,R5,#+4
        LDR      R1,[SP, #+76]
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall f_putc
        BL       f_putc
        STR      R0,[SP, #+4]
// 4546             continue;
        B.N      ??f_printf_5
// 4547         case 'B' :                  /* Binary */
// 4548             r = 2;
??f_printf_13:
        MOVS     R0,#+2
        STRB     R0,[SP, #+1]
// 4549             break;
        B.N      ??f_printf_27
// 4550         case 'O' :                  /* Octal */
// 4551             r = 8;
??f_printf_16:
        MOVS     R0,#+8
        STRB     R0,[SP, #+1]
// 4552             break;
        B.N      ??f_printf_27
// 4553         case 'D' :                  /* Signed decimal */
// 4554         case 'U' :                  /* Unsigned decimal */
// 4555             r = 10;
??f_printf_15:
        MOVS     R0,#+10
        STRB     R0,[SP, #+1]
// 4556             break;
        B.N      ??f_printf_27
// 4557         case 'X' :                  /* Hexdecimal */
// 4558             r = 16;
??f_printf_18:
        MOVS     R0,#+16
        STRB     R0,[SP, #+1]
// 4559             break;
        B.N      ??f_printf_27
// 4560         default:                    /* Unknown type (passthrough) */
// 4561             cc = f_putc(c, fil);
??f_printf_19:
        LDR      R1,[SP, #+76]
        LDRSB    R0,[SP, #+0]
          CFI FunCall f_putc
        BL       f_putc
        STR      R0,[SP, #+4]
// 4562             continue;
        B.N      ??f_printf_5
// 4563         }
// 4564 
// 4565         /* Get an argument and put it in numeral */
// 4566         v = (f & 4) ? (uint32)va_arg(arp, long) : ((d == 'D') ? (uint32)(long)va_arg(arp, int) : (uint32)va_arg(arp, unsigned int));
??f_printf_27:
        LSLS     R0,R6,#+29
        BPL.N    ??f_printf_28
        LDR      R7,[R5, #+0]
        ADDS     R5,R5,#+4
        B.N      ??f_printf_29
??f_printf_28:
        SXTB     R8,R8            ;; SignExt  R8,R8,#+24,#+24
        CMP      R8,#+68
        BNE.N    ??f_printf_30
        LDR      R7,[R5, #+0]
        ADDS     R5,R5,#+4
        B.N      ??f_printf_29
??f_printf_30:
        LDR      R7,[R5, #+0]
        ADDS     R5,R5,#+4
// 4567         if (d == 'D' && (v & 0x80000000))
??f_printf_29:
        SXTB     R8,R8            ;; SignExt  R8,R8,#+24,#+24
        CMP      R8,#+68
        BNE.N    ??f_printf_31
        CMP      R7,#+0
        BPL.N    ??f_printf_31
// 4568         {
// 4569             v = 0 - v;
        RSBS     R7,R7,#+0
// 4570             f |= 8;
        ORRS     R6,R6,#0x8
// 4571         }
// 4572         i = 0;
??f_printf_31:
        MOVS     R0,#+0
        MOV      R9,R0
// 4573         do
// 4574         {
// 4575             d = (TCHAR)(v % r);
??f_printf_32:
        LDRB     R0,[SP, #+1]
        UDIV     R1,R7,R0
        MLS      R0,R0,R1,R7
        MOV      R8,R0
// 4576             v /= r;
        LDRB     R0,[SP, #+1]
        UDIV     R7,R7,R0
// 4577             if (d > 9) d += (c == 'x') ? 0x27 : 0x07;
        SXTB     R8,R8            ;; SignExt  R8,R8,#+24,#+24
        CMP      R8,#+10
        BLT.N    ??f_printf_33
        LDRSB    R0,[SP, #+0]
        CMP      R0,#+120
        BNE.N    ??f_printf_34
        MOVS     R0,#+39
        B.N      ??f_printf_35
??f_printf_34:
        MOVS     R0,#+7
??f_printf_35:
        ADDS     R8,R0,R8
// 4578             s[i++] = d + '0';
??f_printf_33:
        ADDS     R0,R8,#+48
        ADD      R1,SP,#+20
        STRB     R0,[R9, R1]
        ADDS     R9,R9,#+1
// 4579         }
// 4580         while (v && i < sizeof(s) / sizeof(s[0]));
        CMP      R7,#+0
        BEQ.N    ??f_printf_36
        CMP      R9,#+16
        BCC.N    ??f_printf_32
// 4581         if (f & 8) s[i++] = '-';
??f_printf_36:
        LSLS     R0,R6,#+28
        BPL.N    ??f_printf_37
        MOVS     R0,#+45
        ADD      R1,SP,#+20
        STRB     R0,[R9, R1]
        ADDS     R9,R9,#+1
// 4582         j = i;
??f_printf_37:
        MOV      R11,R9
// 4583         d = (f & 1) ? '0' : ' ';
        LSLS     R0,R6,#+31
        BPL.N    ??f_printf_38
        MOVS     R8,#+48
        B.N      ??f_printf_39
??f_printf_38:
        MOVS     R8,#+32
// 4584         res = 0;
??f_printf_39:
        MOVS     R0,#+0
        MOV      R10,R0
// 4585         while (!(f & 2) && j++ < w) res += (cc = f_putc(d, fil));
??f_printf_40:
        LSLS     R0,R6,#+30
        BMI.N    ??f_printf_41
        MOV      R0,R11
        ADDS     R11,R0,#+1
        LDR      R1,[SP, #+12]
        CMP      R0,R1
        BCS.N    ??f_printf_41
        LDR      R1,[SP, #+76]
        MOV      R0,R8
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall f_putc
        BL       f_putc
        STR      R0,[SP, #+4]
        ADDS     R10,R0,R10
        B.N      ??f_printf_40
// 4586         do res += (cc = f_putc(s[--i], fil));
??f_printf_41:
        SUBS     R9,R9,#+1
        LDR      R1,[SP, #+76]
        ADD      R0,SP,#+20
        LDRSB    R0,[R9, R0]
          CFI FunCall f_putc
        BL       f_putc
        STR      R0,[SP, #+4]
        ADDS     R10,R0,R10
// 4587         while(i);
        CMP      R9,#+0
        BNE.N    ??f_printf_41
// 4588         while (j++ < w) res += (cc = f_putc(' ', fil));
??f_printf_42:
        MOV      R0,R11
        ADDS     R11,R0,#+1
        LDR      R1,[SP, #+12]
        CMP      R0,R1
        BCS.N    ??f_printf_43
        LDR      R1,[SP, #+76]
        MOVS     R0,#+32
          CFI FunCall f_putc
        BL       f_putc
        STR      R0,[SP, #+4]
        ADDS     R10,R0,R10
        B.N      ??f_printf_42
// 4589         if (cc != EOF) cc = res;
??f_printf_43:
        LDR      R0,[SP, #+4]
        CMN      R0,#+1
        BEQ.N    ??f_printf_5
        STR      R10,[SP, #+4]
// 4590     }
??f_printf_5:
        LDR      R0,[SP, #+4]
        ADDS     R10,R0,R10
        B.N      ??f_printf_0
// 4591 
// 4592     va_end(arp);
// 4593     return (cc == EOF) ? cc : res;
??f_printf_1:
        LDR      R0,[SP, #+4]
        CMN      R0,#+1
        BNE.N    ??f_printf_44
        LDR      R10,[SP, #+4]
        B.N      ??f_printf_45
??f_printf_44:
??f_printf_45:
        MOV      R0,R10
        ADD      SP,SP,#+40
          CFI CFA R13+48
        POP      {R4-R11}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI R8 SameValue
          CFI R9 SameValue
          CFI R10 SameValue
          CFI R11 SameValue
          CFI CFA R13+16
        LDR      PC,[SP], #+16    ;; return
          CFI EndBlock cfiBlock43
// 4594 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 "\"*+,:;<=>?[]|\177"
        DC8 0

        END
// 4595 
// 4596 #endif /* !_FS_READONLY */
// 4597 #endif /* _USE_STRFUNC */
// 
//     6 bytes in section .bss
//    16 bytes in section .rodata
// 9 600 bytes in section .text
// 
// 9 600 bytes of CODE  memory
//    16 bytes of CONST memory
//     6 bytes of DATA  memory
//
//Errors: none
//Warnings: none
