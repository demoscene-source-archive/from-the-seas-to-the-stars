//--------------------------------------------------------------------------//
// iq / rgba  .  tiny codes  .  2008                                        //
//--------------------------------------------------------------------------//

#ifndef _EXTENSIONES_H_
#define _EXTENSIONES_H_

#ifdef WINDOWS
#define WIN32_LEAN_AND_MEAN
#define WIN32_EXTRA_LEAN
#include <windows.h>
#endif
#include <GL/gl.h>
#include "glext.h"


#ifdef DEBUG
#define NUMFUNCIONES 12
#else
#define NUMFUNCIONES 5
#endif

extern void *myglfunc[NUMFUNCIONES];


#define oglCreateShaderProgramv         ((PFNGLCREATESHADERPROGRAMVPROC)myglfunc[0])
#define oglUseProgram                   ((PFNGLUSEPROGRAMPROC)myglfunc[1])
#define oglUniform1f                   ((PFNGLUNIFORM1FPROC)myglfunc[2])
#define oglGetUniformLocation           ((PFNGLGETUNIFORMLOCATIONARBPROC)myglfunc[3])
#define oglUniform1i                   ((PFNGLUNIFORM1IPROC)myglfunc[4])

#ifdef DEBUG
#define oglGetObjectParameteriv         ((PFNGLGETOBJECTPARAMETERIVARBPROC)myglfunc[10])
#define oglGetInfoLog                   ((PFNGLGETINFOLOGARBPROC)myglfunc[11])
#endif

// init
int EXT_Init( void );

#endif
