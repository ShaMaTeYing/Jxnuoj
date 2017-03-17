#include<cstdio>
#include<iostream>
#define LL long long
using namespace std;
int main()
{
    //freopen("in.txt","r",stdin);
    //freopen("out.txt","w",stdout);
    string s;
    int a=0,b=0,c=0;
    char ch;
    while((ch=getchar())&&(ch!='?'))
    {
        if('0'<=ch&&ch<='9') a++;
        else if('a'<=ch&&ch<='z') b++;
        else if('A'<=ch&&ch<='Z') b++;
        else c++;
    }
    printf("%d %d %d\n",a,b,c);
    return 0;
}
