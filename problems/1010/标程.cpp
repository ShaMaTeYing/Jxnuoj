#include<cstdio>
#include<iostream>
#include<cmath>
#define LL long long

using namespace std;
int main()
{
   // freopen("in.txt","r",stdin);
    //freopen("out.txt","w",stdout);
    int x;
    while(cin>>x)
    {
        double y;
        double pi=acos(-1.0);
        if(x>0) y=(sqrt(x*1.0)+exp(x))/(5.0*x+5);
        else y=(2.0/3+sin(pi/3.0))*(fabs(x*1.0));
        printf("%.2lf\n",y);
    }

    return 0;
}
