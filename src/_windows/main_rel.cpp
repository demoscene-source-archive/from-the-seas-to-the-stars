
// Let My Fish Loose

#pragma warning( disable : 4730 )
#pragma warning( disable : 4799 )

#define WIN32_LEAN_AND_MEAN
#define WIN32_EXTRA_LEAN
#include <windows.h>
#include <mmsystem.h>
#include <mmreg.h>
#include "../config.h"
#include <GL/gl.h>
#include "../glext.h"
#include "../oidos.h"

#define ENABLE_MUSIC 1
#define LOAD_MUSIC 0
#define HOT_RELOAD 0
#define WRITEBITMAPS 0
#define WRITEWAV 0
#define CHECK_ERRORS 0
#define STRINGIFY2(x) #x
#define STRINGIFY(x) STRINGIFY2(x)
//#define CHECKGL {GLuint err=glGetError();if(err){MessageBoxA(hWnd,"ogl err on line " STRINGIFY(__LINE__),"ogl err",MB_OK);ExitProcess(-1);}}
#define CHECKGL 
#define SIZE 512
#define ERRORBOX(x) {MessageBoxA(hWnd,"there was a bad when " x,"bad",MB_OK); CloseHandle(hFile); ExitProcess(-1);}

#if LOAD_MUSIC
#define MAX_SAMPLES (41418796/4)
short	lpSoundBuffer[MAX_SAMPLES*2]; 

#pragma data_seg(".wavefmt")
WAVEFORMATEX WaveFMT =
{
#ifdef FLOAT_32BIT	
	WAVE_FORMAT_IEEE_FLOAT,
#else
	WAVE_FORMAT_PCM,
#endif		
    2, // channels
    44100, // samples per sec
    44100*sizeof(short)*2, // bytes per sec
    sizeof(short)*2, // block alignment;
    sizeof(short)*8, // bits per sample
    0 // extension not needed
};

#pragma data_seg(".wavehdr")
WAVEHDR WaveHDR = 
{
	(LPSTR)lpSoundBuffer, 
	MAX_SAMPLES*sizeof(short)*2,			// MAX_SAMPLES*sizeof(float)*2(stereo)
	0, 
	0, 
	0, 
	0, 
	0, 
	0
};

#pragma data_seg(".mdat1")
MMTIME MMTime = 
{ 
	TIME_SAMPLES,
	0
};
#endif

#if WRITEBITMAPS
#include "../writebitmaps.h"
#endif

#if HOT_RELOAD | LOAD_MUSIC
DWORD g_BytesTransferred = 0;
VOID CALLBACK FileIOCompletionRoutine(
  __in  DWORD dwErrorCode,
  __in  DWORD dwNumberOfBytesTransfered,
  __in  LPOVERLAPPED lpOverlapped
);

VOID CALLBACK FileIOCompletionRoutine(
  __in  DWORD dwErrorCode,
  __in  DWORD dwNumberOfBytesTransfered,
  __in  LPOVERLAPPED lpOverlapped )
 {
g_BytesTransferred = dwNumberOfBytesTransfered;
 }
#endif



static const PIXELFORMATDESCRIPTOR pfd = {
    sizeof(PIXELFORMATDESCRIPTOR), 1, PFD_DRAW_TO_WINDOW|PFD_SUPPORT_OPENGL|PFD_DOUBLEBUFFER, PFD_TYPE_RGBA,
    32, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 32, 0, 0, PFD_MAIN_PLANE, 0, 0, 0, 0 };

static DEVMODE screenSettings = { {0},
    #if _MSC_VER < 1400
    0,0,148,0,0x001c0000,{0},0,0,0,0,0,0,0,0,0,{0},0,32,XRES,YRES,0,0,      // Visual C++ 6.0
    #else
    0,0,156,0,0x001c0000,{0},0,0,0,0,0,{0},0,32,XRES,YRES,{0}, 0,           // Visuatl Studio 2005
    #endif
    #if(WINVER >= 0x0400)
    0,0,0,0,0,0,
    #if (WINVER >= 0x0500) || (_WIN32_WINNT >= 0x0400)
    0,0
    #endif
    #endif
    };

