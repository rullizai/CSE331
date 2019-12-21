#include<htc.h>
#define _XTAL_FREQ 20e6
#define rs RD6
#define en RD7
#define r0 RC0
#define r1 RC1
#define r2 RC2
#define r3 RC3
#define c0 RC4
#define c1 RC5
#define c2 RC6
#define c3 RC7

void lcdcmd  (unsigned char);
void lcddata (unsigned char);
void disp_num(float num);
int get_num  (char ch);
void lcdinit ();
char scan_key(void);




unsigned char s[]= {"ENTER 1 NO= "};
unsigned char s1[]={"ENTER 2 NO= "};
unsigned char s2[]={"OPERATOR = "};
unsigned char s3[]={"***RESULT***"};

void lcdinit(){
 __delay_ms(400);	lcdcmd(0x30);	__delay_ms(400);	lcdcmd(0x30);
__delay_ms(400);	lcdcmd(0x30);	__delay_ms(400);	lcdcmd(0x38);
    lcdcmd(0x0F);
    lcdcmd(0x01);
    lcdcmd(0x06);
    lcdcmd(0x80);
}


void main (void)
  {
	  TRISC=0xF0;        //Rows Output, Coulombs Input
	  TRISB=0x00;        //Port-B as Output
      TRISD6=0;          //Port-D PIN-6 as Output
      TRISD7=0;          //Port-D PIN-7 as Output
	  __delay_ms(400);
	   
   unsigned int count=0;
   int k2,k1; 
   char ke,key,key1;
   lcdinit();        //Initializing Lcd
      PORTC=0xF0;
 while(1){   
      while(s[count]!='\0')     //Displaying String s on LCD
      {
        lcddata(s[count]);
        count++;
      }

ke=scan_key();   //Scan the First Digit
k2=get_num(ke);  //Converting Char into number
//lcddata(ke);     //Display First Digit on LCD
lcdcmd(0x01);
count=0;

while(s2[count]!='\0')    //Displaying String s2 on LCD
{
lcddata(s2[count]);
count++;
}

key=scan_key();  //Scaning operator
//lcddata(key);    //Display operator on lcd
lcdcmd(0x01);
count=0;

while(s1[count]!='\0')  //Displaying String s1 on LCD
{
lcddata(s1[count]);
count++;
}

key1=scan_key();  //Scan Second digit
k1=get_num(key1); //Converting Char into number
//lcddata(key1);    //Displaying Second Digit on lcd
lcdcmd(0x01);
lcdcmd(0x82);
count=0;

while(s3[count]!='\0')  //Displaying String s3 on LCD
{
lcddata(s3[count]);
count++;
}
count=0;
lcdcmd(0xC0);
lcddata(ke);
lcddata(key);
lcddata(key1);
lcddata(' ');
lcddata('=');

switch(key)
{
case '+':
disp_num(k1+k2);
break;
case '-':
disp_num(k2-k1);
break;
case '*':
disp_num(k2*k1);
break;
case '/':
disp_num((float)k2/k1);
break;
}

}
}

void lcdcmd(unsigned char value)
  {
    PORTB = value;      
    rs = 0;
    en = 1;            
    __delay_ms(100);
    en = 0;
    __delay_ms(100);    
  }
void lcddata(unsigned char value)
  {
    PORTB = value;  
    rs = 1;
    en = 1;          
    __delay_ms(100);
    en = 0;
    __delay_ms(100);
  }
  


char scan_key()
{
unsigned char c='s',d;
while(c!='a')
{
r0=1;r1=0;r2=0;r3=0;
if(c0==1 ){ lcddata('7');__delay_ms(500);d= '7';c='a';}
if(c1==1 ){ lcddata('8');__delay_ms(500);d= '8';c='a';}
if(c2==1 ){ lcddata('9');__delay_ms(500);d= '9';c='a';}
if(c3==1 ){ lcddata('/');__delay_ms(500);d= '/';c='a';}
  
r0=0;r1=1;r2=0;r3=0;

if(c0==1 ){ lcddata('4');__delay_ms(500);d= '4';c='a';}
if(c1==1 ){ lcddata('5');__delay_ms(500);d= '5';c='a';}
if(c2==1 ){ lcddata('6');__delay_ms(500);d= '6';c='a';}
if(c3==1 ){ lcddata('*');__delay_ms(500);d= '*';c='a';}

r0=0;r1=0;r2=1;r3=0;

if(c0==1 ){ lcddata('1');__delay_ms(500);d= '1';c='a';}
if(c1==1 ){ lcddata('2');__delay_ms(500);d= '2';c='a';}
if(c2==1 ){ lcddata('3');__delay_ms(500);d= '3';c='a';}
if(c3==1 ){ lcddata('-');__delay_ms(500);d= '-';c='a';}

r0=0;r1=0;r2=0;r3=1;

if(c1==1 ){ lcddata('0');__delay_ms(500);d= '0';c='a';}
if(c3==1 ){ lcddata('+');__delay_ms(500);d= '+';c='a';}
}
return d;
}


int get_num(char ch)         //convert char into int
{
switch(ch)
{
case '0': return 0; break;
case '1': return 1; break;
case '2': return 2; break;
case '3': return 3; break;
case '4': return 4; break;
case '5': return 5; break;
case '6': return 6; break;
case '7': return 7; break;
case '8': return 8; break;
case '9': return 9; break;
}
return 0;
}

void disp_num(float num)            //displays calculated value on LCD
{
unsigned char UnitDigit     ;  //It will contain unit digit of number
unsigned char TenthDigit    ;  //It will contain 10th position digit of number
unsigned char decimal       ;  //Contains Value after decimal digit 
int j=0,numb;

j=(int)(num*10);
numb=(int)num;

if(numb<0)
{
numb = -1*numb;  // Make number positive
lcddata('-');	// Display a negative sign on LCD
}

TenthDigit = (numb/10);	         // Findout Tenth Digit

if( TenthDigit != 0)	         // If it is zero, then don't display
lcddata(TenthDigit+0x30);	 // Make Char of TenthDigit and then display it on LCD

UnitDigit = numb - (TenthDigit*10);

lcddata(UnitDigit+0x30);	 // Make Char of UnitDigit and then display it on LCD
lcddata('.');
decimal=(char)(j%10);
lcddata(decimal+0x30);
__delay_ms(3000);
lcdcmd(0x01);
}
