
// Let My Fish Loose
// Cosmic Spirit Of The Sea
//
// i dream of an ancient fish
//
// extra thankyou to blueberry for debug help

#version 430
layout(location=3)uniform int mode;
layout(location=4)uniform int millisecs;
layout (local_size_x = 8, local_size_y = 8) in;

uniform layout(binding=0,r32ui)uimage2DMS d0;
uniform layout(binding=6,rgba8)image2D outtex;

float hash(float n){return fract(sin(n)*43758.5453);}float s(vec2 p){return hash(p.x + p.y*57.0);}float valnoise(vec2 p){vec2 c=floor(p);vec2 f=smoothstep(0.,1.,fract(p));return mix (mix(s(c+vec2(0,0)), s(c+vec2(1,0)), f.x),mix(s(c+vec2(0,1)), s(c+vec2(1,1)), f.x), f.y);}

float fbm(vec2 p)
{
	float f=0.;
	for(int i=0;i<9;++i)
	{
	f+=valnoise(p*exp2(i))/exp2(i);
	}
	return f;
}

vec2 disc(vec2 uv)
{
   float a = uv.x * acos(-1) * 2, r = sqrt(uv.y);
   return vec2(cos(a), sin(a)) * r;
}

float zoom=.4,cameraroll=1.,cameraroll2=0;

uvec2 encrypt(uvec2 v)
{
   uint k[4],sum=0,delta=0x9e3779b9;
   k[0] = 0xA341316C;
   k[1] = 0xC8013EA4;
   k[2] = 0xAD90777D;
   k[3] = 0x7E95761E;
   for(uint i=0;i<4;++i)
   {
      sum += delta;
      v.x += ((v.y << 4) + k[0]) ^ (v.y + sum) ^ ((v.y >> 5) + k[1]);
      v.y += ((v.x << 4) + k[2]) ^ (v.x + sum) ^ ((v.x >> 5) + k[3]);
   }
   
   return v;
}

mat2 rotmat(float a){return mat2(cos(a),sin(a),-sin(a),cos(a));}

float koi(vec2 t)
{
	if(abs(t.x)>1)return 1.;
	if(abs(t.y)>.5)return 1.;
	vec2 p=t.xy*1.8,oop=p;
	p.y*=.8;
	p.x*=.9;

	p.y+=pow(clamp(p.x-.7,0,1),2)*.2;

	vec2 op=p;

	float h=.1;

	if(p.y<0)p.y*=mix(1.5,1.6,clamp(p.x,0,1));

	p.y*=mix(1.6,1.,.5+.5*cos(clamp((p.x-.6)*11,0.,3.1415926*2.)));

	p.y-=p.x*.02;

	p.x=mix(p.x,-.4,pow(clamp((p.x-.6)*1.1,0,1),1.4));
	float d=abs(p.y)+p.x*p.x*.35-.34;

	p.x-=.9;

	op.y-=.05;
	op.y=abs(op.y);
	d=max(d,op.x-pow(op.y/2,.7)*1-1.1);


	oop.x-=.15;
	d=min(d,max(-oop.y,max(oop.x,oop.x*oop.x*4+oop.y-.7)));
	oop.x+=oop.y*.3+.25;
	d=min(d,max(oop.y,max(oop.x,oop.x*oop.x*4-oop.y-.5)));
	float oopx=oop.x+.4;
	d=min(d,max(oop.y,max(oopx,oopx*oopx*4-oop.y-.3)));
	oop.x+=oop.y*.6-.7;
	d=min(d,max(oop.y,max(oop.x,oop.x*oop.x*4-oop.y-.3)));
	return d;
}

uvec2 coord = gl_GlobalInvocationID.xy;
uvec2 rstate=coord;
vec4 w;
vec3 col=vec3(0);         
vec3 p,of;
float time,per=0.;

float R()
{
    rstate=encrypt(rstate);
	return float(rstate.x&0xfffff)/(1<<20);
}

void makeBG(float c)
{
	 w.x=R()*2-1;
	 
	 w.y=R()*2-1;
	 
	 w.z=R()*2-1;
	 
	 w.w=R();
	 
	 //if(w.w>0.05)
	 if(w.w>c)
	 //if(w.w>0.5)
	 {
		//return;
		
		// ocean
	 
	 w.w=R();
	   // p.x=pow(abs(w.x),2.)*sign(w.x)*3.;
	   // p.z=pow(abs(w.y),2.)*sign(w.y)*2.;
	   p.x=pow(abs(w.x),1.)*sign(w.x)*8.;
	   p.z=pow(abs(w.y),1.)*sign(w.y)*8.;
		p.y=.2+fbm(p.xz*1.-time/8.)*.2-pow(w.z*.5+.5,8.)*5.;
		col=vec3(.3,.5,1.)/2;
		col=mix(col,vec3(1.,.25,1.),pow(w.w,4.));
		col=mix(col,vec3(1),pow(1.-(w.z*.5+.5),32.));
		col*=1.-pow(w.z*.5+.5,1.);
		col+=pow(1-abs(fbm(p.xz*3.+time/8.+p.y)*.7-.6),32.)*.4;
		col/=2;
		p.x+=cos(p.x*8.)*.01;
		
		col*=.2;//for ammonites
		
		// camera
		//p.y*=3.;
		p.y+=.5;
	 }
	 else if(w.w>0.0001)
	 {
//            if(w.w>.2)
//             return;
		
		
		w.x=R()*2-1;
		
		w.y=R()*2-1;
		
		w.z=R();
		
		//w.xy=pow(abs(w.xy),vec2(2))*sign(w.xy); 
		
		// ground
		p.xz=w.xy*7;
		p.y=-1.+fbm(p.zx+19.)*.02*pow(length(p.xz),2.)-pow(w.z,8);
		p.z+=2.;
		col=vec3(.1,.06,.05)/1.5*smoothstep(-1.5,-.2,p.y);
		//col/=30.;
		
		w.w=R();
		col+=vec3(pow(w.w,80))*.1;
		col*=1.+pow(max(0.,1.-abs(fbm(p.xz*2+time/2)-.8)),16)/2; // caustic
	 }
	 else
	 {
		p=w.xyz;
		p.x=fract(p.x+time/4.*.1)*2-1;
		p*=2.;
		
		w.w=R();
		col=vec3(w.w)*.3;
	 }
 
}

