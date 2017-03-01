#include<iostream>
#include<cstdio>
using namespace std;
int n;
int f(int x)
{
    return (1+x)*x/2;
}
int main()
{
    while(~scanf("%d",&n))
    {
        int p=1;
        while(f(p)<n) p++;
        n-=f(p-1);
        int fz=1,fm=p;
        while(--n) fz++,fm--;
        printf("%d/%d\n",fz,fm);
    }
    return 0;
}