#ifdef __cplusplus
extern "C" 
{
#endif
int  _fltused = 1;
#ifdef __cplusplus
}
#endif

//----------------------------------------------------------------------------

static const char *strs[] = {
	"glCreateShaderProgramv",
	"glUseProgram",
	"glUniform1i",
	"glDispatchCompute",
	"glBindBuffer",
	"glGenBuffers",
	"glBufferStorage",
	"glTexStorage2D",
	"glBindImageTexture",
	"glClearTexImage",
	"glTexStorage2DMultisample",
    };

#define NUMFUNCIONES (sizeof(strs)/sizeof(strs[0]))

#define oglCreateShaderProgramv	      ((PFNGLCREATESHADERPROGRAMVPROC)myglfunc[0])
#define oglUseProgram									((PFNGLUSEPROGRAMPROC)myglfunc[1])
#define oglUniform1i									((PFNGLUNIFORM1IPROC)myglfunc[2])
#define oglDispatchCompute						((PFNGLDISPATCHCOMPUTEPROC)myglfunc[3])
#define oglBindBuffer								((PFNGLBINDBUFFERPROC)myglfunc[4])
#define oglGenBuffers			((PFNGLGENBUFFERSPROC)myglfunc[5])
#define oglBufferStorage	((PFNGLBUFFERSTORAGEPROC)myglfunc[6])
#define oglTexStorage2D   ((PFNGLTEXSTORAGE2DPROC)myglfunc[7])
#define oglBindImageTexture   ((PFNGLBINDIMAGETEXTUREPROC)myglfunc[8])
#define oglClearTexImage  ((PFNGLCLEARTEXIMAGEPROC)myglfunc[9])
#define oglTexStorage2DMultisample   ((PFNGLTEXSTORAGE2DMULTISAMPLEPROC)myglfunc[10])

#define USE_SOUND_THREAD

#if LOAD_MUSIC
HWAVEOUT	hWaveOut;
#endif
HWND hWnd;

//#pragma code_seg(".initsnd")
void  InitSound()
{

#if LOAD_MUSIC
Sleep(100);
    HANDLE hFile; 
    DWORD  dwBytesRead = 0;
    FILETIME ftCreatePrev, ftAccessPrev, ftWritePrev;
    FILETIME ftCreate, ftAccess, ftWrite;

    hFile = CreateFile("..\\music.wav",               // file to open
                       GENERIC_READ,          // open for reading
                       FILE_SHARE_READ|FILE_SHARE_WRITE,       // share for reading
                       NULL,                  // default security
                       OPEN_EXISTING,         // existing file only
                       FILE_ATTRIBUTE_NORMAL, // normal file
                       NULL);                 // no attr. template

    if (hFile == INVALID_HANDLE_VALUE) 
    {
			ERRORBOX("opening file");
		}

    if (!GetFileTime(hFile, &ftCreatePrev, &ftAccessPrev, &ftWritePrev))
		{
			ERRORBOX("GetFileTime");
		}

	DWORD filesize=GetFileSize(hFile, NULL);	


		LARGE_INTEGER dis;
		dis.QuadPart = 0;
		if( FALSE == SetFilePointerEx(hFile, dis, NULL, FILE_BEGIN) )
		{
			ERRORBOX("setting the file pointer");
		}

		OVERLAPPED ol = {0};
		if( FALSE == ReadFileEx(hFile, lpSoundBuffer, sizeof(lpSoundBuffer), &ol, FileIOCompletionRoutine) )
		{
			ERRORBOX("reading the file");
		}


CloseHandle(hFile);
	waveOutOpen			( &hWaveOut, WAVE_MAPPER, &WaveFMT, NULL, 0, CALLBACK_NULL );
	waveOutPrepareHeader( hWaveOut, &WaveHDR, sizeof(WaveHDR) );
	waveOutWrite		( hWaveOut, &WaveHDR, sizeof(WaveHDR) );	
#endif

#if ENABLE_MUSIC
	Oidos_FillRandomData();
	Oidos_GenerateMusic();
	Oidos_StartMusic();
#endif

}

