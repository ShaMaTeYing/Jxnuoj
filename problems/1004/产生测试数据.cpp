#include<cstdio>
#include<cstdlib>
#include<ctime>
#include<cstring>
#define LL long long
//函数功能：求出整数n二进制表示中1的个数
LL getOneNumber(LL n)
{
    LL cnt=0;
    while(n)
        n&=n-1,cnt++;
    return cnt;
}
LL getRandom(LL n)
{
    LL sum=0;
    for(int i=1;i<=n;i++)
        sum=sum*10+rand()%10;
    while(!sum) sum=rand()%10;
    return sum;
}
int main()
{
    LL a,b;
    FILE *fin=fopen("in.txt","w"),*fout=fopen("out.txt","w");
    srand(time(NULL));
    char str[]="!@#$%^&*()_+ \t";
    //puts(str);
    for(LL i=1;i<=300;i++)
        for(LL j=1;j<=300;j++)
        {
            char ch;
            int tmp=rand()%4;
            if(tmp==0) ch='0'+rand()%10;
            else if(tmp==1) ch='a'+rand()%26;
            else if(tmp==2) ch='A'+rand()%26;
            else ch=str[rand()%strlen(str)];
           fprintf(fin,"%c",ch);

            //fprintf(fout,"%lld %lld\n",a,b);
        }
        fprintf(fin,"%c",'?');
    return 0;
}