void ammonite()
{
	 if(w.w<.95)
	 {
		 
		// if(w.w<.3)return;
		 

				
		float t=pow(w.z,.3)*2.,c=.5+.5*cos(t*300);
		col=mix(vec3(1,.5,.4),vec3(.3),c)/8.;
		p=vec3(0);
		p.xy=(disc(w.xy)*mix(.8,1.,c)+vec2(0,1+t/1.))*t*.05;
		p.yz*=rotmat(t*10.+2);
		 
		 w.w=R();
	 col+=pow(w.w,10)/3.;
	 col*=p.y+.6;
	 }
	 else
	 {
		 col=vec3(1.,.3,.1)/8.;
		 p.xy=disc(w.xy)*.05*(1.-smoothstep(.2,1.,w.z))+vec2(0,-.3);
		 p.z=pow(w.z,4.)*2;
		 
		 w.x=R();
		 float t=smoothstep(0.3,0.9,w.z);
		 p.y+=(fbm(of.x+vec2(p.z-time/2/6)/3+floor(w.x*8))-1.)*w.z*.7*t;
		 p.x+=(fbm(of.y+vec2(p.z)/3+floor(w.x*8)+90)-1.)*w.z*.7*t;
		 p.z+=(fbm(of.z+vec2(p.z+time/2/7)/3+floor(w.x*8)+190)-1.)*w.z*.5*t;
		 
		 w.w=R();
	 col+=pow(w.w,10);
	 }
}

bool jellyfish()
{

	col=vec3(.2,.4,1.)/3+pow(w.w,8);


	 float to=(of.x+of.y*8)*.3,time2=time/2+to;
	 
	 
	 w.x=R();
	 
	 w.y=R();
	 
	 w.z=R();
	 
	 w.w=R();

	 if(w.w<.5)
	 {
	p.xz=disc(w.xy);
	p.xz=normalize(p.xz)*sqrt(length(p.xz));
	vec2 tp=sign(p.xz)*.35;
	tp+=normalize(p.xz-tp)*.15;
	if(w.z<.25)
		p.xz=tp;
	else if(w.z<.31)
		p.xz=normalize(p.xz);
	//p.xz=mix(p.xz,tp,1./(1.+distance(tp,p.xz)));
	//p.x+=(fbm(p.xz*2)-1)*.1;
	//p.z+=(fbm(p.xz*2+1000)-1)*.1;
	if(dot(p.xz,p.xz)>1.)return true;
	p.y=sqrt(max(0.,1.-dot(p.xz,p.xz)));

	if(w.z<.25)
		p.y+=-.2;

	float t=pow(fract(time2/2),2);
	p.xz*=mix(mix(.8,1.,cos(min(t*2,2.-t*2)*3.14159)*.5+.5),1.,p.y);
	//col*=length(p);
	 p.xz*=1.5;
	p.y+=(1-p.y)*cos(fract(time2/2.)*3.14159*2)*.1;
	p.xyz+=of;
	p.y+=(fbm(p.xz/5+time2/2.)-1)*.1;
	 }
	 else
	 {
		 w.xy*=5.;
		 w.z=pow(w.z,5.);
		p.xz=(disc(fract(w.xy))*.01/(.01+1.-w.z)+floor(w.xy)/2.-1.)*.25;
		p.y=(w.z*2.-1.5)+(3.-length(fract(w.xy)-.5))*.3-.8-(.5+.5*cos(floor(w.xy).x))*.2;
		p.y*=2;
		//col*=fract(p.y*8);
	 p.xz*=1.5;
	p.xyz+=of;
		p.x+=(fbm(p.yz/4.*vec2(1,6)-time2/10)-1.2)*pow(1.-w.z,.75);
		p.z+=(fbm(p.yx/4.*vec2(1,6)+time2/10)-1.2)*pow(1.-w.z,.75);
	 }
	 
	 p-=of;
	 p.yz*=rotmat(cos(of.x+p.y/2)*.2);
	 p*.8+.4*sin(of.x*2+of.z*10);
	 p+=of;
	 
	p*=.2;		
	return false;
}

vec3 sphere(vec2 w)
{
      vec3 p;
      float phi = w.x * 3.1415926535898 * 2.0;
      float u = w.y * 2.0  - 1.0;
      p.z = u;
      
      u = sqrt(1.0 - u * u );
      
      p.x = cos(phi) * u;
      p.y = sin(phi) * u;
      
      return p;
}

float smin( float a, float b, float k )
{
    float h = clamp( 0.5+0.5*(b-a)/k, 0.0, 1.0 );
    return mix( b, a, h ) - k*h*(1.0-h);
}


