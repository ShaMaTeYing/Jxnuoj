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
    char str[]="!@#$%^&*()_+ \n\t";
    //puts(str);
    int num=100000;

    for(LL i=1;i<=5;i++)
    {
     //fprintf(fin,"%d\n",num);
        for(LL j=1;j<=num;j++)
        {
          //  if(rand()%2) fprintf(fin,"-");
           fprintf(fin,"%c",'a'+rand()%26);

            //fprintf(fout,"%lld %lld\n",a,b);
        }
        fprintf(fin,"\n");

    }
        //fprintf(fin,"%c",'?');
    return 0;
}