void entrypoint( void )
{
    // full screen
    //if( ChangeDisplaySettings(&screenSettings,CDS_FULLSCREEN)!=DISP_CHANGE_SUCCESSFUL) return;
    ChangeDisplaySettings(&screenSettings,CDS_FULLSCREEN);
    ShowCursor( 0 );
    // create window
    hWnd = CreateWindow( "edit",0,WS_POPUP|WS_VISIBLE,0,0,XRES,YRES,0,0,0,0);
//    if( !hWnd ) return;
    HDC hDC = GetDC(hWnd);
    // initalize opengl
    SetPixelFormat(hDC,ChoosePixelFormat(hDC,&pfd),&pfd);
    //if( !SetPixelFormat(hDC,ChoosePixelFormat(hDC,&pfd),&pfd) ) return;
    wglMakeCurrent(hDC,wglCreateContext(hDC));

	void *myglfunc[NUMFUNCIONES];

    for( int i=0; i<NUMFUNCIONES; i++ )
    {
        #ifdef WIN32
        myglfunc[i] = wglGetProcAddress( strs[i] );
        #endif
        #ifdef LINUX
        myglfunc[i] = glXGetProcAddress( (const unsigned char *)strs[i] );
        #endif
    }

    static const char csSrc2[] = ""
#include "../fragment.glsl.h"
		;

		static const char* shp2 = csSrc2;

auto prog2 = oglCreateShaderProgramv(GL_COMPUTE_SHADER, 1, &shp2);

#if CHECK_ERRORS
{
GLint val=0;
			((PFNGLGETPROGRAMIVPROC)wglGetProcAddress("glGetProgramiv"))(prog2, GL_LINK_STATUS, &val);

if(!val)
{
        static GLchar log[10240];
        GLsizei length;
        ((PFNGLGETPROGRAMINFOLOGPROC)wglGetProcAddress("glGetProgramInfoLog"))(prog2, 10239, &length, log);
MessageBoxA(hWnd,log,"bad",MB_OK);
ExitProcess(-1);
}
}
#endif




GLuint buf=0;
oglGenBuffers(1,&buf);
oglBindBuffer(GL_PIXEL_UNPACK_BUFFER,buf);
oglBindBuffer(GL_PIXEL_PACK_BUFFER,buf);
oglBufferStorage(GL_PIXEL_PACK_BUFFER,XRES*YRES*4*4,0,0);

GLuint tex=0;
glGenTextures(1, &tex);
		//oglActiveTexture(GL_TEXTURE0);
		glBindTexture(GL_TEXTURE_2D_MULTISAMPLE,tex);
		oglTexStorage2DMultisample(GL_TEXTURE_2D_MULTISAMPLE,8,GL_R32F,XRES,YRES, GL_TRUE);
		//glTexParameteri(GL_TEXTURE_2D_MULTISAMPLE,GL_TEXTURE_MIN_FILTER,GL_NEAREST);
		//glTexParameteri(GL_TEXTURE_2D_MULTISAMPLE,GL_TEXTURE_MAG_FILTER,GL_NEAREST);
		oglBindImageTexture(0,tex,0,GL_FALSE,0,GL_READ_WRITE,GL_R32UI);

#if CHECK_ERRORS
CHECKGL;
#endif

GLuint outtex=0;
glGenTextures(1, &outtex);
		//oglActiveTexture(GL_TEXTURE0);
		glBindTexture(GL_TEXTURE_2D,outtex);
		oglTexStorage2D(GL_TEXTURE_2D,1,GL_RGBA8,XRES,YRES);
		glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR);
		glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_LINEAR);
		oglBindImageTexture(6,outtex,0,GL_FALSE,0,GL_READ_WRITE,GL_RGBA8);