void main() {
	time=float(millisecs)/1000.+R()*.015+(3*60+20)*0;
	//time=(3*60+20)+15;
	//time+=1*60+13.5;
	  //time+=20;
	  //time+=3*60+5;
	  //time+=2*60+44;
	  //time+=1*60-3;
	 // time+=2*60+2;
	 //time+=3*60+15;
	// time+=1*60+15.5;
	  //time+=1*60+44.5;
	  //time+=0*60+43;
	  
	 // time+=3*60+25;
	 //time+=2*60+2+3;
	 //time+=2*60+28;
	 //time+=3*60+24;
	 //time+=2*60+12;
	// time+=1*60+40.5;
	//time+=2*60+12;
	//time+=1*60+40.5;
	//time+=2*60+45;
	  
if(mode==0)
{

   {
        
      col=vec3(1.,.25,.1);
      
      
      w.x=R();
      
      w.y=R();
      
      w.z=R();
      
      w.w=R();
	  
	  

	  vec3 camtarget, campos;

	if(time>=3*60+3.5)
	{
		// animals become star constellations
		makeBG(0.0);
		//p.y*=2.;
		p-=.8;
		p.xz*=2;
		p.y+=max(0.,p.z-3.)/2;
		col*=mix(.5,1.,cos(p.x*8)*.5+.5);

		time-=3*60+3.5;
		col*=max(0.,1.-time/12.);
		
		//float time2=time-min(pow(max(time-25.,0.),2.),time);
		float time2=smin(time,25.,10.);
		
		  w.x=R();
		  
		  w.y=R();
		  
		  w.z=R();
		  
		  w.w=R();
			 
		  vec3 op=(w.xyz*2-1)*vec3(1,.5,.1);

		  if(w.w<smoothstep(30.,45.,time))
			  return;

		 w.w=R();

		 if(w.w<.25)
		 {
			of=vec3(0);
			 w.x=R();
			 
			 w.y=R();
			 
			 w.z=R();
			 
			 w.w=R();
			 time*=3;
			ammonite();
			time/=3;
			p=p.zyx;

			 p.xy*=rotmat(.5);

			w.x=R();
			 
			 w.y=R();
			 
			 w.z=R();

			 if(w.z<.05)
			 {
            col=vec3(mix(.5,1.,w.x));
            w.z=R();
            w.y=R();
            if(w.y>.01 && w.z<mix(.03,1.,smoothstep(14.,30.,time)))
            {
                // fake lines
                float pick=R()*30;
                   w.x=R();
                   
                   w.y=R();
                   
                   w.z=R();
                   
                   vec4 w2=w;

               uvec2 old_rstate=rstate;
                  rstate=uvec2(R()*mix(32.,8.,smoothstep(15.,33.,time)));
                vec3 oldpos;
               for(int i=0;i<3;++i)
               {
                   w.x=R();
                   
                   w.y=R();
                   
                   w.z=R();
                   
                   w.w=R();
                   float oldtime=time;
                   time=min(time,28)*3;
                  ammonite();
                  time=oldtime;
                  p=p.zyx;
                  if(pick<float(i))
                  {
                     p=mix(oldpos,p,fract(pick));

                     p+=(w2.xyz*2-1)*.001;
                     p*=1.6;
                     col=vec3(mix(.25,1.,pow(abs(fract(pick)-.5)*2,32.)))*.5;
					 col+=pow(w2.w,8.);
                     break;
                  }

                  oldpos=p;
               }
			   p.z+=smoothstep(15.,45.,time)*.8;

                rstate=old_rstate;

            }
            else
            {
               w.x=R();
                
                w.y=R();
                
                w.z=R();
                p+=(w.xyz*2-1)*pow(max(0.,(time-20.)/10.),2.)*.025;
            }

				 p.z+=.1;
			 }
			 else
			 {
				 p.x-=pow(max(0.,time-fbm(p.xy*3.+99)*8.),3.)*.01;
				 
				 if(p.x<-10.)
				 {
						 float ww=R();
					 if(R()<.05)
					 {
						{
							// fake lines
							float pick=R()*30;
							   w.x=R();
							   
							   w.y=R();
							   
							   w.z=R();
							   
							   vec4 w2=w;

						   uvec2 old_rstate=rstate;
							  rstate=uvec2(R()*3+ww*16);
							vec3 oldpos;
						   for(int i=0;i<3;++i)
						   {
							   w.x=R();
							   
							   w.y=R();
							   
							   w.z=R();
							   
							   w.w=R();
							  p=(w.xyz*2-1)*.1;
							  if(pick<float(i))
							  {
								 p=mix(oldpos,p,fract(pick));

								 p+=(w2.xyz*2-1)*.001;
								 p*=1.6;
								 col=vec3(mix(.25,1.,pow(abs(fract(pick)-.5)*2,32.)))*.5;
								 col+=pow(w2.w,8.);
								 break;
							  }

							  oldpos=p;
						   }

						   p.y+=0;
						   
							rstate=old_rstate;

						}

					 


					 
					if(ww<.3)
					{
						 if(R()<.1)
						 {
						   w.x=R();
						   
						   w.y=R();
						   
						   w.z=R();
						   w.w=R();
						   
						   of=vec3(0);
						   jellyfish();
						   p.yz*=rotmat(.5);
						   p*=.6;
						   p.y+=.11;
						   col=vec3(1);
					   }
						p+=vec3(-.8,.3,0);
					}
					else if(ww<.6)
					{
						 if(R()<.2)
						 {
						   w.x=R();
						   
						   w.y=R();
						   
						   w.z=R();
						   w.w=R();
						   
						   of=vec3(0);
						   ammonite();
						   p.yz*=rotmat(-.5);
						   p*=.6;
						   //p.y+=.15;
						   p=p.zyx;
						   col=vec3(1);
					   }					
						p+=vec3(.6,-.3-.3,0);
					}
					else
					{
						 if(R()<.6)
						 {
							  w.x=R();
			  
							  w.y=R();
							  
							  w.z=R();
							  
							  w.w=R();
								 
							  vec3 op=(w.xyz*2-1)*vec3(1,.5,.1);

							  // fish
							  float d=koi(op.xy);
							  if(max(d,abs(op.z)-.1*pow(-clamp(d,-1,0),.5))<.0)
							  {
								  p=op;
								  p.x=-p.x;
								p.xy*=rotmat(-1.5/2.);
								  p*=.5;
								col=vec3(1);
							  }
						 }
						p+=vec3(.8,.35-.2,0);
					}
					 }
				 

					p.y-=time2/14.-2;

				}
			 }
			 			 
			 p.x-=2;
			 p.y+=time2/14.;

			 float c;

			 

		 }
		 else if(w.w<.26)
		 {
			 w.x=R();
			 
			 w.y=R();
			 
			 w.z=R();
			 
			 w.w=R();
			 p=(w.xyz*2-1)*3;
			 p.x-=2;
			 col=vec3(w.w)/2;
			 w.w=R();
			 col+=vec3(1,1,.5)*pow(.5+.5*cos(w.w*6+time*3),32.)*.1;
		 }
		 else
		 {
			 w.w=R();
			 if(w.w<smoothstep(13.,22.,time))
				return;	
		 }

		
	  campos=vec3(-1.8,.8+time2/15.,-2);
	  camtarget=vec3(-2,.5+time2/14.,0);
		p.xyz+=(w.xyz*2-1)*pow(length(p-campos),2)*.001;
      cameraroll=1.-smoothstep(0.,30.,time);
	  cameraroll2=-smin(0,-(time-40),10.)*.01;
	}
	else if(time>=2*60+45)
	{
		// big koi swims towards camera, with other animals following
		makeBG(0.0);
		p.y*=2.;
		p-=.8;
		p.xz*=.5;

		time-=2*60+45;
		
		  w.x=R();
		  
		  w.y=R();
		  
		  w.z=R();
		  
		  w.w=R();
			 
		  vec3 op=(w.xyz*2-1)*vec3(1,.5,.1);

	float q=9.5+w.w*8.;
	
		if(time>=q)
		 {
			 w.w=R();

			 if(w.w<.25)
			 {
				of=vec3(0);
				 w.x=R();
				 
				 w.y=R();
				 
				 w.z=R();
				 
				 w.w=R();
				 time*=3;
				ammonite();
				time/=3;
				p=p.zyx;
				
				 float t=time-10;
				 
				w.x=R();
				 
				 w.y=R();
				 
				 w.z=R();

				 float c;
				 if(w.x<.1)
				 {
					//t-=w.y*w.y*w.y*2.;
					c=mod(t+w.y,1.+w.z*2);
					t-=c;
					col=mix(col,vec3(1.,.25,1.),c/3.);
				 }
				 
				 p.x=-p.x-10+t;
				p.z+=cos(p.x);
			 p.y+=(p.x - -10)/2-3;
			 
				 if(w.x<.1)
				 {
					p.y+=(fbm(p.xz*2)-.9)*c*.2;
					p.x+=(fbm(p.yz*1)-.9)*c;
				 }
			 }
		 }
		 else if(time>=0)
		 {
		  
		  //col=vec3(1.,.25,.1);
		  // koifish
		  float d=koi(op.xy);
		  if(max(d,abs(op.z)-.1*pow(-clamp(d,-1,0),.5))<.0)
		  {
			  {
				  // koi colours
				  col=mix(vec3(.9),vec3(1.,.25,.1),step(.9,fbm(op.xy*8.+5.)));
				  col=mix(col,vec3(.01),step(1.,fbm(op.xy*8.+15.)));
			  }
			p=op;
			  
		  //col=vec3(.9);p.z-=.5;

			 
			 w.x=R();
			 
			 w.y=R();
			 
			 w.z=R();
			 
			 w.w=R();
			 
			 
			 w.w=R();

			 float t=time;

			 
			 w.x=R();
			 
			 w.y=R();
			 
			 w.z=R();

			 float c;
			 if(w.x<.1)
			 {
				//t-=w.y*w.y*w.y*2.;
				c=mod(t+w.y,1.+w.z*2);
				t-=c;
				col=mix(col,vec3(1.,.25,1.),w.y/3.);
			 }
			 
			 p*=vec3(1.7,2,3);
			 
			 p.z+=.2;
			 
			 //t-=p.x;
			 
			 p.x=-p.x-10+t;
			 p.z+=cos(p.x);
			 p.y+=(p.x - -10)/2-3;
			 
			 if(w.x<.1)
			 {
				p.y+=(fbm(p.xz*2)-.9)*c*.2;
				p.x+=(fbm(p.yz*1)-.9)*c;
			 }

			 //p.z+=exp(-t/2.)+max(0.,t-21.)/5.;
			 float a=p.x*1./p.z-t;
			 //float a=-t;
			 //p.x=0.;
			 //p.xz*=rotmat(a);
			 
			 
			 w.x=R();
			 col+=pow(w.x,32.)*vec3(.2);

			 
			 w.x=R();
			 
			 w.y=R();
			 
			 w.z=R();
			 
			 //p+=normalize(w.xyz*2-1)*max(t/2-20.,0.)/10.;
					  
			 
			 
			 w.w=R();
			 if(w.w<.5)
			 {
				// plants

			 }
			 
		  }
		 }

		p.xyz+=(w.xyz*2-1)*pow(length(p),2)*.001;
		
	  campos=vec3(0,.8,-1);
	  camtarget=vec3(-5,.5,0);
	}
	else if(time>=2*60+28)
	{
		makeBG(0.5);
		// big koi swims around
		time-=2*60+28;
		//p.y*=2.;
		p-=.8;
		//p.xz*=.5;
		  w.x=R();
		  
		  w.y=R();
		p+=sphere(w.xy)*smoothstep(1.,5.,-p.x)*.5;
		p.y+=smoothstep(1.,5.,-p.x)*4.;
		
		  w.x=R();
		  
		  w.y=R();
		  
		  w.z=R();
		  
		  w.w=R();
			 
		  vec3 op=(w.xyz*2-1)*vec3(1,.5,.1);


		 {
		  
		  //col=vec3(1.,.25,.1);
		  // koifish
		  float d=koi(op.xy);
		  if(max(d,abs(op.z)-.1*pow(-clamp(d,-1,0),.5))<.0)
		  {
			  {
				  // koi colours
				  col=mix(vec3(.9),vec3(1.,.25,.1),step(.9,fbm(op.xy*8.+5.)));
				  col=mix(col,vec3(.01),step(1.,fbm(op.xy*8.+15.)));
			  }
			p=op;
			  
		  //col=vec3(.9);p.z-=.5;

			 
			 w.x=R();
			 
			 w.y=R();
			 
			 w.z=R();
			 
			 w.w=R();
			 
			 
			 w.w=R();

			 float t=time;

			 
			 w.x=R();
			 
			 w.y=R();
			 
			 w.z=R();

			 float c;
			 if(w.x<.1)
			 {
				//t-=w.y*w.y*w.y*2.;
				c=mod(t+w.y,1.+w.z*2);
				t-=c;
				col=mix(col,vec3(1.,.25,1.),w.y/3.);
			 }
			 
			 p*=vec3(1.7,2,3);
			 
			 p.z+=.2;
			 
			 //t-=p.x;
			 
			 p.x=-p.x-10+t;
			 p.z+=cos(p.x);
			 //p.y+=(p.x - -10)/2-3;
			 
			 if(w.x<.1)
			 {
				p.y+=(fbm(p.xz*2)-.9)*c*.2;
				p.x+=(fbm(p.yz*1)-.9)*c;
			 }

			 //p.z+=exp(-t/2.)+max(0.,t-21.)/5.;
			 float a=p.x*1./p.z-t;
			 //float a=-t;
			 //p.x=0.;
			 //p.xz*=rotmat(a);
			 
			 
			 w.x=R();
			 col+=pow(w.x,32.)*vec3(.2);

			 
			 w.x=R();
			 
			 w.y=R();
			 
			 w.z=R();
			 
			 //p+=normalize(w.xyz*2-1)*max(t/2-20.,0.)/10.;
					  
			 
			 
			 w.w=R();
			 if(w.w<.5)
			 {
				// plants

			 }
			 
		  }
		 }

		p.xyz+=(w.xyz*2-1)*pow(length(p),2)*.001;
		
	  campos=vec3(3+time/6.,1.8,-1+3);
	  camtarget=vec3(-5,-.5,0);
	}
	else if(time>=2*60+R()*3)
	{
		makeBG(0.5);

		time-=2*60+2;
		
		  w.x=R();
		  
		  w.y=R();
		  
		  w.z=R();
		  
		  w.w=R();
			 
		 float t=time;
		 if(R()<.1)
			 t-=mod(t+R()*3.,3.);
			 
		  bool bigkoi=w.w<smoothstep(17.5,20.,t);

		  vec3 op=(w.xyz*2-1)*vec3(1,.5,.1);
			if(!bigkoi)
			{
				  op.x-=mod(op.x,.1)/3.;
			} 
		 
		  
		  //col=vec3(1.,.25,.1);
		  // fishies
		  float d=koi(op.xy);
		  if(max(d,abs(op.z)-.1*pow(-clamp(d,-1,0),.5))<.0)
		  {
			  if(bigkoi)
			  {
				  // koi colours
				  col=mix(vec3(.9),vec3(1.,.25,.1),step(.9,fbm(op.xy*8.+5.)));
				  col=mix(col,vec3(.01),step(1.,fbm(op.xy*8.+15.)));
			  }
			p=op;
			  
		  //col=vec3(.9);p.z-=.5;

			 
			 w.x=R();
			 
			 w.y=R();
			 
			 w.z=R();
			 
			 w.w=R();
			 
			 
			 w.w=R();

			 p.x=-p.x-6+t/3.;
			 
			 if(p.x>0.&&!bigkoi)
			 {
				 // explosion
				 w.x=R();				 
				 w.y=R();
				 w.z=R();
				 p=sphere(w.xy)*pow(p.x/1.,2.)*pow(w.z,1./3.);
				 p.x=0.;
			 }
			 else
			 {
			    
				 p.z+=sin(p.x);
				 
				 if(!bigkoi)
				 {
					 
					 w.w=R();
				 
					 if(w.w<.33)
					 {
						col=vec3(1.,.25,.1);
					 }
					 else if(w.w<.66)
					 {
						col=vec3(.01);
						p.xz*=rotmat(3.141*.6);
					 }
					 else
					 {
						col=vec3(.5);
						p.xz*=rotmat(3.141*1.2);
					 }
				 }
				 else
				 {
					 p.x*=2.;
					 p.x*=.5;
					 if(p.x<0.)
						 return;
					p.xz*=rotmat(3.141*.25);
					//p.z=-p.z;
				 }
			 
			 }
			 
			 w.x=R();
			 
			 w.y=R();
			 
			 
			 if(bigkoi)
				 p*=vec3(1.7,2,3);
			 
			 p.z+=.2;
			 

			 
			 
			 w.x=R();
			 col+=pow(w.x,32.)*vec3(.2);

			 
			 w.x=R();
			 
			 w.y=R();
			 
			 w.z=R();
			 
			 //p+=normalize(w.xyz*2-1)*max(time/2-20.,0.)/10.;
					  
			 
			 
			 w.w=R();
			 if(w.w<.5)
			 {
				// plants
				p=(w.xyz*2-1)*vec3(.1,.1,.1);
				vec3 op=p;
				p.y-=.3;
				p.xz*=mix(.1,.5*p.y*4.-1.,pow(fract(p.y*8.),4));
				
				w.x=R();
				
				w.y=R();
				//p.z+=floor(w.y*2.)/4.-.5;
				//p.x+=floor(w.x*6.)/3.-1.+p.z/3.;
				p.z+=floor(w.y*18.)/2.;
				p.x+=floor(w.x*18.)/1.-2;
				p.z+=floor(w.y*18.)/2.;
				p.x+=floor(w.x*18.)/1.-2;

				p.x+=fbm(p.yz/2+time/4.)/14.*clamp(p.y+1.25,0,1);
				p.z+=fbm(p.xy/2+time/4.)/14.*clamp(p.y+1.25,0,1);
				p.y-=fbm(p.xz+10.)*.3-.6;
				col=vec3(.3,1.,.3)/7.*clamp(p.y+1.,0,1);
				col=mix(col,vec3(1),length(op.xz)/1.-.12)/4;
				p.y-=.8;
				
				
				w.x=R();
				//col+=pow(w.x,32.)*vec3(1)/3.;
			 }
			 
		  }
		  else
        {
			p+=normalize(p)*sin(clamp((time-17.5-length(p))*3.,0.,3.1415926*2))*.2;
        }
		  
	  camtarget=vec3(0,.5,0);
	  campos=vec3(4.3,0.8,-4.2*.7);
	}
	  else if(time>=1*60+44.5)
	  {
		makeBG(0.01);
		time-=1*60+44.5;
		  // the special fishes swimming
		  
		  float t=time;
		  if(R()<.1)
			  t-=mod(t+R()*3,3.+R());
		  
		  vec3 fp=vec3(-t/4+5,0,0);
		  
		  
					 
			{
				makeBG(0.5);

				  w.x=R();
				  
				  w.y=R();
				  
				  w.z=R();
				  
				  w.w=R();
					 
				  vec3 op=(w.xyz*2-1)*vec3(1,.5,.1);
				op.x-=mod(op.x,.1)/3.;
				  float d=koi(op.xy);
				  if(max(d,abs(op.z)-.1*pow(-clamp(d,-1,0),.5))<.0)
				  {

					p=op;
					  

					 w.x=R();
					 
					 w.y=R();
					 
					 w.z=R();
					 
					 w.w=R();

					 
					 w.w=R();

					 //p.x=-p.x-6+time/3.;
					 

							//col=vec3(1.,.25,.1);

					 
					 
					 w.x=R();
					 
					 w.y=R();
					 
 
					 p.z+=.2;
					 p+=fp;
					 p.z+=sin(p.x*3.)*.1;

					 w.w=R();
				 
					 if(w.w<.33)
					 {
						col=vec3(1.,.25,.1);
					 }
					 else if(w.w<.66)
					 {
						col=vec3(.01);
						p.xz*=rotmat(3.141);
						p.z+=3.;
					 }
					 else
					 {
						col=vec3(.5);
						p.xz*=rotmat(3.141);
						p.x+=2.;
						p.z+=6.;
					 }
					 
					 w.x=R();
					 col+=pow(w.x,32.)*vec3(.2);

					 
					 w.x=R();
					 
					 w.y=R();
					 
					 w.z=R();

					 
					 w.w=R();
					 

				  }
				  else
				  {
					 w.w=R();
					 if(w.w<.2)
					 {
						// plants
						p=(w.xyz*2-1)*vec3(.2,1.,.2);
						vec3 op=p;
						p.y+=.3;
						p.xz*=mix(.1,.5*p.y*4.+1.,pow(fract(p.y*8.),4))*.5;
						
						w.x=R();
						
						w.y=R();
						//p.z+=floor(w.y*2.)/4.-.5;
						//p.x+=floor(w.x*6.)/3.-1.+p.z/3.;
						p.z+=floor(w.y*12.)/2.;
						p.x+=floor(w.x*8.)/1.-2;
						p.x+=cos(floor(w.y*12.));
						p.z+=cos(floor(w.x*8.)*9);
						p.y+=cos(floor(w.x*8.)*9+floor(w.y*8.))-1;
						p.x+=fbm(p.yz/2+t/4.)/14.*clamp(p.y+1.25,0,1);
						p.z+=fbm(p.xy/2+t/4.)/14.*clamp(p.y+1.25,0,1);
						p.y-=fbm(p.xz+10.)*.3-.6;
						col=vec3(.3,1.,.3)/7.*clamp(p.y+1.,0,1);
						col=mix(col,vec3(1),length(op.xz)/1.-.12)/4;
						p.y-=.8;
						
						p.xz+=normalize(p.xz-fp.xz)*(1.-smoothstep(0.,4.,distance(p.xz,fp.xz)))*pow(max(0.,p.y+.5),2.)*.3;
						
						w.x=R();
						col+=pow(w.x,32.)*vec3(1,1.,.5)/3.;
						
						if(p.y<-1)return;
						p.z-=2.;
					 }
				  }
			  camtarget=vec3(0,.5,2);
			  campos=vec3(-1.3,0.8,-4.2*.7-time/5.+2.);
			}
			per=1.;
	  }
	  else if(time>=1*60+18.5)
	  {
		makeBG(0.005);

		time-=1*60+18.5;
		
		//if(w.w<.99)
	//	{
			// little swimming shiny fishies
			 
			 w.x=R();
			 
			 w.y=R();
			 
			 w.z=R();
			 
			 w.w=R();
			 
			 
			 of.xz=floor(w.xy*16)*3;
			 of.y=cos(of.x*7+of.z*3)*5-3;
			 of.x+=cos(of.x*8+of.z)*4;
			 of.z+=(.7+.5*cos(of.x+of.z*10))*4;
			 of.z+=1.;
			 
			 
			 
			 w.x=R();
			 
			 w.y=R();
			 
			 w.z=R();
			 
			 w.w=R();
			 
		  vec3 op=(w.xyz*2-1)*vec3(1,.5,.05);
			  float d=koi(op.xy);
			  if(max(d,abs(op.z)-.1*pow(-clamp(d,-1,0),.5))<.0)
			  {
				  p=op;
				  float t=time;
				  
					 w.x=R();
					 
					 w.y=R();
					w.w=R();
					if(w.w<.1)
						t-=mod(t+w.x,1.+w.y);

								
				  col=mix(vec3(.6,.3,.1),vec3(1),step(abs(p.x),.1))*w.w;
					  p*=vec3(.25,.5,.5);
					  
					 p+=of*.2;
					
					float a=p.x/p.z-t/2;
					p.y+=sin(p.x-t+of.z)*.3;
					p.xz=vec2(cos(a),sin(a))*p.z;
					
						  col=mix(col,vec3(1),pow(sin(p.x*4+t*4)*.5+.5,10)*abs(op.z)*7);
						  col-=pow(sin(p.x*3+t*7)*.5+.5,3)*abs(op.z)*5;

					
					 w.w=R();
					col+=pow(w.w,10)*.4*vec3(1,.5,.1);
					
					 
					 w.w=R();
					col+=pow(w.w,32);
					
					col*=(op.y+.25)*2;
					col*=.5+.7*smoothstep(0.,.05,-op.z);
					col*=1.5;
					p.z+=cos(p.x+t)/3.;
			}
			
		//	}
	  camtarget=vec3(-7,.5,5);
	  //campos=vec3(4.3,-.8,-4.2*.7);
	  campos=vec3(2.3+time/5.,-.8,4-time/4.-2);
	 
	w.w=R();
	  if(w.w<smoothstep(10.,15.,time))
	  {
		  camtarget=vec3(0,.5,0);
		  campos=vec3(4.3,-.8,-4.2*.7); 
			 w.x=R();
			 
			 w.y=R();
			 
			 p+=sphere(w.xy)*.4*(1.-smoothstep(10.,20.,time));
	  }
	  
	  
	  }
	  else if(time>=1*60+1)
	  {
		makeBG(0.005);
		  		time-=1*60+1;
				
			  w.w=R();
			if(w.w<.2)
			{
				// ammonites
				 
				 w.x=R();
				 
				 w.y=R();
				 
				 w.z=R();
				 
				 w.w=R();
				 
				 of.xz=floor(w.xy*3)*7-7;
				 of.y=cos(of.x*7+of.z*3)*3;
				 of.x+=cos(of.x*8+of.z)*4;
				 of.z+=cos(of.x+of.z*10)*4;
				 
					 
					 w.x=R();
					 
					 w.y=R();
					 
					 w.z=R();
					 
					 w.w=R();
					 
					 ammonite();

				 
				p+=of/4.;
				p.y+=-.5;
				
			}
	  camtarget=vec3(0,.5,0);
	  campos=vec3(3.+time/8,-.8,-4.2*.7);
	  }
	  else if(time>=0*60+43)
	  {
		makeBG(0.005);
		  		time-=0*60+43;
				
			  w.w=R();
			  
			if(w.w<.2)
			{
				// jellyfish
				 w.x=R();
				 
				 w.y=R();
				 
				 w.z=R();
				 
				 w.w=R();
				 
				 of.xz=floor(w.xy*6)*7-15;
				 of.y=cos(of.x*7+of.z*3)*3;
				 of.x+=cos(of.x*8+of.z)*4;
				 of.z+=cos(of.x+of.z*10)*4;
	 
				if(jellyfish())return;
			}
			
		w.x=R();
		w.y=R();
		w.z=R();
		p.xyz+=sphere(w.xy)*pow(w.z,1./3.)*pow(max(0.,1.-time/2.),2.)*.1;
		
			  camtarget=vec3(0,.5,0);
			  campos=vec3(0,-.8,-2.2*.7);
			  float a=time/2*.1;
			  campos.xz=vec2(cos(a),sin(a))*-5.2*.7;
	  }
	  else if(time>=0)
	  {
		  // open ocean
		makeBG(0.05);
		p.xz*=.75;
		  		time-=0;
				
			  w.w=R();
			  
		w.x=R();
		w.y=R();
		w.z=R();
		p.xyz+=(w.xyz*2-1)*mix(0.,.08,.5+.5*cos(time/5+p.x+3.));
		zoom=.3;
		
		w.x=R();
			  camtarget=vec3(0,.5,0);
			  campos=mix(vec3(0,2.5,-2.2*.7),vec3(1,-1,1.),step(w.x,smoothstep(13.,22.,time)));
			  campos=mix(campos,vec3(0,5,.1),step(w.x,smoothstep(27.,37.,time)));
col*=1.5;
			  float a=time/4*.1;
			  campos.xz=vec2(cos(a),sin(a))*-5.2*.7;
	  }


	
      // camera      
         p.y+=.5;
        			
      
	 vec3 r=normalize(camtarget-campos);
	 vec3 s=normalize(cross(vec3(0,1,0),r));
	 vec3 t=cross(s,r);
	  mat3 cammat=mat3(s,-t,r);
	 
	  p-=campos;
	  p=transpose(cammat)*p;
		p.xy*=rotmat(sin(time/2)*.05*cameraroll+cameraroll2);//roll
   
   // floatiness
	  p.y+=(fbm(vec2(time/16))-.5)*.1*cameraroll;
	  p.x+=(fbm(vec2(time/14+10))-.5)*.1*cameraroll;
   
   // depth of field
		
		w.x=R();
		w.y=R();
		p.xy+=disc(w.xy)*smoothstep(7.,10.,p.z)/4;

		 w.x=R();
		 w.y=R();				 
		 p.xy+=disc(w.xy)*smoothstep(.7,1.,length(p.xy))*.06*per;

				 
      //col=mix(vec3(.5,.5,1.),col,exp(-p.z/200));
   
   if(p.z>0)
   {
      p.xy/=p.z*zoom;
	  
      p.x/=1280./720;
      p.xy=(p.xy/2+.5)*vec2(1280,720);
      uint x=uint(p.x);
      uint y=uint(p.y);
      
      if(x>0&&y>0&&x<1279&&y<719){
         
         col=clamp(col,0,1);
         
         vec3 w=vec3(0);
         
         
         w.x=R();
         
         w.y=R();
         
         w.z=R();
         
         uint colbits=uint(col.z*31+w.x)|(uint(col.y*63+w.y)<<5)|(uint(col.x*31+w.z)<<11);
         
          uint depthbits=uint(clamp(1./(1.+p.z),0,1)*65535.);
          
          uint outbits=(depthbits<<16)|colbits;
          
          imageAtomicMax(d0,ivec2(x+1,y+0),int((coord.x+0)&7),outbits);
          imageAtomicMax(d0,ivec2(x-1,y+0),int((coord.x+2)&7),outbits);
          imageAtomicMax(d0,ivec2(x+0,y-1),int((coord.x+4)&7),outbits);
          imageAtomicMax(d0,ivec2(x+0,y+1),int((coord.x+6)&7),outbits);

         
      }
   }
   }
}
else
{
      ivec2 coord=ivec2(gl_GlobalInvocationID.xy);
   if(coord.x<1280&&coord.y<720)
   {      
      vec4 c=vec4(0);
      const int sampleCount = 8;
      for(int sampleIndex = 0; sampleIndex < sampleCount; ++sampleIndex)
      {
         uint x=imageLoad(d0,coord, sampleIndex).x,idepth=(x>>16),icol=x&0xffff;

         if(idepth==0)
         {
            continue;
         }
         
         float depth=65535./float(idepth)-1.;
         
         float a=0.,wsum=0.;
         for(int i=0;i<4;++i)
         {
            vec4 w;
            
            w.x=R();
            
            w.y=R();
            uint x2=imageLoad(d0,coord+ivec2((w.x-.5)*4.*w.y*8,w.y*w.y*64), sampleIndex).x;

            if(x2<x)//||x<x2-0xa0000000)
               a+=1;
            
            wsum+=1;

         }
         
         vec3 col=vec3(float(icol>>11)/31.,float((icol>>5)&63)/63.,float(icol&31)/31.)*mix(vec3(.5,.5,1.)*.01*0,vec3(1),a/wsum);
         
		 // fog
         col=mix(vec3(.25,.5,1.)*mix(.6,1.,a/wsum),col,exp2(-depth/200));
               
         c.rgb+=clamp(col,0,1);
         c.w+=1.;
      }
      c/=float(sampleCount);
      
	  vec3 bg=vec3(.02)*vec3(.7,.9,1.)*.6;
		if(time>=3*60+20)
			bg*=max(0.,1.-(time-(3*60+20))/7.);
		
      c.rgb=mix(bg,c.rgb,c.w)*3*(1.-smoothstep(.2,1.,distance(vec2(coord),vec2(640,360))/880.));
      	  
	  c*=min(1.,time/20.)*(smoothstep(0.,3.,abs(time-(1*60+18.5))))*(smoothstep(0.,1.,abs(time-(1*60+1))))
			*(smoothstep(0.,1.,abs(time-(2*60+28))))*(smoothstep(0.,1.,abs(time-(2*60+45))));      
	  
	  if(time<0*60+43)
		  c*=1.-smoothstep(0*60+42,0*60+43,time);
	  
      c.rgb=c.rgb/(c.rgb+.4)*1.3;
      c.rgb=pow(c.rgb,vec3(1,1.1,1.2));
      c.a=1.;
      imageStore(outtex,coord,vec4(sqrt(c.rgb)+vec3(R(),R(),R())/255.,1));
   }
}
}