#if WRITEWAV
{
		_4klang_render(lpSoundBuffer);

    HANDLE hf = CreateFile("waveout.raw", 
                   GENERIC_READ | GENERIC_WRITE, 
                   (DWORD) 0, 
                    NULL, 
                   CREATE_ALWAYS, 
                   FILE_ATTRIBUTE_NORMAL, 
                   (HANDLE) NULL); 
    DWORD dwTmp; 

    // Copy the BITMAPFILEHEADER into the .BMP file.  
    if (!WriteFile(hf, lpSoundBuffer, sizeof(lpSoundBuffer), 
        (LPDWORD) &dwTmp,  NULL)) 
    {
    }

		ExitProcess(0);
}
#else

#if !WRITEBITMAPS
	InitSound();
#endif

#endif

auto lastLoad = timeGetTime();;

#if HOT_RELOAD
bool doit=true,dooneframe=false;
#endif

static int frame=0;

    //do {
	loop:

#if HOT_RELOAD

if(GetAsyncKeyState(VK_F6))
{
doit=true;
}

if(GetAsyncKeyState(VK_F7))
{
doit=false;
}


if(GetAsyncKeyState(VK_F2)&&timeGetTime() - lastLoad > 200)
{
Sleep(100);
    HANDLE hFile; 
    DWORD  dwBytesRead = 0;
    FILETIME ftCreatePrev, ftAccessPrev, ftWritePrev;
    FILETIME ftCreate, ftAccess, ftWrite;

    hFile = CreateFile("..\\src\\fragment.glsl",               // file to open
                       GENERIC_READ,          // open for reading
                       FILE_SHARE_READ|FILE_SHARE_WRITE,       // share for reading
                       NULL,                  // default security
                       OPEN_EXISTING,         // existing file only
                       FILE_ATTRIBUTE_NORMAL, // normal file
                       NULL);                 // no attr. template

    if (hFile == INVALID_HANDLE_VALUE) 
    {
			ERRORBOX("opening file");
		}

    if (!GetFileTime(hFile, &ftCreatePrev, &ftAccessPrev, &ftWritePrev))
		{
			ERRORBOX("GetFileTime");
		}

	DWORD filesize=GetFileSize(hFile, NULL);	

		static char buffer[32768] = {0};

		buffer[0]=0;

		LARGE_INTEGER dis;
		dis.QuadPart = 0;
		if( FALSE == SetFilePointerEx(hFile, dis, NULL, FILE_BEGIN) )
		{
			ERRORBOX("setting the file pointer");
		}

		OVERLAPPED ol = {0};
		if( FALSE == ReadFileEx(hFile, buffer, sizeof(buffer)-1, &ol, FileIOCompletionRoutine) )
		{
			ERRORBOX("reading the file");
		}

buffer[filesize]=0;

/*
		if(g_BytesTransferred==0)
		{
			ERRORBOX("zero bytes");
		}
*/
		const char* fragment_source = buffer;

		((PFNGLDELETEPROGRAMPROC)wglGetProcAddress("glDeleteProgram"))(prog2);

		prog2 = oglCreateShaderProgramv(GL_COMPUTE_SHADER, 1, &fragment_source);

#if CHECK_ERRORS
{
GLint val=0;
			((PFNGLGETPROGRAMIVPROC)wglGetProcAddress("glGetProgramiv"))(prog2, GL_LINK_STATUS, &val);

if(!val)
{
        static GLchar log[10240];
        GLsizei length;
        ((PFNGLGETPROGRAMINFOLOGPROC)wglGetProcAddress("glGetProgramInfoLog"))(prog2, 10239, &length, log);
MessageBoxA(hWnd,log,"bad",MB_OK);
ExitProcess(-1);
}
}
#endif

		oglUseProgram(prog2);

CloseHandle(hFile);
lastLoad = timeGetTime();
dooneframe=true;
}

#endif

#if LOAD_MUSIC
		waveOutGetPosition(hWaveOut, &MMTime, sizeof(MMTIME));
		long int t = (long int)(((MMTime.u.sample) * 100) / 4410);
#else
#if ENABLE_MUSIC
	const float musicticks = Oidos_GetPosition();
	const int t = int((musicticks / Oidos_TicksPerSecond) * 1000.0f);
#else
	const float musicticks = 0;//Oidos_GetPosition();
	const int t = 0*1000+int(double(frame)*33.333333333333336);//musicticks / Oidos_TicksPerSecond;
#endif
#endif

#if HOT_RELOAD
if(doit||dooneframe)
#endif
{

{
unsigned long int clearcol[1] = { 0 };
		glBindTexture(GL_TEXTURE_2D_MULTISAMPLE,tex);
oglClearTexImage(tex, 0, GL_RED, GL_UNSIGNED_INT, clearcol);
}

#if CHECK_ERRORS
CHECKGL;
#endif


#if CHECK_ERRORS
CHECKGL;
#endif

	oglUseProgram(prog2);
		oglUniform1i(3,0);
		oglUniform1i(4,t);

		oglDispatchCompute(SIZE,SIZE,1);


#if CHECK_ERRORS
CHECKGL;
#endif

		oglUniform1i(3,1);
		oglDispatchCompute((XRES+7)/8,(YRES+7)/8,1);

#if HOT_RELOAD
dooneframe=false;
#endif
}

		glBindTexture(GL_TEXTURE_2D,outtex);
		glGetTexImage(GL_TEXTURE_2D, 0, GL_RGBA, GL_UNSIGNED_BYTE, NULL);
		glDrawPixels(1280,720,GL_RGBA,GL_UNSIGNED_BYTE,0);

		glFinish();

#if HOT_RELOAD
/*
if(MMTime.u.sample >= MAX_SAMPLES)
{
waveOutReset(hWaveOut);
	waveOutWrite		( hWaveOut, &WaveHDR, sizeof(WaveHDR) );
}
*/
#endif

#if WRITEBITMAPS
static unsigned char framepixels[XRES*YRES*4];
oglBindBuffer(GL_PIXEL_PACK_BUFFER,0);
glReadBuffer(GL_BACK);
glPixelStorei(GL_PACK_ALIGNMENT, 1);
glReadPixels(0,0,XRES,YRES,GL_BGRA,GL_UNSIGNED_BYTE,framepixels);
//for(int i=0;i<sizeof(framepixels);++i)framepixels[i]=255+i;
for(int y=0;y<(YRES+1)/2;++y)for(int x=0;x<XRES;++x)for(int c=0;c<4;++c){auto b=framepixels[(x+y*XRES)*4+c];framepixels[(x+y*XRES)*4+c]=framepixels[(x+(YRES-1-y)*XRES)*4+c];framepixels[(x+(YRES-1-y)*XRES)*4+c]=b;}
HBITMAP bitmap=CreateBitmap(XRES,YRES,1,32,framepixels);
PBITMAPINFO bitmapinfo=CreateBitmapInfoStruct(hWnd, bitmap);
char filename[1024];
wsprintf(filename, "frames\\frame%06d.bmp", frame);
CreateBMPFile(hWnd, filename, bitmapinfo, bitmap, hDC);
DeleteObject(bitmap);
oglBindBuffer(GL_PIXEL_PACK_BUFFER,buf);
#endif

//        SwapBuffers( hDC );
        wglSwapLayerBuffers( hDC, WGL_SWAP_MAIN_PLANE ); //SwapBuffers( hDC );

		PeekMessageA(0, 0, 0, 0, PM_REMOVE); // <-- "fake" message handling.
++frame;
 //   }while ( !GetAsyncKeyState(VK_ESCAPE) );
    //}while ( !GetAsyncKeyState(VK_ESCAPE) && t<(MZK_DURATION*1000) );
//	} while (MMTime.u.sample < MAX_SAMPLES && !GetAsyncKeyState(VK_ESCAPE));
#if LOAD_MUSIC
		if (MMTime.u.sample < MAX_SAMPLES && !GetAsyncKeyState(VK_ESCAPE)) goto loop;
#else
		if (musicticks < Oidos_MusicLength && !GetAsyncKeyState(VK_ESCAPE)) goto loop;
#endif

    #ifdef CLEANDESTROY
    sndPlaySound(0,0);
    ChangeDisplaySettings( 0, 0 );
    ShowCursor(1);
    #endif

    ExitProcess(0);
	}
